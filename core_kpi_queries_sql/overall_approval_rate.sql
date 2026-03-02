-- Calculate overall portfolio approval metrics
SELECT
  COUNT(*) AS total_applications,
  SUM(loan_approved) AS approved_count,
  ROUND(100 * SUM(loan_approved)/COUNT(*), 2) AS approval_rate_pct
FROM loan_applications_clean;

-- Purpose:
-- Computes total applications, total approved loans, and overall approval rate.
-- Uses the binary target (0/1) to efficiently calculate approval counts and percentages.