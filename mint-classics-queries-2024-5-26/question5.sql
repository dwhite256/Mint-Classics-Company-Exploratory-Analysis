-- Question 5.) What impact would it have on the company if we reduced the quantity on hand for every item by 10%?
-- keeping quantity the same
SELECT productName, productLine, warehouseCode, MAX(quantityInStock) as quantityInStock, SUM(quantityOrdered) as totalQuantityOrdered, MAX(buyPrice) as buyPrice, 
SUM(priceEach) as priceOfTotalOrders,
(CASE
	WHEN MAX(quantityInStock) < SUM(quantityOrdered) THEN 'OUT OF STOCK'
    WHEN MAX(quantityInStock) > SUM(quantityOrdered) THEN 'IN STOCK'
    ELSE 'error'
END) as productStatus
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode;
-- counting number of times a product has a number of orders that is higher than the quantity currently in stock and vice versa
SELECT SUM(productStatus = 'IN STOCK') as inStock, SUM(productStatus = 'OUT OF STOCK') as outOfStock
FROM
	(SELECT 
	(CASE
		WHEN MAX(quantityInStock) < SUM(quantityOrdered) THEN 'OUT OF STOCK'
		WHEN MAX(quantityInStock) > SUM(quantityOrdered) THEN 'IN STOCK'
		ELSE 'error'
	END) as productStatus
	FROM mintclassics.products p
	JOIN mintclassics.orderdetails o
	ON p.productCode = o.productCode
	GROUP BY productName, productLine, warehouseCode) as temp;
    
-- reducing quantity by 10% and showing whether there is enough of the product on hand or not
SELECT productName, productLine, warehouseCode, MAX(quantityInStock - quantityInStock * 0.10) as quantityInStock10pct, SUM(quantityOrdered) as totalQuantityOrdered, 
MAX(buyPrice) as buyPrice, SUM(priceEach) as priceOfTotalOrders,
(CASE
	WHEN MAX(quantityInStock - quantityInStock * 0.10) < SUM(quantityOrdered) THEN 'OUT OF STOCK'
    WHEN MAX(quantityInStock - quantityInStock * 0.10) > SUM(quantityOrdered) THEN 'IN STOCK'
    ELSE 'error'
END) as productStatus
FROM mintclassics.products p
JOIN mintclassics.orderdetails o
ON p.productCode = o.productCode
GROUP BY productName, productLine, warehouseCode;
-- counting number of times a product has a number of orders that is higher than the quantity currently in stock and vice versa when quantity in stock is reduced by 10%
SELECT SUM(productStatus = 'IN STOCK') as inStock, SUM(productStatus = 'OUT OF STOCK') as outOfStock
FROM
	(SELECT 
	(CASE
		WHEN MAX(quantityInStock - quantityInStock * 0.10) < SUM(quantityOrdered) THEN 'OUT OF STOCK'
		WHEN MAX(quantityInStock - quantityInStock * 0.10) > SUM(quantityOrdered) THEN 'IN STOCK'
		ELSE 'error'
	END) as productStatus
	FROM mintclassics.products p
	JOIN mintclassics.orderdetails o
	ON p.productCode = o.productCode
	GROUP BY productName, productLine, warehouseCode) as temp;
-- All 4 of these queries utilize a subquery and a CASE clause to determine if the amount of inventory of each product on hand is higher than the amount ordered.
-- If the amount on hand is higher than the amount ordered then the query will return the phrase 'IN STOCK' in a new column, if not then 'OUT OF STOCK' will be returned.
-- The first two queries use the current amount of inventory on hand.
-- The last two queries engage in what-if analysis to see how the results would change if inventory was reduced by 10%.
-- There are currently already products on hand where the quantity in stock is lower than the quantity ordered. 
-- When the quantity in stock is reduced by 10%, the number of products where the quantity in stock is lower than the quantity ordered is increased. 
-- So reducing the quantity of product on hand by higher percentages will lead to more products having less quantity in stock than the amount ordered.
-- This would surely negatively impact customer experience.
-- This would avoid negatively impacting customer experience.
-- If the company decides to reduce inventory it must be tailored to only decrease the quantity of products that are in large excess of the total amount ordered.