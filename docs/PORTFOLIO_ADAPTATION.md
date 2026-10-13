# Portfolio Adaptation Notes — E-commerce Conversion Funnel

**Portfolio owner:** Pranav S.  
**Project type:** Independent learning and portfolio adaptation  
**Dataset:** Google Analytics 4 public e-commerce sample dataset  
**Tools:** BigQuery SQL, Tableau

## Business questions to investigate

1. Does the product-view rate differ by device category?
2. Which traffic sources bring sessions that reach `add_to_cart` and `purchase`?
3. Which funnel transition has the largest loss after product views?
4. Are landing-page patterns consistent across traffic sources?

## My analysis workflow

- Run and inspect the supplied SQL before interpreting its results.
- Validate the unique session definition and check for missing session IDs.
- Recalculate each funnel stage using distinct sessions; do not sum event rows as if they were sessions.
- Compare conversion rates by source/medium and device, controlling for the date range.
- Record actual query outputs and add a short findings section only after the query has been run.

## Extension ideas to complete before presenting

- Add a source/medium conversion table and a device-level funnel comparison in BigQuery or Tableau.
- Include a data-quality check for null session identifiers and duplicate session-stage combinations.
- Add a recommendation tied to a measured segment, not just the overall conversion rate.

## Source and attribution

This repository is an adaptation for learning and portfolio development, not a claim that the original project was created from scratch by the portfolio owner. The upstream README credits **Alexandr Rudenko** and describes this as a GoIT final project. Review the upstream repository and its license/terms before redistribution: https://github.com/ . The GA4 public sample dataset is provided by Google BigQuery.

## Completion checklist

- [ ] Run SQL in BigQuery and record execution date and row counts.
- [ ] Verify the funnel metrics against the dashboard.
- [ ] Make at least one new analysis and explain the result in my own words.
- [ ] Publish screenshots from the dashboard I actually inspected or modified.
