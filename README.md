# E-Commerce Sales & Customer Retention Analysis 

## Problem Statement
E-commerce businesses lose money when customers stop ordering or sign up without buying. I analyzed transaction logs using SQLite and Excel to find:
1. High-value customers who became inactive.
2. Users who signed up but never placed an order.
3. Product performance and revenue rankings by category.

## Dataset Structure
Relational SQLite database using 4 tables: `Customers`, `Orders`, `OrderDetails`, and `Products`.

## Key Analysis & SQL Implementation

### 1. High-Value Inactive Customers
* **Goal:** Find customers who spent ₹1000 or more overall but haven't ordered in the last 60 days.
* **SQL Logic:** Joined `Customers`, `Orders`, `OrderDetails`, and `Products` tables, grouped by customer, and filtered using `HAVING SUM() >= 1000` and date conditions.
* **Finding:** Identified 11 high-value inactive customers.

### 2. Users With No Orders
* **Goal:** Track registered accounts with zero order history to improve onboarding.
* **SQL Logic:** Used a `LEFT JOIN` between `Customers` and `Orders`, filtered using `Orders.OrderID IS NULL`.
* **Finding:** Found 20 registered users who never placed an order.

### 3. Product Category Rankings
* **Goal:** Rank products by total sales within their respective categories.
* **SQL Logic:** Applied `DENSE_RANK() OVER (PARTITION BY Category ORDER BY SUM(Revenue) DESC)`.
* **Finding:** Electronics was the top category, led by MacBook Pro (₹6,00,000 in sales). Some items, like Cotton Bedsheets, recorded zero sales.

## Excel Dashboard
Exported SQL query results into Microsoft Excel to build a simple dashboard featuring:
* **KPI Cards:** Created using `=SUMIF()` and `=COUNT()` formulas.
* **Sales Charts:** 2D Column Charts powered by Pivot Tables.
* **Interactive Slicers:** Added category slicers for easy filtering.
