-- ### 1. List all customers along with the total number of orders they have placed.
SELECT C.CustomerID, c.CustomerName, COUNT(o.OrderID) as [Total Orders]
FROM Customers AS c LEFT JOIN Orders AS o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName


-- ### 2. Find customers who have placed more than 5 orders.
SELECT C.CustomerID, c.CustomerName, COUNT(o.OrderID) as [Total Orders]
FROM Customers AS c LEFT JOIN Orders AS o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 5


-- ### 3. Show each product and the total quantity ordered for that product.
SELECT p.ProductID, p.ProductName, COALESCE(SUM(o.Quantity),0) AS TotalOrder
FROM Products AS p LEFT JOIN
OrderDetails AS o 
ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName


-- ### 4. Find the top 5 products by total quantity sold.
SELECT top 5 p.ProductID, p.ProductName, SUM(o.Quantity) AS TotalOrder
FROM Products AS p LEFT JOIN
OrderDetails AS o 
ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalOrder DESC;


-- ### 5. List all suppliers and the number of products they supply.
SELECT s.SupplierID, s.SupplierName, COUNT(p.ProductID) AS TotalProducts
FROM Suppliers AS s LEFT JOIN Products AS p
ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.SupplierName


-- ### 6. Find categories containing more than 10 products.
SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) as TotalProducts
FROM Categories AS C LEFT JOIN Products AS p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING COUNT(p.ProductID) > 10


-- ### 7. Show the average product price for each category.
SELECT c.CategoryID, c.CategoryName, ROUND(AVG(p.Price),2) as AvgPrice
FROM Categories AS C LEFT JOIN Products AS p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName


-- ### 8. Find products whose price is above the average price of all products.
SELECT ProductID, ProductName, Price 
FROM Products
WHERE price > (SELECT AVG(Price) FROM Products)


-- ### 9. List customers who have never placed an order.
SELECT c.CustomerID, c.CustomerName
FROM Customers AS c LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- ### 10. Find products that have never been ordered.
SELECT p.ProductID, p.ProductName 
FROM Products as p LEFT JOIN OrderDetails AS o
ON p.ProductID = o.ProductID
WHERE o.OrderDetailID IS NULL;


-- ### 11. Show the total number of orders shipped by each shipper.
SELECT s.ShipperID, s.ShipperName, COUNT(o.OrderID) AS TotalShipment
FROM Shippers s LEFT JOIN Orders o
on s.ShipperID = o.ShipperID
GROUP BY s.ShipperID, s.ShipperName


-- ### 12. Find the most expensive product in each category.
SELECT c.CategoryID, c.CategoryName, p.ProductName, p.Price 
From Categories c LEFT Join Products p
on p.CategoryID = c.CategoryID 
WHERE Price = (
    SELECT MAX(Price)
    FROM Products
    WHERE  p.CategoryID = CategoryID
    )
ORDER BY p.CategoryID ASC

-- ### 13. List suppliers that provide products costing more than $50.
SELECT s.SupplierID, s.SupplierName 
FROM Suppliers s
WHERE s.SupplierID IN (
    SELECT SupplierID
    FROM Products 
    WHERE Price>50
)


-- ### 14. Show the total quantity ordered in each order.
SELECT OrderID, SUM(Quantity)
FROM OrderDetails
GROUP BY OrderID

-- ### 15. Find customers who ordered products from more than one category.
SELECT c.CustomerID, c.CustomerName, COUNT(CategoryID) as [CAtegory Ordered]
FROM Customers c INNER JOIN Orders o
ON c.CustomerID = o.CustomerID 
LEFT JOIN OrderDetails od 
ON o.OrderID = od.OrderID
LEFT JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName
Having COUNT(CategoryID)>1


-- ### 16. Find customers whose total ordered quantity exceeds 100 units.

-- ### 17. Show the total sales amount per product.

-- ### 18. Find the category with the highest average product price.

-- ### 19. List products priced above their category's average price.

-- ### 20. Find suppliers that supply products in more than one category.

-- ### 21. Show the customer who placed the highest number of orders.

-- ### 22. Find the order containing the highest total quantity of products.

-- ### 23. List categories whose average price is greater than the overall average product price.

-- ### 24. Find customers who have ordered every product from a particular category.

-- ### 25. Show suppliers whose products have never been ordered.

-- ### 26. Find the top 3 customers by total spending.

-- ### 27. For each category, find the product with the highest total quantity sold.

-- ### 28. Find products that were ordered by all customers.

-- ### 29. Find customers who ordered products from every category.

-- ### 30. Find pairs of customers who have ordered at least one common product.

-- ### 31. Find the second most expensive product.

-- ### 32. Find the nth most expensive product (n = 5).

-- ### 33. Find duplicate product prices.

-- ### 34. Find products priced higher than all products in their category except one.

-- ### 35. Find the longest streak of orders by a customer (requires window functions if dates are available).
