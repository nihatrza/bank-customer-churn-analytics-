-- Insert Geography Dimensions
INSERT INTO dim_geography (country)
SELECT DISTINCT Geography FROM stg_customer_churn;

-- Insert Card Type Dimensions
INSERT INTO dim_cardtype (card_type)
SELECT DISTINCT Card_Type FROM stg_customer_churn;

-- Insert Customer Dimensions
INSERT INTO dim_customer (customer_id, gender, age, age_group, credit_score_group, balance_category, tenure, isactivemember, hascrcard)
SELECT CustomerId, Gender, Age, Age_Group, Credit_Score_Group, Balance_Category, Tenure, IsActiveMember, HasCrCard 
FROM stg_customer_churn;

-- Insert Fact Data
INSERT INTO fact_churn (customer_id, geo_id, card_type_id, creditscore, balance, estimatedsalary, point_earned, satisfaction_score, complain, exited)
SELECT 
    s.CustomerId, g.geo_id, c.card_type_id, s.CreditScore, s.Balance, s.EstimatedSalary, s.Point_Earned, s.Satisfaction_Score, s.Complain, s.Exited
FROM stg_customer_churn s
JOIN dim_geography g ON s.Geography = g.country
JOIN dim_cardtype c ON s.Card_Type = c.card_type;

-- Drop Staging Table post-ETL
DROP TABLE stg_customer_churn;