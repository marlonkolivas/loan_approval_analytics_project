-- Validate import: check total number of rows loaded
SELECT COUNT(*) AS row_count 
FROM loan_applications_raw;

-- Purpose:
-- Confirms that the CSV import completed successfully
-- and that the number of rows matches the original dataset.
