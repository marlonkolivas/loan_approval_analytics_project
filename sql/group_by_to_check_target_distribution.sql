-- Check target distribution (approval vs rejection)
SELECT 
  loan_approved, 
  COUNT(*) AS total_applications
FROM loan_applications_raw
GROUP BY loan_approved;

-- Purpose:
-- Examines the distribution of the target variable (loan_approved)
-- to understand class balance and detect unexpected values.

-- I examined the target distribution early to confirm data integrity and assess potential class imbalance before proceeding with cleaning and analysis.