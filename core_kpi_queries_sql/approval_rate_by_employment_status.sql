-- Calculate approval rate by employment status
SELECT
  employment_status,
  COUNT(*) AS applications,
  ROUND(100 * SUM(loan_approved)/COUNT(*), 2) AS approval_rate_pct
FROM vw_loan_dashboard_dataset
GROUP BY employment_status
ORDER BY approval_rate_pct DESC;

-- Purpose:
-- Analyzes approval performance across employment categories.
-- Identifies whether employment type influences loan approval likelihood.