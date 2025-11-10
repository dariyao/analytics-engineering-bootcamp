# Northwind Traders: End-to-End Dimensional Data Warehouse

> 🌐 **[View Project Website](https://dariyao.github.io/analytics-engineering-bootcamp/)** | 📊 **[View Dashboards](https://dariyao.github.io/analytics-engineering-bootcamp/#dashboards)**

An end-to-end analytics engineering project that transforms raw transactional data into a production-ready dimensional data warehouse with interactive business intelligence dashboards.

---

## What This Project Does

This project replicates Northwind Traders' legacy on-premise MySQL dataset into **BigQuery (Raw)** and builds a modern data warehouse using dimensional modeling principles. The result: three interactive Tableau dashboards that enable stakeholders to analyze sales performance, monitor inventory health, and track customer behaviour—without slowing down operational systems.

![Dashboard Demo](docs/media/hero.gif)

**Business Impact:**
- Sales team can identify top products and sales agents at a glance.
- Operations can proactively reorder low-stock items.
- Leadership can analyze customer trends and order completion rates.

---

## Tech Stack

- **Cloud Platform:** Google Cloud Platform (GCP)
- **Data Warehouse:** BigQuery
- **Transformation Tool:** dbt
- **Visualization:** Tableau Desktop
- **Methodology:** Kimball Dimensional Modeling

---

## Architecture

The project follows a **4-layer data pipeline architecture:**
Data Lake (Raw in BigQuery) → Staging (Cleaned) → Data Warehouse (Star Schema) → Reporting (OBT — served to Tableau)


### Layer Breakdown

| Layer | Purpose | Key Actions |
|-------|---------|-------------|
| **Data Lake** | Raw Data Storage | Loaded the Northwind OLTP source into BigQuery Raw |
| **Staging** | Data Cleansing | Removed duplicates, handled nulls, standardized formats. |
| **Data Warehouse** | Star Schema Design | Built dimension tables + fact tables using Kimball Methodology |
| **Reporting (OBT)** | Dashboard-Ready Tables | Denormalized One Big Table views for fast queries (served to Tableau) |

---

## Dimensional Model

### Business Processes Identified
1. **Sales Overview** - Track sales performance, top products, agent metrics.
2. **Product Inventory** - Monitor stock levels, identify reorder needs.
3. **Customer Reporting** - Analyze customer behaviour and order patterns.
4. ~~Sales Agent Tracking~~ - Consolidated into Sales Overview

### Fact Tables (3)
- **fact_sales:** Sales transactions at order line level.
- **fact_inventory:** Inventory snapshots by product.
- **fact_purchase_order:** Purchase order history.

### Dimension Tables (4)
- **dim_customer:** Customer details.
- **dim_employee:** Employee information.
- **dim_product:** Product catalog with categories.
- **dim_date:** Calendar dimension for time-based analysis.

📊 **[ERD](./docs/erd.png) • [Source to Target](./docs/references/northwind_source_to_target_mapping.xlsx)**

---

## dbt Project Structure

```
models/
├── staging/
│   ├── source.yml
│   ├── stg_customer.sql
│   ├── stg_employee_privileges.sql
│   ├── stg_employees.sql
│   ├── stg_inventory_transaction_types.sql
│   ├── stg_inventory_transactions.sql
│   ├── stg_invoices.sql
│   ├── stg_order_details.sql
│   ├── stg_order_details_status.sql
│   ├── stg_order_status.sql
│   ├── stg_orders.sql
│   ├── stg_orders_tax_status.sql
│   ├── stg_privileges.sql
│   ├── stg_products.sql
│   ├── stg_purchase_order_details.sql
│   ├── stg_purchase_order_status.sql
│   ├── stg_purchase_orders.sql
│   ├── stg_shippers.sql
│   ├── stg_strings.sql
│   └── stg_suppliers.sql
├── warehouse/
│   ├── dim_customer.sql
│   ├── dim_date.sql
│   ├── dim_employees.sql
│   ├── dim_products.sql
│   ├── fact_inventory.sql
│   ├── fact_purchase_order.sql
│   ├── fact_sales.sql
│   └── schema.yml
└── analytics_obt/
    ├── obt_customer_reporting.sql
    ├── obt_product_inventory.sql
    └── obt_sales_overview.sql
```

---

## Dashboards
*Note: Metrics reflect the current Northwind demo snapshot in this repo.*

### 1. Sales Overview
**Answers:** How much did we sell? What are our top products? Who are our best-performing agents?

**Key Metrics:**
- Total Sales: $68,137
- Average Order Value: $1,703
- Top Product: Beer
- Top Sales Agent: Nancy Freehafer

![Sales Overview Dashboard](docs/dashboard_screens/sales_overview.png)

---

### 2. Product Inventory
**Answers:** Which products need reordering? What are our sales by category? What's our inventory health?

**Key Metrics:**
- On-Hand Units: 1,641
- Total SKUs: 23
- Low-Stock Items: 19 (Flagged for Reorder)
- Inventory Health: 39.13% Healthy, 8.7% Watch, 52.2% Reorder

![Product Inventory Dashboard](docs/dashboard_screens/product_inventory.png)

---

### 3. Customer Overview
**Answers:** Who are our top customers? Where are they located?

**Key Metrics:**
- Active Customers: 14
- Order Completion Rate: 93%
- Top Customer by Order Volume: Elizabeth Andersen
- Geographic Distribution: Visualized on US Map

![Customer Overview Dashboard](docs/dashboard_screens/customer_overview.png)

---

## What I Learned

### Technical Skills
- Designing dimensional models using bus matrices and star schemas.
- Implementing slowly changing dimensions.
- Writing modular SQL with dbt (staging → marts → reporting).
- BigQuery optimization (partitioning, denormalization).
- Data profiling and quality checks.

### Design Thinking
- **Start with business questions:** I identified business processes first, then designed the data model to answer those questions.
- **Trade-offs matter:** Denormalization in the OBT layer sacrifices storage for query speed—but for dashboards, that's the right call.
- **Consolidation > Duplication:** Combining Sales Overview + Sales Agent reports reduced duplication significantly.

### What I'd Do Differently
- Implement dbt Documentation
- Three customers had NULL for their location, I would go back to the business to clarify these.
- For accuracy, join sales_overview to customer_overview in order to visualize orders by total sales, rather than total orders.

---

## About This Project

This project was built as part of an analytics engineering bootcamp on Udemy. I extended the original coursework by designing and building **three interactive Tableau dashboards** (not part of the course).

**Why this project matters for my portfolio?**  
It demonstrates end-to-end ownership—from requirements gathering and dimensional modeling to dbt implementation and dashboard design. It shows I can think like a stakeholder (what questions need answering?) and execute like an engineer (how do I build it efficiently?).

---

**Author:** Dariya Ostrovska  
📧 dariyaostrovska@gmail.com | 🌐 [Portfolio](https://dariyao.github.io/analytics-engineering-bootcamp/) | 💼 [LinkedIn](https://linkedin.com/in/dariyaostrovska)