--Monthly revenue trend
SELECT 
    DATE_TRUNC('month', invoicedate) AS month,
    SUM(revenue) AS monthly_revenue
FROM retail_final
GROUP BY month
ORDER BY month;


--Revenue by country
SELECT 
    country,
    SUM(revenue) AS total_revenue
FROM retail_final
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;
