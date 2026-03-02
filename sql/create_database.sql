-- Create project database (safe to re-run)
CREATE DATABASE IF NOT EXISTS loan_approval_analytics;

-- Set active schema for this session
USE loan_approval_analytics;

-- Purpose:
-- Initializes a dedicated database environment for the loan approval analytics project
-- and ensures all subsequent tables and objects are created in the correct schema.