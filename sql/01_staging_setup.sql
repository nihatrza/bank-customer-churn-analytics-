CREATE TABLE stg_customer_churn (
    CustomerId INT PRIMARY KEY,
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance NUMERIC(15, 2),
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary NUMERIC(15, 2),
    Exited INT,
    Complain INT,
    Satisfaction_Score INT,
    Card_Type VARCHAR(20),
    Point_Earned INT,
    Age_Group VARCHAR(30),
    Credit_Score_Group VARCHAR(20),
    Balance_Category VARCHAR(20),
    Satisfaction_Level VARCHAR(20)
);

-- Copy data from CSV into staging table
-- COPY stg_customer_churn FROM '/path/to/cleaned_customer_churn.csv' DELIMITER ',' CSV HEADER;