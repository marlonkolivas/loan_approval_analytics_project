# Loan Approval Analytics Project
### Dataset

This project uses the Loan Approval Dataset from Kaggle.

- Source: **Kaggle**
- Size: 1,000 records
- Features: Demographics, financial attributes, employment status, and loan approval outcome.

Dataset link:
[Loan Approval Dataset](https://www.kaggle.com/datasets/amineipad/loan-approval-dataset)
  
## Day 1 - Data Preparation & Feature Engineering (MySQL)

This project analyzes a loan approval dataset to evaluate how applicant characteristics such as credit score, income, and employment status influence loan approval outcomes.

**Day 1** focused on building a structured and reproducible data pipeline in MySQL to transform raw CSV data into an analytics-ready dataset for dashboarding and KPI analysis.

### Day 1 Objectives

- Create a dedicated project database
- Import raw loan data into MySQL
- Perform ingestion validation checks
- Clean and type-cast data into structured formats
- Engineer derived analytical features
- Generate core approval KPIs
- Optimize performance with indexing

### Database Structure

#### Raw Table - load_applications_raw
- Stores imported CSV data
- All columns defined as VARCHAR to prevent ingestion errors

#### Clean Table – loan_applications_clean
- Removed whitespace and converted blanks to NULL
- Cast numeric fields to appropriate types (UNSIGNED, DECIMAL)
- Enforced binary target (loan_approved as 0/1)
- Validated numeric ranges and target integrity

#### Analytics View – vw_loan_dashboard_dataset
Created derived features for reporting and dashboard use:
- Loan-to-Income Ratio
- Credit Score Bands (Poor → Excellent)
- Income Bands (Low → High)
- Existing Loan Segments

#### Data Quality Checks
Performed structured validation including:
- Row count verification post-import
- Target distribution (0/1 approval balance)
- Categorical consistency checks
- Missing value quantification
- Numeric range validation (credit score confirmed 300–849)

#### Core KPIs Generated
- Total applications: 1,000
- Total approvals: 729
- Overall approval rate
  
  <img width="389" height="66" alt="image" src="https://github.com/user-attachments/assets/115b2875-d5bf-4288-982e-855cf14fa512" />
The overall loan approval rate is 72.9%, with 729 approvals out of 1,000 applications.
This indicates a relatively high approval ratio, suggesting that the lending policy reflected in this dataset is moderately permissive rather than highly conservative.
- Approval rate by:
  - **Credit score band**
    
    <img width="323" height="109" alt="image" src="https://github.com/user-attachments/assets/78f306e1-f930-469d-91c5-840ef5403e6b" />

    Credit score emerged as the strongest predictor. Approval rates exceeded 90% for applicants in the ‘Very Good’ and ‘Excellent’ bands, but dropped sharply to 56.9% for ‘Poor’ credit borrowers. The 37-point gap confirms that underwriting decisions are highly sensitive to credit quality.

  - **Income band**

    <img width="270" height="82" alt="image" src="https://github.com/user-attachments/assets/73b0d338-eefa-4586-8630-1616d432e2e3" />

    While both income and credit score influence approval decisions, credit score exhibits a stronger and more consistent predictive relationship with approval probability.

  - **Employment status**

     <img width="333" height="80" alt="image" src="https://github.com/user-attachments/assets/1cfad062-ac7a-48bf-afeb-3a1354d4e790" />

     Credit score emerged as the strongest approval driver, with a 37-point gap between the highest and lowest credit bands. Employment stability was the second most influential factor, with unemployed applicants experiencing significantly lower approval rates. Income influenced approvals primarily at the lower end, functioning more as a threshold than a graded risk indicator.


Approval rates were calculated efficiently using the binary target:<br>
`SUM(loan_approved) / COUNT(*)`

#### Performance Optimization
Indexes created on:
- loan_approved
- credit_score
- annual_income

Improves filtering and aggregation performance for dashboard queries.
