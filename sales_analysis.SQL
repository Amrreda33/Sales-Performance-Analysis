CREATE DATABASE business_sales_analysis;

USE business_sales_analysis;

CREATE TABLE superstore_sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

Select count(*)
From superstore_sales;

Select Count(*)
From superstore_sales
Where product_name is Null 
or order_id is null 
or sales is null ; 
 Select 
	Round(Sum(sales),2) As Total_Sales, 
    Round(Sum(profit),2) As Total_Profit,
    Count(distinct order_id)  AS Total_Order,
    Round(Sum(profit) / Sum(Sales) * 100, 2) As Profit_Margin
From superstore_sales
; 

Select 
	Product_Name,
    Round(Sum(Sales),2) AS Total_Sales,
    Round(Sum(Profit),2) AS Total_Profit,
	Case
	When Sum(Profit) > 0 THEN "WIN"
	When Sum(Profit) <= 0 THEN "LOSE"
	END AS Profit_Status
From superstore_sales
Group by Product_Name
Having Sum(profit) <= 0
Order by Total_profit ASC
;

Select 
	
	sub_category,
    Round(Sum(Sales),2) AS Total_Sales,
    Round(Sum(Profit),2) AS Total_Profit,
	Case
	When Sum(Profit) > 0 THEN "WIN"
	When Sum(Profit) <= 0 THEN "LOSE"
	END AS Profit_Status
From superstore_sales
Group by sub_category
Having Sum(profit) <= 0
Order by  Total_profit ASC
;



Select 
	region,
	sub_category,
    Round(Sum(Sales),2) AS Total_Sales,
    Round(Sum(Profit),2) AS Total_Profit,
	Case
	When Sum(Profit) > 0 THEN "WIN"
	When Sum(Profit) <= 0 THEN "LOSE"
	END AS Profit_Status
From superstore_sales
Group by region  , sub_category
Having Sum(profit) <= 0
Order by Total_profit ASC
;



Select 
	Round(Avg(Discount), 2) AS Average_Discount,
    Round(Sum(Profit), 2) AS Total_Profit,
    Round(Avg(Profit/Sales) * 100) AS Profit_Margin
From superstore_sales
Where Sub_category In ("Tables", "Bookcases", "Supplies")
Group By sub_category 
Order By Total_Profit
;


Select 
	Sub_category,
    Round(Sum(Profit) / Sum(Sales) * 100, 2) AS Profit_Margin,
    Round(Avg(discount), 2) As Avg_Discount
From superstore_sales
GROUP BY sub_category
ORDER BY Profit_Margin
;


SELECT 
    region,
    category,
    sub_category,
    ROUND(SUM(sales), 2)   AS total_sales,
    ROUND(SUM(profit), 2)  AS total_profit,
    ROUND(AVG(discount), 2) AS avg_discount,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY region, category, sub_category
ORDER BY total_profit DESC;
    
    
    
    
    


    











