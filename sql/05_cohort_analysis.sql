-- =====================================================
-- Cohort Analysis
-- Purpose: Analyze customer retention trends by cohort month
--          using first purchase data and retention indexing.
-- Author: Shivratna Waghmode
-- Project: Retail Sales Analysis
-- =====================================================

--Cohort analysis

--customer first purchase
WITH first_purchase AS (
    SELECT 
        customerid,
        DATE_TRUNC('month', MIN(invoicedate)) AS cohort_month
    FROM retail_final
    GROUP BY customerid
)
SELECT *
FROM first_purchase
LIMIT 10;

--Full cohort table
WITH first_purchase AS (
    SELECT 
        customerid,
        DATE_TRUNC('month', MIN(invoicedate)) AS cohort_month
    FROM retail_final
    GROUP BY customerid
),
monthly_activity AS (
    SELECT 
        customerid,
        DATE_TRUNC('month', invoicedate) AS order_month
    FROM retail_final
)
SELECT 
    f.cohort_month,
    m.order_month,
    COUNT(DISTINCT m.customerid) AS active_customers
FROM first_purchase f
JOIN monthly_activity m 
    ON f.customerid = m.customerid
GROUP BY f.cohort_month, m.order_month
ORDER BY f.cohort_month, m.order_month;

--Retension index
WITH first_purchase AS (
    SELECT 
        customerid,
        DATE_TRUNC('month', MIN(invoicedate)) AS cohort_month
    FROM retail_final
    GROUP BY customerid
),
cohort_data AS (
    SELECT 
        f.customerid,
        f.cohort_month,
        DATE_TRUNC('month', r.invoicedate) AS order_month,
        EXTRACT(YEAR FROM AGE(DATE_TRUNC('month', r.invoicedate), f.cohort_month)) * 12 +
        EXTRACT(MONTH FROM AGE(DATE_TRUNC('month', r.invoicedate), f.cohort_month)) 
        AS month_number
    FROM first_purchase f
    JOIN retail_final r 
        ON f.customerid = r.customerid
)
SELECT 
    cohort_month,
    month_number,
    COUNT(DISTINCT customerid) AS active_customers
FROM cohort_data
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;