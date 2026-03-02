-- Preview analytics view to verify derived fields and structure
SELECT * 
FROM vw_loan_dashboard_dataset 
LIMIT 20;

-- Purpose:
-- Performs a visual inspection of the dashboard-ready view.
-- Confirms derived fields (ratios and bands) are calculated correctly
-- and ensures the dataset is ready for Tableau connection.