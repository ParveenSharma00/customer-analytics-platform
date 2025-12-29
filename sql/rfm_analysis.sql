/*
=====================================================
RFM ANALYSIS
R - Recency
F - Frequency
M - Monetary
Purpose:
- Identify high-value and churn-risk customers
-used window functions and NTILE for relative customer ranking instead of hard thresholds
=====================================================
*/

-- =========================
-- STEP 1: CUSTOMER METRICS
-- =========================
WITH customer_metrics AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_purchase_date,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(revenue) AS monetary
    FROM orders
    GROUP BY customer_id
),

-- =========================
-- STEP 2: RECENCY CALCULATION
-- =========================
rfm_base AS (
    SELECT
        customer_id,
        DATE_PART('day', CURRENT_DATE - last_purchase_date) AS recency,
        frequency,
        monetary
    FROM customer_metrics
),

-- =========================
-- STEP 3: RFM SCORING
-- NTILE used for relative ranking
-- =========================
rfm_scores AS (
    SELECT
        customer_id,
        NTILE(5) OVER (ORDER BY recency ASC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency DESC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary DESC) AS m_score
    FROM rfm_base
)

-- =========================
-- STEP 4: BUSINESS SEGMENTS
-- =========================
SELECT
    customer_id,
    r_score,
    f_score,
    m_score,
    CASE
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
        WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal Customers'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        WHEN r_score = 1 THEN 'Churned'
        ELSE 'Others'
    END AS customer_segment
FROM rfm_scores;
