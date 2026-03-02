-- Calculate approval rate by income segment
SELECT
  income_band,
  COUNT(*) AS applications,
  ROUND(100 * SUM(loan_approved)/COUNT(*), 2) AS approval_rate_pct
FROM vw_loan_dashboard_dataset
GROUP BY income_band
ORDER BY income_band;

-- Purpose:
-- Evaluates how loan approval rates vary across income segments.
-- Helps assess whether income level significantly influences approval decisions.