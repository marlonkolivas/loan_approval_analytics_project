-- Range validation query
-- Validate numeric ranges after type conversion
SELECT
  MIN(age) AS min_age, 
  MAX(age) AS max_age,

  MIN(annual_income) AS min_income, 
  MAX(annual_income) AS max_income,

  MIN(loan_amount) AS min_loan, 
  MAX(loan_amount) AS max_loan,

  MIN(credit_score) AS min_score, 
  MAX(credit_score) AS max_score
FROM loan_applications_clean;

-- Purpose:
-- Confirms numeric fields were converted correctly and checks for unrealistic values.
-- Helps detect casting errors, outliers, or corrupted data early in the pipeline.