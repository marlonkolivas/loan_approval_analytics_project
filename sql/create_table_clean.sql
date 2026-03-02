-- Create clean table

DROP TABLE IF EXISTS loan_applications_clean;

-- Create cleaned and typed version of the raw dataset
-- Converts text fields to proper numeric types and standardizes blanks to NULL
CREATE TABLE loan_applications_clean AS
SELECT
  -- Standardize applicant_id (remove whitespace, convert empty string to NULL)
  NULLIF(TRIM(applicant_id), '') AS applicant_id,

  -- Convert age to integer
  CAST(NULLIF(TRIM(age), '') AS UNSIGNED) AS age,

  -- Clean categorical fields (remove extra spaces, convert blanks to NULL)
  NULLIF(TRIM(gender), '') AS gender,
  NULLIF(TRIM(marital_status), '') AS marital_status,
  NULLIF(TRIM(employment_status), '') AS employment_status,

  -- Remove commas and convert income and loan amounts to numeric format
  CAST(NULLIF(REPLACE(TRIM(annual_income), ',', ''), '') AS DECIMAL(12,2)) AS annual_income,
  CAST(NULLIF(REPLACE(TRIM(loan_amount), ',', ''), '') AS DECIMAL(12,2)) AS loan_amount,

  -- Convert remaining numeric fields
  CAST(NULLIF(TRIM(credit_score), '') AS UNSIGNED) AS credit_score,
  CAST(NULLIF(TRIM(num_dependents), '') AS UNSIGNED) AS num_dependents,
  CAST(NULLIF(TRIM(existing_loans_count), '') AS UNSIGNED) AS existing_loans_count,

  -- Convert target variable to numeric binary (0/1)
  CAST(NULLIF(TRIM(loan_approved), '') AS UNSIGNED) AS loan_approved

FROM loan_applications_raw;

-- Purpose:
-- Transforms raw imported data into a structured, analysis-ready table.
-- Cleans whitespace, standardizes missing values, and enforces correct data types.
-- Separates ingestion layer (raw) from analytics layer (clean).