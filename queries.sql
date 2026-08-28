--Query 1: VIP Retention (Inactive High-Value Customers)
  
 SELECT c.CustomerID, c.CustomerName 
 FROM CUSTOMERS AS c
 LEFT JOIN Orders AS o 
 ON c.CustomerID = o.CustomerID 
 LEFT JOIN OrderDetails AS od
 ON o.OrderID = od.OrderID 
 LEFT JOIN Products AS p
 ON od.productID = p.productID
 GROUP BY c.CustomerID, c.CustomerName
 HAVING SUM(p.Price * od.Quantity) >= 1000 AND MAX(o.OrderDate) < DATE( '2026-08-22', '-60 days')

--Query 2: Unconverted Signups (Users With No Orders)

 SELECT c.CustomerID, c.CustomerName
 FROM Customers AS c
 LEFT JOIN Orders AS o
 ON c.CustomerID = o.CustomerID
 WHERE o.OrderDate IS NULL

--Query 3: Category Product Ranking

 SELECT p.Category, p.ProductName,
 SUM(p.Price * od.Quantity) AS Total_Revenue,
 DENSE_RANK() OVER ( PARTITION BY p.Category ORDER BY SUM(p.Price * od.Quantity) DESC) AS Product_Ranking
 FROM Products AS p
 LEFT JOIN OrderDetails AS od
 ON p.ProductID = od.ProductID
 GROUP BY p.Category, p.ProductName
   

   



















































































































































































































""""""""""
