-- Check blank or NULL values in key numeric fields (raw table)
SELECT
  SUM(CASE WHEN applicant_id IS NULL OR TRIM(applicant_id) = '' THEN 1 ELSE 0 END) AS applicant_id_blank,
  SUM(CASE WHEN age IS NULL OR TRIM(age) = '' THEN 1 ELSE 0 END) AS age_blank,
  SUM(CASE WHEN annual_income IS NULL OR TRIM(annual_income) = '' THEN 1 ELSE 0 END) AS annual_income_blank,
  SUM(CASE WHEN loan_amount IS NULL OR TRIM(loan_amount) = '' THEN 1 ELSE 0 END) AS loan_amount_blank,
  SUM(CASE WHEN credit_score IS NULL OR TRIM(credit_score) = '' THEN 1 ELSE 0 END) AS credit_score_blank,
  SUM(CASE WHEN loan_approved IS NULL OR TRIM(loan_approved) = '' THEN 1 ELSE 0 END) AS loan_approved_blank
FROM loan_applications_raw;

-- Purpose:
-- Counts NULL or empty string values in key fields before cleaning.
-- Uses CASE WHEN to convert logical conditions into numeric flags (1 or 0) for aggregation.