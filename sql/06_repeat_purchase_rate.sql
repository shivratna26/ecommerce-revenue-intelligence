-- =====================================================
-- Repeat Purchase Rate Analysis
-- Purpose: Identify repeat customers and calculate
--          repeat purchase percentage to measure
--          customer loyalty and retention.
-- Author: Shivratna Waghmode
-- Project: Retail Sales Analysis
-- =====================================================

--Repeat purchase rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END)::numeric 
        / COUNT(*) * 100, 2
    ) AS repeat_rate_percentage
FROM (
    SELECT customerid, COUNT(DISTINCT invoiceno) AS order_count
    FROM retail_final
    GROUP BY customerid
) t;
