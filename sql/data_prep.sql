/*
=====================================================
DATA PREPARATION & CLEANING
Purpose:
- Apply business rules
- Prepare analytics-ready data
- I enforced domain-driven cleaning rules to ensure revenue accuracy.
=====================================================
*/

-- Create a cleaned transactional staging table
CREATE TABLE retail_cleaned AS
SELECT
    CAST(order_id AS VARCHAR) AS order_id,
    CAST(customer_id AS INT) AS customer_id,
    order_date,
    product_id,
    product_name,
    quantity,
    unit_price,
    quantity * unit_price AS revenue,
    country
FROM retail_raw
WHERE
    -- Remove cancelled invoices
    order_id NOT LIKE 'C%'
    -- Remove invalid customers
    AND customer_id IS NOT NULL
    -- Remove negative or zero values
    AND quantity > 0
    AND unit_price > 0;
