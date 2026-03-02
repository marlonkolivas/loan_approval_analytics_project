-- Create indexes to improve query performance on frequently filtered/grouped columns
CREATE INDEX idx_loan_approved ON loan_applications_clean (loan_approved);
CREATE INDEX idx_credit_score ON loan_applications_clean (credit_score);
CREATE INDEX idx_income ON loan_applications_clean (annual_income);

-- Purpose:
-- Adds indexes to optimize filtering, grouping, and aggregation operations.
-- Improves performance for approval analysis and dashboard queries.