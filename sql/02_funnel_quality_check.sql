-- Portfolio extension: validate GA4 funnel session identifiers and stage coverage.
-- Run in BigQuery. This query is an additional quality check, not a replacement for the original query.
WITH base AS (
  SELECT
    user_pseudo_id,
    (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS ga_session_id,
    event_name
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
    AND event_name IN ('session_start','view_item','add_to_cart','begin_checkout','add_shipping_info','add_payment_info','purchase')
), identified AS (
  SELECT *, CONCAT(user_pseudo_id, '-', CAST(ga_session_id AS STRING)) AS user_session_id FROM base
)
SELECT
  event_name,
  COUNT(*) AS event_rows,
  COUNTIF(user_session_id IS NULL OR ga_session_id IS NULL) AS rows_missing_session_id,
  COUNT(DISTINCT user_session_id) AS distinct_sessions
FROM identified
GROUP BY event_name
ORDER BY CASE event_name
  WHEN 'session_start' THEN 1 WHEN 'view_item' THEN 2 WHEN 'add_to_cart' THEN 3
  WHEN 'begin_checkout' THEN 4 WHEN 'add_shipping_info' THEN 5
  WHEN 'add_payment_info' THEN 6 WHEN 'purchase' THEN 7 ELSE 8 END;
