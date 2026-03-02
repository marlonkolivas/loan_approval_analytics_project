-- Post-transformation validation

-- Validate clean table: check total row count
SELECT COUNT(*) AS row_count 
FROM loan_applications_clean;

-- Verify target distribution after type conversion (0/1 integrity check)
SELECT 
    loan_approved, 
    COUNT(*) AS total_applications
FROM loan_applications_clean
GROUP BY loan_approved;

-- Preview cleaned data sample for structural validation
SELECT * 
FROM loan_applications_clean 
LIMIT 20;

-- Purpose:
-- Confirms that the clean table was created correctly,
-- validates target values remain 0/1 after casting,
-- and visually inspects transformed fields for correctness.
