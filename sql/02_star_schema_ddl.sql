CREATE TABLE dim_geography (
    geo_id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE dim_cardtype (
    card_type_id SERIAL PRIMARY KEY,
    card_type VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    age_group VARCHAR(30),
    credit_score_group VARCHAR(20),
    balance_category VARCHAR(20),
    tenure INT,
    isactivemember INT,
    hascrcard INT
);

CREATE TABLE fact_churn (
    customer_id INT PRIMARY KEY REFERENCES dim_customer(customer_id),
    geo_id INT REFERENCES dim_geography(geo_id),
    card_type_id INT REFERENCES dim_cardtype(card_type_id),
    creditscore INT,
    balance NUMERIC(15, 2),
    estimatedsalary NUMERIC(15, 2),
    point_earned INT,
    satisfaction_score INT,
    complain INT,
    exited INT
);