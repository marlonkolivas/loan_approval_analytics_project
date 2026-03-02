-- Check distribution of employment_status (includes total using ROLLUP)
SELECT 
    IFNULL(employment_status, 'Total') AS employment_status,
    COUNT(*) AS total_applications
FROM loan_applications_raw
GROUP BY employment_status WITH ROLLUP;

-- Purpose:
-- Reviews employment_status categories to detect inconsistencies or NULL values.
-- WITH ROLLUP adds a grand total row, and IFNULL labels it clearly as 'Total'.