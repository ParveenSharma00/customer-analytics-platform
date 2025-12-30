📊 Customer Growth, Retention & Revenue Analytics
🔍 Business Objective

This project analyzes transactional e-commerce data to understand customer behavior, revenue drivers, retention patterns, and churn risk.
The goal is to enable data-driven decisions around customer segmentation, retention strategy, and revenue growth using an end-to-end analytics pipeline.

🏢 Business Context

The dataset represents a UK-based online retail company selling gift-ware products.
Customers include both individual buyers and wholesalers, making customer value differentiation and churn identification critical for business growth.

🛠️ Tech Stack

SQL: CTEs, Window Functions, RFM Analysis, Cohort Logic
Python: Pandas, NumPy, SciPy
Statistics: Hypothesis Testing, Correlation Analysis
Machine Learning: Scikit-learn (PCA, K-Means Clustering)
Visualization: Tableau Public (Executive Dashboards)
Version Control: Git & GitHub

## 📂 Project Structure
<img width="568" height="462" alt="image" src="https://github.com/user-attachments/assets/b0bcc08a-35c9-4496-8b48-e80f95427246" />

### About Dataset
## Context
This Online Retail II data set contains all the transactions occurring for a UK-based and registered, non-store online retail between 01/12/2009 and 09/12/2011.The company mainly sells unique all-occasion gift-ware. Many customers of the company are wholesalers.

### Content Attribute Information:

InvoiceNo: Invoice number. Nominal. A 6-digit integral number uniquely assigned to each transaction. If this code starts with the letter 'c', it indicates a cancellation.
StockCode: Product (item) code. Nominal. A 5-digit integral number uniquely assigned to each distinct product.
Description: Product (item) name. Nominal.
Quantity: The quantities of each product (item) per transaction. Numeric.
InvoiceDate: Invice date and time. Numeric. The day and time when a transaction was generated.
UnitPrice: Unit price. Numeric. Product price per unit in sterling (Â£).
CustomerID: Customer number. Nominal. A 5-digit integral number uniquely assigned to each customer.
Country: Country name. Nominal. The name of the country where a customer resides.

Raw and cleaned datasets are excluded from the repository due to size constraints.
The project uses the publicly available Online Retail II dataset from Kaggle.

🔄 End-to-End Workflow

1️⃣ Data Cleaning & Preparation (Python)
Removed cancelled invoices, invalid transactions, and missing customers
Engineered revenue and recency features
Standardized schema for analytics readiness

2️⃣ SQL Analytics & RFM Modeling
Built customer-level metrics using CTEs
Calculated Recency, Frequency, and Monetary values
Created business-ready customer segments

3️⃣ Exploratory Data Analysis & Statistics
Revenue distribution and Pareto (80/20) analysis
Customer behavior correlation analysis
Hypothesis testing to validate repeat customer value

4️⃣ Machine Learning Segmentation
Feature scaling and dimensionality reduction using PCA
K-Means clustering to identify customer personas
Translated ML clusters into business-friendly segments

5️⃣ Executive Visualization (Tableau)
Designed KPI-driven dashboards for leadership
Enabled dynamic filtering by customer segment
Visualized churn risk, revenue concentration, and customer value


📈 Tableau Public Dashboard

🔗 Live Dashboard:
https://public.tableau.com/shared/MC9SRKTC2?:display_count=n&:origin=viz_share_link

Dashboard Highlights:
Executive KPIs: Total Revenue, Total Customers, Avg Revenue per Customer, Churn Rate
Customer Segmentation: Distribution and revenue contribution by segment
Retention Analysis: Recency and churn risk across segments
Revenue Concentration: Pareto analysis showing high-value customer impact

🧠 Key Insights
A small percentage of customers drive the majority of revenue, confirming the Pareto principle
High-frequency customers generate statistically higher revenue than one-time buyers
Recency is a strong churn signal, with clear separation across customer segments
ML-driven segmentation enables targeted retention and growth strategies
Executive dashboards allow quick, actionable decision-making
