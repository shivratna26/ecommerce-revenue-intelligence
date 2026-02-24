-- =====================================================
-- Data Cleaning & Preparation
-- Purpose: Create tables, import raw CSV data, clean records,
--          perform data type casting, and prepare final dataset
--          for analytical processing.
-- Author: Shivratna Waghmode
-- Project: Retail Sales Analysis
-- =====================================================

DROP TABLE online_retail;

CREATE TABLE online_retail AS
SELECT
    invoiceno,
    stockcode,
    description,
    quantity::INTEGER AS quantity,
    TO_TIMESTAMP(invoicedate, 'DD/MM/YYYY HH24:MI') AS invoicedate,
    unitprice::NUMERIC AS unitprice,
    NULLIF(customerid, '')::NUMERIC AS customerid,
    country
FROM online_retail_raw;

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'online_retail';

--Final Clean table
CREATE TABLE retail_final AS
SELECT *,
       quantity * unitprice AS revenue
FROM online_retail
WHERE quantity > 0
AND unitprice > 0
AND customerid IS NOT NULL;

--Count rows
SELECT COUNT(*) FROM retail_final;