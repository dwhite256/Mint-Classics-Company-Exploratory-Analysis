-- Question 3.) How does price of products affect sales?
-- lowest to highest buy price
SELECT productName, productLine, warehouseCode, MAX(quantityInStock) as quantityInStock, SUM(quantityOrdered) as totalQuantityOrdered, MAX(buyPrice) as buyPrice, 
SUM(priceEach) as priceOfTotalOrders
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode
ORDER BY buyPrice
LIMIT 20;
-- highest to lowest buy price
SELECT productName, productLine, warehouseCode, MAX(quantityInStock) as quantityInStock, SUM(quantityOrdered) as totalQuantityOrdered, MAX(buyPrice) as buyPrice, 
SUM(priceEach) as priceOfTotalOrders
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode
ORDER BY buyPrice DESC
LIMIT 20;
/* These queries use the JOIN clause to combine the products and orderdetails tables, the GROUP BY clause to combine columns with common values, and the ORDER BY clause to arrange the
	output in ascending and descending order to see how a specific value (buyPrice) affects the rest of data in the table. */
-- The LIMIT clause is used to display up to a certain amount of data since we are just looking for a general trend and not every single row of data.
-- The functions MAX and SUM are used to aggregate data.
-- Lower priced products have lower sales while higher priced products have higher sales.
-- This is expected since the price of each products is much less so the volume has to make up for the lower price.
-- The price of products does not appear affect the amount ordered. The higher priced products have similar order numbers to lower priced products.
-- Most of the lower priced products are classic and vintage cars and most of the higher priced products are classic cars.