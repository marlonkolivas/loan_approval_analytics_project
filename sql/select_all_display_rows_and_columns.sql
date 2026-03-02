-- Validate import: preview sample rows
SELECT * 
FROM loan_applications_raw 
LIMIT 10;

-- Purpose:
-- Performs a quick visual inspection of the imported data
-- to verify correct column alignment, formatting, and overall integrity.