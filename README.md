# 🛒 E-Commerce Business Performance Analysis

## 📌 Project Overview
This project simulates a real-world Data Analyst role for Olist, a major Brazilian e-commerce platform. I engineered a relational database in PostgreSQL using over 100,000 real orders to analyze fulfillment health, regional profitability, and month-over-month (MoM) revenue growth. 

**Tools Used:** PostgreSQL, pgAdmin 4, SQL (CTEs, Window Functions, Aggregate Functions, Complex Joins, Date Math).



<img width="1119" height="525" alt="dashboard" src="https://github.com/user-attachments/assets/78b3d4a9-e688-4d90-8451-81b9bdde97d2" />

## 📊 Key Business Insights Discovered
1. **The Black Friday Surge:** Utilized CTEs and `LAG()` Window Functions to calculate MoM growth, uncovering a massive **52.37% revenue spike** in November 2017.
2. **Logistical Efficiency:** Calculated date intervals between purchase and delivery timestamps, proving the operations team improved average delivery times from **~19 days (2016) to 11.8 days (2018)**.
3. **Regional Revenue Centers:** Executed multi-table joins to map customer geography to finalized payments (excluding canceled orders), identifying **São Paulo ($2.1M)** and **Rio de Janeiro ($1.1M)** as the primary target markets for future advertising spend.
4. **Product Profitability:** Bypassed "data fan-out" traps by accurately isolating product sticker price from freight costs, revealing **Health & Beauty** as the top grossing category ($1.25M+).

## 🛠️ Database Schema
The analysis was performed across 4 normalized tables:
* `customers`: Geographic profiles.
* `orders`: Timestamps and fulfillment status.
* `order_items`: Granular product and freight costs.
* `order_payments`: Final transaction values and payment methods.

*Note: View the attached `.sql` files for the complete query scripts.*
