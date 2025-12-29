/*
=====================================================
BI & TABLEAU VIEWS
Purpose:
- Single source of truth for dashboards
=====================================================
*/

-- =========================
-- CUSTOMER KPI VIEW
-- =========================
CREATE VIEW customer_kpis AS
SELECT
    c.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.revenue) AS total_revenue,
    AVG(o.revenue) AS avg_order_value,
    DATE_PART('day', CURRENT_DATE - MAX(o.order_date)) AS recency_days,
    c.country
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.country;

-- =========================
-- CHURN FLAG VIEW
-- =========================
CREATE VIEW customer_churn AS
SELECT
    *,
    CASE
        WHEN recency_days > 180 THEN 1
        ELSE 0
    END AS churn_flag
FROM customer_kpis;
