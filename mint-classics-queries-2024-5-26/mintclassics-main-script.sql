-- DESCRIPTION OF THE BUSINESS PROBLEM
/* The Mint Classics Company is looking at closing on of their storage facilities. In order to achieve this goal, exploratory analysis will be conducted on the data provided
to give recommendations to the company on how to reduce and reorganize inventory. */

-- DESCRIPTION OF THE DATA
/* The data provided by the company includes data tables about the customers, the employees of the company, the location of the company offices, payment information, order information,
the types of products included in the inventory, and the location and capacity percentage of the company warehouses. These tables have different primary keys that can link one table 
to another such as productCode, customerNumber, orderNumber, and warehouseCode. */

-- Question 1.) Where are items stored?
SELECT p.warehouseCode, warehouseName, productLine, warehousePctCap, SUM(quantityInStock) as quantityInWarehouse
FROM mintclassics.warehouses w
JOIN mintclassics.products p
ON w.warehouseCode = p.warehouseCode
GROUP BY warehouseCode, productLine;

SELECT warehouseCode, SUM(quantityInStock) as quantityInWarehouse
FROM mintclassics.products
GROUP BY warehouseCode;
-- These queries use the JOIN clause to combine the warehouses and products table and uses the GROUP BY clause to combine common values in columns.
-- The outpout displays the different types of products, which warehouse they are located in, and the quantity of that product in each warehouse.
-- Items are stored in different warehouses depending on the product type and the different warehouses are located in different geographical areas (North, South, East, West).
-- Warehouses b and c have the most capacity remaining and both hold similar products which are classic and vintage cars.
-- Warehouses b has the most products on hand, while warehouse d has the least.
-- Warehouses b and c could possibly be combined allowing the company to get rid of one of the warehouses.
-- The quantity of motorcylces and planes in warehouse a are split almost evenly.
-- Dividing the products in warehouse a into two different warehouses could also be an option.
-- Reducing inventory is necessary to combine any of the warehouses, except for perhaps warehouse c since it is only at half capacity. 
-- Trying to combine any of the warehouses without reducing inventory would result in exceeding the storage cap of the new warehouse.

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

-- CONCLUSION
/* 
-- Recommendations
	1.) Based on the analysis that was conducted, in order to achieve the goal of closing a storage facility the company should look into combining warehouses b and c.
These two warehouses contain similar products (classic and vintage cars) and have more capacity to work with than the other warehouses. The company would have to look into how
costly and time consuming it would be to move the products from one warehouse to another since one is on the east side and the other is on the west. Classic and vintage cars 
have the highest quantities in stock and are also some of the lowest selling products, so reducing the quantity on hand would aid in making room to combine the two warehouses. 
The company can only decrease the inventory of hand of items that are in excess of the amount ordered to ensure customer satisfaction is not affected. This will achieve 
the goal of closing one of the storage facilities.

	2.) Another recommendation for the company to consider would be to close warehouse a and move the products to warehouses c and d. Warehouse a holds motorcyles and planes,
two very different products. The quantity of these two products held in the warehouse is almost evenly split so it should make the task of dividing the products into two
different warehouses easier. Moving the planes into warehouse d would make sense because this warehouse already holds the companies larger items (trucks, buses, ships and trains).
The quantity of these products would have to be reduced and moving large planes will likely be tasking. The motorcycles should be moved to warehouse c. Warehouse c is only
at half capacity so it has much more room for inventory and can easily accomodate all of the motorcycles in warehouse a. 

-- Limitations/Areas for Further Research
	It is not clear with the data provided how much the company spends on maintaining current inventory. This information would help in showing the cost-effectiveness of reducing 
inventory. Information like maintenance and repair costs would be very useful. It is also not clear how much it would cost to relocate inventory to different warehouses. This information
would definitely influence the recommendations given to the company. For example, if the cost of moving very large items such as planes greatly outweighs the current cost of maintaining
this product then it would be a viable option to in fact not close a warehouse. Company financials are also a factor that would influence the recommendations given to the company. 
Does the company have enough cash on hand to be able to afford moving these items? If not, would it be worth taking on debt to able to afford to move inventory? Another huge area to 
research would be how reorganizing inventory would effect customer experience. It is reasonable to believe that relocating inventory from one warehouse to another would have some 
negative effect on when customers will able to recieve orders and it is unclear on how long the relocation process would take. The company will have to decide if some momentary order 
delays for customers is worth closing down a warehouse.
*/




 
