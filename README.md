# [Mint Classics Company Exploratory Analysis]

## DESCRIPTION OF THE BUSINESS PROBLEM
  The Mint Classics Company is looking at closing on of their storage facilities. In order to achieve this goal, exploratory analysis will be conducted on the data provided
to give recommendations to the company on how to reduce and reorganize inventory.

## DESCRIPTION OF THE DATA
  The data provided by the company includes data tables about the customers, the employees of the company, the location of the company offices, payment information, order information,
the types of products included in the inventory, and the location and capacity percentage of the company warehouses. These tables have different primary keys that can link one table 
to another such as productCode, customerNumber, orderNumber, and warehouseCode.

## SETTING UP THE PROJECT

### - Making a new connection in MySQL
![new-database-connection-1](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/19efb35f-9812-4fb8-8050-ca8ab4c89cb5)
![new-database-connection-2](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/65ab1794-ddad-435d-8015-db09420da61d)
![new-database-connection-3](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/5b72586a-ea39-4dce-8c90-cb34b575370c)

### - Importing database
![importing-database-1](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/5d96f48e-bb8f-496e-80d1-c49cb6c9cec1)
![importing-databse-2](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/a3658c10-41cb-48f2-9a3b-edae43784de2)
![importing-database-3](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/e8bc10c1-7af8-4f46-bc11-8fb66cd44da6)

## ANSWERING BUSINESS QUESTIONS

### Question 1.) Where are items stored?
#### - SQL Query
![question1-query-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/cff523ed-2b52-4855-a344-463c1e45bd6d)
#### -- Query Results
![question1-query-results1-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/f79a04c6-5af6-41a9-a055-02da7121fc11) 
![question1-query-results2-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/7b473485-7562-4ab2-9001-95176b775f49)

### Question 2.) How are inventory numbers related to sales figures? Do the inventory counts seem apporpriate for each item?
#### - SQL Query
![question2-query-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/010d1070-c99f-4d0b-bf5a-f1bf5f24eda0)
#### - Query Results
![question2-query-results1-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/557ac9a8-3da9-4260-84b1-5d561ee4313f)
![question2-query-results2-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/1b6fdc91-a892-4814-8937-670edd460d79)

### Question 3.) How do the price of products affect sales?
#### - SQL Query
![question3-query-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/320a7551-422a-45eb-8b5b-8b36e07cc410)
#### - Query Results
![question3-query-results1-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/e2dea648-28f9-4f7d-93e0-33af921e668c)
![question3-query-results2-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/13aea9af-6f45-407b-86e4-260380566ff8)

### Question 4.) Are items being stored that aren't moving?
#### - SQL Query
![question4-query-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/ac6934fb-5ba7-4cf2-9596-dddff9a8cfe4)
#### - Query Results
![question4-query-results1-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/6da7be27-c7ee-48b6-9578-1e0804de1e73)
![question4-query-results2-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/5f9c4127-3d14-461e-b5c3-b9f3a97190a5)

### Question 5.) What impact would it have on the company if we reduced the quantity on hand for every item by 10%?
#### - SQL Query
![question5-query1-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/d7efeb68-a6b4-4f37-a8ec-686b1f31901b)
![question5-query2-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/0adc5053-53db-4a15-a37b-434b31ead28d)
#### - Query Results
![question5-query-results1-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/8d299b4f-939f-4207-ba1b-3f06c97d916c)
![question5-query-results2-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/cc07ba61-099d-4656-b183-d47fd992921b)
![question5-query-results3-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/6121edb6-de2a-4340-9dce-77aab3757a00)
![question5-query-results4-ss](https://github.com/dwhite256/Mint-Classics-Company-Exploratory-Analysis/assets/170587320/23ce1d39-267e-4716-96ed-0c91d53765e3)

## CONCLUSION
### Recommendations
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

### Limitations/Areas for Further Research
  It is not clear with the data provided how much the company spends on maintaining current inventory. This information would help in showing the cost-effectiveness of reducing 
inventory. Information like maintenance and repair costs would be very useful. It is also not clear how much it would cost to relocate inventory to different warehouses. This information
would definitely influence the recommendations given to the company. For example, if the cost of moving very large items such as planes greatly outweighs the current cost of maintaining
this product then it would be a viable option to in fact not close a warehouse. Company financials are also a factor that would influence the recommendations given to the company. 
Does the company have enough cash on hand to be able to afford moving these items? If not, would it be worth taking on debt to able to afford to move inventory? Another huge area to 
research would be how reorganizing inventory would effect customer experience. It is reasonable to believe that relocating inventory from one warehouse to another would have some 
negative effect on when customers will able to recieve orders and it is unclear on how long the relocation process would take. The company will have to decide if some momentary order 
delays for customers is worth closing down a warehouse.





















