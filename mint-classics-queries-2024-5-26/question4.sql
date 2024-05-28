-- Question 4.) Are items being stored that aren't moving? 
-- least ordered items
SELECT productName, productLine, warehouseCode, MAX(quantityInStock) as quantityInStock, SUM(quantityOrdered) as totalQuantityOrdered, MAX(buyPrice) as buyPrice, 
SUM(priceEach) as priceOfTotalOrders 
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode
ORDER BY totalQuantityOrdered
LIMIT 20;
-- lowest selling items
SELECT productName, productLine, warehouseCode, MAX(quantityInStock) as quantityInStock, SUM(quantityOrdered) as totalQuantityOrdered, MAX(buyPrice) as buyPrice, 
SUM(priceEach) as priceOfTotalOrders 
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode
ORDER BY priceOfTotalOrders
LIMIT 20;
/* These queries use the JOIN clause to combine the products and orderdetails tables, the GROUP BY clause to combine columns with common values, and the ORDER BY clause to arrange the
	output in ascending and descending order to see how a specific value (totalQuantityOrdered and priceOfTotalOrders for the other query) affects the rest of data in the table. */
-- The LIMIT clause is used to display up to a certain amount of data since we are just looking for a general trend and not every single row of data.
-- The functions MAX and SUM are used to aggregate data.
-- Most of the least ordered and lowest selling products are classic and vintage cars. A couple of plane and motorcycle products also have low orders and sales.
-- If the company considers reducing inventory, these are the items that should be considered first.
-- The orders and sales numbers for a lot of these products do not justify the quantity currently held in stock.