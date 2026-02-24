-- =====================================================
-- Customer Analysis
-- Purpose: Identify top customers, calculate Customer Lifetime Value (CLV),
--          and analyze purchasing behavior including order frequency.
-- Author: Shivratna Waghmode
-- Project: Retail Sales Analysis
-- =====================================================

--Top 5 customers 
SELECT 
    customerid,
    SUM(revenue) AS total_spent
FROM retail_final
GROUP BY customerid
ORDER BY total_spent DESC
LIMIT 5;

--Customer lifetime value
SELECT 
    customerid,
    COUNT(DISTINCT invoiceno) AS total_orders,
    SUM(revenue) AS lifetime_value
FROM retail_final
GROUP BY customerid
ORDER BY lifetime_value DESC;
