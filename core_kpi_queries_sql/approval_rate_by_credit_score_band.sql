-- Calculate approval rate by credit score segment
SELECT
  credit_score_band,
  COUNT(*) AS applications,
  ROUND(100 * SUM(loan_approved)/COUNT(*), 2) AS approval_rate_pct
FROM vw_loan_dashboard_dataset
GROUP BY credit_score_band
ORDER BY approval_rate_pct DESC;

-- Purpose:
-- Analyzes loan approval performance across credit score segments.
-- Identifies how approval rates vary by borrower risk profile.