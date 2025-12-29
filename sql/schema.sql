/*
=====================================================
SCHEMA DESIGN
Project: Customer Growth, Retention & Revenue Analytics
Dataset: Online Retail II
Purpose:
- Normalize transactional data
- Enable scalable analytics (RFM, cohorts, BI, ML)
separated customer, order, and item-level data to support scalable analytics and BI reporting.
=====================================================
*/

-- =========================
-- CUSTOMER MASTER TABLE
-- =========================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    country VARCHAR(50)
);

-- =========================
-- ORDERS FACT TABLE
-- Grain: One row per order
-- =========================
CREATE TABLE orders (
    order_id VARCHAR(20),
    customer_id INT,
    order_date TIMESTAMP,
    revenue DECIMAL(12,2),
    PRIMARY KEY (order_id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =========================
-- ORDER ITEMS TABLE
-- Grain: One row per product per order
-- =========================
CREATE TABLE order_items (
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    product_name TEXT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
