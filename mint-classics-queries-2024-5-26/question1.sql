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