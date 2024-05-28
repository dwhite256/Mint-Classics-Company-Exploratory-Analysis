-- Question 2.) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?
-- Lowest to highest quantity in stock
SELECT productName, productLine, warehouseCode, MAX(quantityInStock) as quantityInStock, SUM(quantityOrdered) as totalQuantityOrdered, MAX(buyPrice) as buyPrice, 
SUM(priceEach) as priceOfTotalOrders
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode
ORDER BY quantityInStock
LIMIT 20;
-- Highest to lowest quantity in stock
SELECT productName, productLine, warehouseCode, MAX(quantityInStock) as quantityInStock, SUM(quantityOrdered) as totalQuantityOrdered, MAX(buyPrice) as buyPrice, 
SUM(priceEach) as priceOfTotalOrders
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode
ORDER BY quantityInStock DESC
LIMIT 20;
/* These queries use the JOIN clause to combine the products and orderdetails tables, the GROUP BY clause to combine columns with common values, and the ORDER BY clause to arrange the
	output in ascending and descending order to see how a specific value (quantityInStock) affects the rest of data in the table. */
-- The LIMIT clause is used to display up to a certain amount of data since we are just looking for a general trend and not every single row of data.
-- The functions MAX and SUM are used to aggregate data.
-- There are certain items that have a higher order quantity than there are in stock so the sales of these items are limited due to supply not matching demand.
-- There are also a lot of items where the quantity in stock is substantially larger than the amount that is actually ordered.
-- Increasing the quantity on hand would improve sales since the demand for these items is in excess of the supply.
-- There are a number of classic  and vintages cars whose inventory greatly exceeds the amount ordered.
-- Looking into reducing the number of classic and vintage cars on hand would help in being able to combine warehouses b and c to elimante a warehouse.