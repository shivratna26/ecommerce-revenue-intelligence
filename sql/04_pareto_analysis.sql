-- =====================================================
-- Pareto (80/20) Analysis
-- Purpose: Segment customers using revenue contribution,
--          apply NTILE(5) ranking, and evaluate revenue
--          distribution across percentiles.
-- Author: Shivratna Waghmode
-- Project: Retail Sales Analysis
-- =====================================================

--Pareto rule
WITH customer_revenue AS (
    SELECT 
        customerid,
        SUM(revenue) AS total_revenue
    FROM retail_final
    GROUP BY customerid
),
ranked AS (
    SELECT *,
           NTILE(5) OVER (ORDER BY total_revenue DESC) AS percentile_group
    FROM customer_revenue
)
SELECT 
    percentile_group,
    SUM(total_revenue) AS revenue_by_group
FROM ranked
GROUP BY percentile_group
ORDER BY percentile_group;
