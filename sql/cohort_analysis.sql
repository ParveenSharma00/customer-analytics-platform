/*
=====================================================
COHORT & RETENTION ANALYSIS
Purpose:
- Understand customer retention over time
-Cohort analysis helped identify how retention decays over customer lifetime.
=====================================================
*/

-- =========================
-- STEP 1: FIRST PURCHASE DATE
-- =========================
WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
),

-- =========================
-- STEP 2: COHORT ASSIGNMENT
-- =========================
cohort_data AS (
    SELECT
        o.customer_id,
        DATE_TRUNC('month', f.first_order_date) AS cohort_month,
        DATE_TRUNC('month', o.order_date) AS order_month
    FROM orders o
    JOIN first_purchase f
        ON o.customer_id = f.customer_id
)

-- =========================
-- STEP 3: RETENTION MATRIX
-- =========================
SELECT
    cohort_month,
    EXTRACT(YEAR FROM AGE(order_month, cohort_month)) * 12 +
    EXTRACT(MONTH FROM AGE(order_month, cohort_month)) AS cohort_index,
    COUNT(DISTINCT customer_id) AS active_customers
FROM cohort_data
GROUP BY cohort_month, cohort_index
ORDER BY cohort_month, cohort_index;
