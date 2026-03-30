# 🛒 Pakistan E-Commerce Sales 
### End-to-End Analysis of 500,000+ Transactions (2016–2018)

> Uncovering revenue patterns, fulfillment gaps, and consumer behavior across Pakistan's largest e-commerce dataset — through a complete data pipeline from raw CSV to interactive Power BI dashboard.

---

## 🚀 Project Overview

This project delivers a full-stack data analytics solution on a real-world Pakistan e-commerce dataset with over **500,000 transactions**. It covers everything from raw data ingestion and relational modeling to DAX-powered KPIs and executive dashboarding — built to answer real business questions about sales performance, order fulfillment, and seasonal demand spikes.

**Business Questions Answered:**
- When do revenue spikes happen, and why?
- Which product categories drive the most value?
- Why is the cancellation rate so high, and who is responsible?
- Which categories have the best and worst fulfillment rates?

---

## 🛠️ Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| 🐍 Data Processing | Python (Pandas, NumPy) | Data cleaning, transformation & ETL |
| 🗄️ Data Storage | PostgreSQL | Relational modeling (Star Schema) |
| 📊 Visualization | Power BI + DAX | Interactive dashboards & KPI metrics |

---



---

## 🔄 Data Pipeline

```
Raw CSV Data
    │
    ▼
Python (Pandas) ──► Data Cleaning & ETL
    │                (nulls, duplicates, type casting, status normalization)
    ▼
PostgreSQL ──────► Star Schema Modeling
    │                (Fact: Orders | Dims: Category, Date, Payment, Customer)
    ▼
Power BI ────────► DAX Measures & Dashboard
                   (Revenue KPIs, Fulfillment %, Time Intelligence)
```

---

## 📉 Key Insights

### 🔺 1. The November Revenue Spike (+300%)
Revenue surged nearly **300% during the "11.11" (Singles' Day) Mega Sale** — consistently the single highest revenue day across all three years in the dataset. This validates the outsized impact of flash sale events on e-commerce revenue in Pakistan.

### ❌ 2. The Fulfillment Gap — A 34% Cancellation Problem
Over **34% of all orders were cancelled** (~201K out of 585K total orders). Analysis points to **Cash on Delivery (COD)** as a primary driver — a payment method that inflates order volume without guaranteeing conversion.

### 📱 3. Mobiles & Tablets Dominate Revenue
The **Mobiles & Tablets** category alone accounts for over **40% of total revenue** (~2bn+ out of 4.99bn PKR), dwarfing all other categories including Appliances and Entertainment.

### ✅ 4. Best-Performing Fulfillment Categories
Categories like **Soghaat, Books, Health & Sports**, and **Beauty & Grooming** show the highest order fulfillment rates (~60–80%), suggesting higher buyer intent and less COD dependency.

---

## 📸 Dashboard Preview

![Executive Sales Performance Dashboard](salesPerformance.pdf)

> **Dashboard Features:** Total Revenue KPI (4.99bn PKR) · Total Orders (585K) · Avg Order Value (8.53K PKR) · Revenue by Category · Time-Series Revenue Trend · Order Status Breakdown · Fulfillment % by Category · Filters by Payment Method & Year

---

## 🧹 Data Cleaning Highlights

- Standardized inconsistent `status` labels → unified `status_clean` column (Completed / Cancelled / Refunded / Pending / Others)
- Handled ~15% missing values across customer and payment fields
- Parsed and normalized `working_date` for time-series analysis
- Removed duplicate transaction records
- Engineered derived columns: `order_value_bucket`, `fulfillment_flag`, `is_sale_event`

---

## 🗄️ Star Schema Design

```
                    ┌─────────────────┐
                    │   dim_date      │
                    │─────────────────│
                    │ date_id (PK)    │
                    │ year            │
                    │ quarter         │
                    │ month           │
                    │ is_sale_event   │
                    └────────┬────────┘
                             │
┌──────────────┐    ┌────────▼────────┐    ┌─────────────────┐
│ dim_category │    │   fact_orders   │    │  dim_payment    │
│──────────────│    │─────────────────│    │─────────────────│
│ category_id  │◄───│ order_id (PK)   │───►│ payment_id (PK) │
│ category_name│    │ date_id (FK)    │    │ payment_method  │
└──────────────┘    │ category_id(FK) │    └─────────────────┘
                    │ payment_id (FK) │
                    │ revenue         │
                    │ status_clean    │
                    └─────────────────┘
```

---

## ⚙️ How to Run

**1. Clone the repository**
```bash
git clone https://github.com/yourusername/pakistan-ecommerce-sales-engine.git
cd pakistan-ecommerce-sales-engine
```

**2. Install Python dependencies**
```bash
pip install pandas numpy psycopg2 sqlalchemy jupyter
```

**3. Set up PostgreSQL**
```bash
psql -U postgres -f sql/schema.sql
```

**4. Run the notebooks in order**
```bash
jupyter notebook notebooks/
```

**5. Open the Power BI dashboard**

Open `dashboard/sales_dashboard.pbix` in Power BI Desktop and connect to your local PostgreSQL instance.

---

## 📊 Key DAX Measures

```dax
-- Total Revenue
Total Revenue = SUM(fact_orders[revenue])

-- Order Fulfillment Rate
Fulfillment % = 
DIVIDE(
    CALCULATE(COUNTROWS(fact_orders), fact_orders[status_clean] = "Completed"),
    COUNTROWS(fact_orders)
)

-- Revenue MoM Growth
MoM Growth % = 
DIVIDE([Total Revenue] - [Prev Month Revenue], [Prev Month Revenue])
```

---

## 🔍 Future Improvements

- [ ] Customer segmentation using RFM (Recency, Frequency, Monetary) analysis
- [ ] Predictive model for cancellation risk by payment method
- [ ] City/region-level breakdown of revenue and fulfillment
- [ ] Automated pipeline with Apache Airflow for monthly data refresh

---

## 🤝 Connect

If you found this project useful or have suggestions, feel free to open an issue or reach out!

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat&logo=linkedin)](https://linkedin.com/in/yourprofile)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?style=flat&logo=github)](https://github.com/yourusername)

---

*Dataset sourced from publicly available Pakistan e-commerce transaction data. All analysis is for educational and portfolio purposes.*
