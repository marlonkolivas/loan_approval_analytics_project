-- Verify indexes created on the clean table
SHOW INDEX FROM loan_applications_clean;

-- Purpose:
-- Confirms that performance indexes were successfully created.
-- Allows inspection of index names, indexed columns, and index types.