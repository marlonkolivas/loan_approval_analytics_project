-- Create analytics-ready view for dashboarding and reporting

-- Uses clean table as the source and adds engineered features
CREATE OR REPLACE VIEW vw_loan_dashboard_dataset AS
SELECT
  applicant_id,
  age,
  gender,
  marital_status,
  employment_status,

  annual_income,
  loan_amount,
  credit_score,
  num_dependents,
  existing_loans_count,
  loan_approved,

  -- Loan-to-income ratio (risk indicator)
  CASE
    WHEN annual_income > 0 AND loan_amount IS NOT NULL
      THEN loan_amount / annual_income
    ELSE NULL
  END AS loan_to_income_ratio,

  -- Credit score segmentation (standard lending bands)
  CASE
    WHEN credit_score IS NULL THEN 'Unknown'
    WHEN credit_score < 580 THEN 'Poor'
    WHEN credit_score BETWEEN 580 AND 669 THEN 'Fair'
    WHEN credit_score BETWEEN 670 AND 739 THEN 'Good'
    WHEN credit_score BETWEEN 740 AND 799 THEN 'Very Good'
    ELSE 'Excellent'
  END AS credit_score_band,

  -- Income segmentation
  CASE
    WHEN annual_income IS NULL THEN 'Unknown'
    WHEN annual_income < 40000 THEN 'Low'
    WHEN annual_income BETWEEN 40000 AND 90000 THEN 'Middle'
    ELSE 'High'
  END AS income_band,

  -- Existing loan segmentation
  CASE
    WHEN existing_loans_count IS NULL THEN 'Unknown'
    WHEN existing_loans_count = 0 THEN 'None'
    WHEN existing_loans_count BETWEEN 1 AND 2 THEN '1-2'
    ELSE '3+'
  END AS existing_loans_band

FROM loan_applications_clean;

-- Purpose:
-- Creates a reusable analytics layer with derived metrics and segmentation.
-- Prepares structured features for dashboard visualization and KPI analysis.
-- Keeps business logic centralized instead of embedding it in Tableau.