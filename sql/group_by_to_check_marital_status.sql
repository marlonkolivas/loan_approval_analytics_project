-- Check distribution of marital_status (includes total using ROLLUP)
SELECT 
    IFNULL(marital_status, 'Total') AS marital_status,
    COUNT(*) AS total_applications
FROM loan_applications_raw
GROUP BY marital_status WITH ROLLUP;

-- Purpose:
-- Reviews the distribution of marital_status to identify unexpected categories or NULL values.
-- WITH ROLLUP provides a grand total for validation, and IFNULL labels the total row clearly.