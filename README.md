# E-Commerce Revenue & Customer Retention Analysis 

## Problem Statement
E-commerce businesses lose money when customers stop ordering or sign up without buying. I analyzed transaction logs using SQLite and Excel to find:
1. High-value customers who became inactive.
2. Users who signed up but never placed an order.
3. Product performance and rankings by category.

## Dataset Structure
Relational SQLite database using 4 tables: `Customers`, `Orders`, `OrderDetails`, and `Products`.

## Key Analysis & SQL Implementation

### 1. High-Value Inactive Customers
* **Goal:** Find customers who spent ₹1000 or more overall but haven't ordered in the last 60 days.
* **SQL Logic:** Joined `Customers`, `Orders`, `OrderDetails`, and `Products` tables, grouped by customer, and filtered using `HAVING SUM() >= 1000` and date conditions.
* **Finding:** Identified 11 high-value inactive customers.

### 2. Users With No Orders
* **Goal:** Track registered accounts with zero order history to improve onboarding.
* **SQL Logic:** Used a `LEFT JOIN` between `Customers` and `Orders`, filtered using `o.OrderDate IS NULL`.
* **Finding:** Found 20 registered users who never placed an order.

### 3. Product Category Rankings
* **Goal:** Rank products by total sales within their respective categories.
* **SQL Logic:** Applied `DENSE_RANK() OVER (PARTITION BY p.Category ORDER BY SUM(p.Price * od.Quantity)  DESC)`.
* **Finding:** Electronics was the top category, led by MacBook Pro (₹6,00,000 in sales). Some items like Cotton Bedsheet recorded zero sales.

## Excel Dashboard
Exported SQL query results into Microsoft Excel to build a simple dashboard featuring:
* **KPI Cards:** Created using `=SUM()` and `=COUNT()` formulas.
* **Sales Charts:** 2D Column Chart powered by Pivot Tables.
* **Slicers:** Added category slicers for easy filtering.
