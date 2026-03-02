-- Drop raw table if it already exists (allows script to be re-run safely)
DROP TABLE IF EXISTS loan_applications_raw;

-- Create raw table to store imported CSV data
-- All columns are VARCHAR to prevent import failures due to formatting issues
CREATE TABLE loan_applications_raw (
  applicant_id          VARCHAR(50),
  age                   VARCHAR(50),
  gender                VARCHAR(50),
  marital_status        VARCHAR(50),
  annual_income         VARCHAR(50),
  loan_amount           VARCHAR(50),
  credit_score          VARCHAR(50),
  num_dependents        VARCHAR(50),
  existing_loans_count  VARCHAR(50),
  employment_status     VARCHAR(50),
  loan_approved         VARCHAR(50)
);

-- Purpose:
-- Establishes a raw staging table for CSV import.
-- Uses flexible VARCHAR types to avoid type conversion errors during ingestion.
-- Data will be cleaned and typed properly in a separate clean table.