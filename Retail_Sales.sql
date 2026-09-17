use project ;
select * from
retail_sales_cleaned;
rename table retail_sales_cleaned to clean_data;
select * from
clean_data;
  
-- 1 How many total records are present in the retail_data table?
select count(*) as Total_Records
from clean_data;

-- 2 Display the first 10 records from the table.
Select * from
clean_data
limit 10;


-- 3 What are the column names and their data types?
describe clean_data;

-- 4 Are there any duplicate Order_ID values?
select order_id,count(*) as total_order
from clean_data
group by order_id
having count(*)>1;

-- 5 What is the total sales generated?
select sum(sales) as Total_sales
from clean_data;

--  6 What is the total profit generated?
select sum(profit) as Total_profit
from clean_data;

-- 7 What is the total quantity sold?
select sum(quantity) as Total_Quantity
from clean_data;

-- 8 How many unique customers are there?
select  count(distinct Customer_ID) as Total_unique_customers
from clean_data; 
 
-- 9 What is the average order value?
select sum(sales) / count(distinct order_id) as Average_order_value from
clean_data;

-- C. Category & Sub-Category Analysis

-- 10 What is the total sales for each category?
select category,sum(sales) as Total_sale from
clean_data
group by category;

-- 11 What is the total profit for each category?
select category,sum(profit) as Total_profit
from clean_data
group by category ;
-- 12 Which category has the highest sales?
select category ,sum(sales) as Total_sales
from clean_data
group by category
order by total_sales desc
;
-- 13 Which category has the highest profit?
select category ,sum(profit) as total_profit
from clean_data
group by category
order by total_profit desc;

-- 14 What are the total sales and profit for each sub-category?
select Sub_Category,sum(sales) as total_sales ,sum(profit) as Total_profit 
from clean_data
group by Sub_Category;

-- D. Product Analysis
-- 15 What are the top 10 products by total sales?
select Product,sum(sales) as Total_sale
from clean_data 
group by Product
order by Total_sale desc
limit 10;
  
-- 16 What are the top 10 products by total profit?
select Product,sum(profit) as total_profit
from clean_data
group by Product
order by total_profit desc
limit 10; 

-- 17 What are the bottom 10 products by total profit?
select Product,sum(profit) as total_profit
from clean_data
group by Product
order by total_profit asc
limit 10; 


-- 18 Which products are generating an overall loss?

select Product,sum(profit) as total_profit
from clean_data
group by Product
having total_profit < 0
;
 select * from
 clean_data;
 
-- E. Customer Analysis
-- 19 Who are the top 10 customers based on total sales?
select Customer_Name,sum(sales) as Total_sale
from clean_data 
group by Customer_Name
order by Total_sale desc
limit 10;

-- 20 Who are the top 10 customers based on total profit?
select Customer_Name,sum(profit) as Total_profit
from clean_data 
group by Customer_Name
order by Total_profit desc
limit 10;

-- 21 Which customers have placed the highest number of orders?
select Customer_Name,Count(distinct Order_id) as Total_Order
from clean_data 
group by Customer_name
order by Total_order desc
limit 10;

-- F. Geographic Analysis
-- 22 What is the total sales for each state?
select state,sum(sales) as Total_sales
from clean_data
group by state
order by Total_sales desc;

-- 23 What is the total profit for each state?
select state,sum(profit) as Total_profit
from clean_data
group by state
order by Total_profit desc;

-- 24 What are the top 10 cities by total sales?
select city,sum(sales) as Total_sales
from clean_data
group by city
order by Total_sales desc
limit 10;

-- G. Time Analysis
-- 25 What is the total sales for each year?
select year(order_date) as sale_year,sum(sales) as total_sales
from clean_data
group by year(order_date)
order by sale_year asc;

-- 26 What is the total sales for each month?
select monthname(order_date) as sale_month ,sum(sales) as total_sale
from clean_data
group by month(order_date),monthname(order_date)
order by month(order_date) asc;

-- 27 What is the total profit for each month?
select monthname(order_date) as sale_month ,sum(profit) as total_profit
from clean_data
group by month(order_date),monthname(order_date)
order by month(order_date) asc;

-- 28 Which day of the week generates the highest sales?
select dayname(order_date) as sale_day,sum(sales) as total_sale
from clean_data
GROUP BY DAYOFWEEK(order_date), DAYNAME(order_date)
ORDER BY total_sale DESC
LIMIT 1;
select * from clean_data;
-- H. Discount & Profitability
-- 29 What is the average discount for each category?
select category,avg(discount) as avg_discount
from clean_data
group by category
order by avg_discount desc;

-- 30 How do total sales and total profit vary across different discount levels?
select discount,sum(sales) as total_sale,sum(profit) as total_profit
from clean_data
group by discount
order by discount asc;

-- 31 Which products have both relatively high discounts and negative profit?
select product 
from clean_data
where discount >=0.20 and profit <0; 

-- I. Business Classification
-- 32 Classify each product as Profitable, Loss, or Break-even based on its total profit.
select product,sum(profit) as total_profit,
case
     when sum(profit)>0 then "Profitable"
     when sum(profit)<0 then "Loss"
     else "Break-Even"
    end as Profit_status 
from clean_data
group by product
;

-- 33 Classify each order as High Value, Medium Value, or Low Value based on its sales amount.
select order_id,sum(sales) as total_sale,
case
    when sum(sales) >150000 then "High"
    when sum(sales) >50000  then "Medium"
    else "Low"
end as Rank_Sale
from clean_data
group by order_id
order by total_sale desc;

select order_id,sum(sales)as total_sale
from clean_data
group by order_id
order by total_sale desc
;
-- J. Advanced SQL
-- 34 Which products have total sales greater than the average sales across all products?
SELECT Product,
       SUM(Sales) AS Total_Sale
FROM clean_data
GROUP BY Product
HAVING SUM(Sales) > (
    SELECT AVG(Total_Sale)
    FROM (
        SELECT Product,
               SUM(Sales) AS Total_Sale
        FROM clean_data
        GROUP BY Product
    ) AS product_sales
)
ORDER BY Total_Sale DESC;

-- 35 Rank all products based on their total sales and identify the top-ranked products.
select product,sum(sales) as total_sale,rank() over (order by sum(sales) desc) as Ranking
from clean_data
group by product;






