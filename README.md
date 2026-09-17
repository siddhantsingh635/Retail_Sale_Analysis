# Retail_Sale_Analysis

## 📌 Project Overview

This project analyzes retail sales data to identify patterns in sales,
profitability, customer behavior, product performance, regional performance,
and discount impact.

The project demonstrates an end-to-end data analytics workflow using:

- Python
- Pandas
- SQL
- Power BI

---

## 🎯 Objectives

- Understand overall sales and profit performance
- Analyze sales and profit by category and product
- Identify top-performing customers
- Analyze regional sales and profitability
- Study sales trends over time
- Analyze discount and profit relationships
- Build an interactive Power BI dashboard

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data understanding, cleaning & EDA |
| Pandas | Data manipulation |
| Matplotlib / Seaborn | Data visualization |
| MySQL | SQL-based business analysis |
| Power BI | Interactive dashboard & visualization |
| DAX | KPI calculations |

---

## 🔄 Project Workflow

Python
↓
Data Understanding & Cleaning
↓
Exploratory Data Analysis
↓
SQL Business Analysis
↓
Power BI Dashboard
↓
Business Insights

---

## 📊 Dataset

The cleaned dataset contains 1,003 records and 14 columns.

Key fields include:

- Order_ID
- Order_Date
- Customer_ID
- Customer_Name
- State
- City
- Category
- Sub_Category
- Product
- Unit_Price
- Quantity
- Discount
- Sales
- Profit

---

## 🐍 Python Analysis

Python was used for:

- Data understanding
- Data type validation
- Missing-value checks
- Duplicate checks
- Data cleaning
- Basic exploratory analysis
- Visualization

---

## 🗄️ SQL Analysis

SQL was used to perform business-oriented analysis including:

- Total sales and profit
- Average order value
- Category and sub-category performance
- Product profitability
- Top customers
- State and city performance
- Monthly and yearly trends
- Discount analysis
- Loss-making products
- Product ranking

A total of 35 SQL business questions were analyzed.

---

## 📈 Power BI Dashboard

The Power BI dashboard contains three pages:

### Page 1 — Retail Sales Analysis Dashboard

- Total Sales
- Total Profit
- Total Quantity
- Total Customers
- Average Order Value
- Sales by Category
- Profit by Category
- Sales Over Time
- Product by Sales

### Page 2 — Product, Customer & Regional Analysis

- Sales by State
- Profit by State
- Profit by Product
- Top 10 Customers by Sales

### Page 3 — Discount & Profit Analysis

- Total Profit
- Total Sales
- Average Discount
- Profit Margin
- Profit % by Category
- Average Discount vs Average Profit by Category
- Profit by Discount
- Sales vs Profit by Product

---

## 📌 Key DAX Measures

```DAX
Total Sales = SUM(clean_data[Sales])

Total Profit = SUM(clean_data[Profit])

Total Quantity = SUM(clean_data[Quantity])

Total Customers = DISTINCTCOUNT(clean_data[Customer_ID])

AOV =
DIVIDE(
    [Total Sales],
    DISTINCTCOUNT(clean_data[Order_ID])
)

Average Discount = AVERAGE(clean_data[Discount])

Profit Margin =
DIVIDE(
    [Total Profit],
    [Total Sales],
    0
)
