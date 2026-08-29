-- Query 1: High-Level Executive KPIs
SELECT 
    COUNT(customer_id) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND((SUM(exited)::NUMERIC / COUNT(customer_id)) * 100, 2) AS churn_rate_pct,
    ROUND((SUM(complain)::NUMERIC / COUNT(customer_id)) * 100, 2) AS complaint_rate_pct,
    ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction_score
FROM fact_churn;

-- Query 2: Impact of Complaints on Attrition Rate
SELECT 
    complain,
    COUNT(customer_id) AS customer_count,
    SUM(exited) AS churned_count,
    ROUND((SUM(exited)::NUMERIC / COUNT(customer_id)) * 100, 2) AS churn_rate_pct
FROM fact_churn
GROUP BY complain;

-- Query 3: Regional & Card Product Performance Breakdown
SELECT 
    g.country,
    c.card_type,
    COUNT(f.customer_id) AS total_customers,
    SUM(f.exited) AS churned_customers,
    ROUND((SUM(f.exited)::NUMERIC / COUNT(f.customer_id)) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(f.balance), 2) AS avg_balance
FROM fact_churn f
JOIN dim_geography g ON f.geo_id = g.geo_id
JOIN dim_cardtype c ON f.card_type_id = c.card_type_id
GROUP BY g.country, c.card_type
ORDER BY g.country, churn_rate_pct DESC;

-- Query 4: Age Group on Attrition Rate
SELECT 
    c.age_group,
    COUNT(f.customer_id) AS total_customers,
    SUM(f.exited) AS churned_customers,
    ROUND((SUM(f.exited)::NUMERIC / COUNT(f.customer_id)) * 100, 2) AS churn_rate_pct
FROM fact_churn f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.age_group
ORDER BY churn_rate_pct DESC;