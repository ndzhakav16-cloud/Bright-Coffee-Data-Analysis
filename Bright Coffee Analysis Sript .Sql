---to see my data on my table
SELECT*
FROM
  BRIGHT.COFFEE.SALES
LIMIT
  20;
  
Which products generate the most revenue

--find the DISTINCT number of sales to get the top Transctions, Product that sell most,number of stores that generate more sales 

SELECT
   COUNT(DISTINCT transaction_id) AS number_of_Sales,
   COUNT(DISTINCT product_id) AS number_of_unique_product,
   COUNT(DISTINCT store_id) AS number_of_shops,


   TO_DATE(transaction_date) AS transaction_date,
   DAYNAME(TO_DATE(transaction_date)) AS day_name,
   MONTHNAME(TO_DATE(transaction_date)) AS month_name,
   DAYOFMONTH(TO_DATE(transaction_date)) AS day_of_month,
   TO_CHAR(TO_DATE(transaction_date),'YYYYMM') AS month_id, 
    
 --Categories
  store_location,
  product_detail,
  product_category,
  product_type,
  
  COUNT(*)          AS units_sold,
  SUM(unit_price)   AS revenue,
  AVG(unit_price)   AS avg_price,

  ROUND(SUM (IFNULL(transaction_qty,0)*IFNULL(unit_price,0)),0) AS avg_revenue,
  ROUND(SUM(unit_price) / IFNULL(COUNT(*),0),2) AS avg_revenue_per_transaction_time,
  SUM(UNIT_PRICE) AS total_revenue,
  COUNT(*) AS transactions, 

  
CASE
   WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
   WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
   WHEN transaction_time BETWEEN '15:00:00' AND '19:59:59' THEN 'Evening'
   ELSE 'Night'
END AS time_bucket, 

CASE
   WHEN day_name NOT IN ('Sat','Sun' ) THEN 'Weekday'
   WHEN DAYNAME(TO_DATE(transaction_date)) NOT IN ('Sat','Sun' ) THEN 'Weekday'
   ELSE 'Weekend'
END AS day_classification,



FROM BRIGHT.COFFEE.SALES
 GROUP BY ALL;



 

 


  
 
 
 
 

  

 


   

















