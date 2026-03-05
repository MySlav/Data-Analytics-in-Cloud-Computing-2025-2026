# EX_1 — Cloud service models for analytics (IaaS / PaaS / Serverless / SaaS)

In this exercise we compute the same **4 aggregate metrics** using different cloud service models:

- **IaaS:** Azure VM + Python script  
- **PaaS (classic):** Azure SQL Database + SQL queries  
- **Serverless:** Azure Functions (HTTP endpoint returning JSON)  
- **SaaS (optional):** Power BI Service (browser report)

> Full step-by-step instructions are in **`EX_1_instructions.pdf`**.

---

## Dataset

**File:** `cloud_orders.csv`  
Synthetic orders dataset used across all parts of the exercise.

Key fields:
- `order_id`, `order_date`, `region`, `product`, `units`, `revenue_usd`, ...

Metrics to compute (same everywhere):
1. **Total orders** = `COUNT(*)`
2. **Total revenue (USD)** = `SUM(revenue_usd)`
3. **Average order value (USD)** = `AVG(revenue_usd)`
4. **Top product by revenue** = `MAX(SUM(revenue_usd))` grouped by product

---

## Files in this folder

- `EX_1_instructions.pdf` — full lab instructions (Azure VM / Azure SQL / Functions / optional BI)
- `cloud_orders.csv` — dataset
- `agg_metrics.py` — Python script that calculates the metrics from the CSV (used in the IaaS VM part)
- `azure_sql_create_table.sql` — SQL script to create the table in Azure SQL Database
- `azure_sql_metrics.sql` — SQL queries that calculate the required metrics

---