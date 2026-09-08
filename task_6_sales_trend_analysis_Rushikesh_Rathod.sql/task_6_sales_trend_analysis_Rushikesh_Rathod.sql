CREATE DATABASE sales_project;
USE sales_project; 

-- Check sample data
SELECT OrderID, OrderDate, TotalAmount FROM online_sales LIMIT 5;  


USE sales_project;

SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(OrderDate, '%d-%b-%y')) AS sales_year,
    EXTRACT(MONTH FROM STR_TO_DATE(OrderDate, '%d-%b-%y')) AS sales_month,
    COUNT(DISTINCT OrderID) AS total_orders,
    ROUND(SUM(TotalAmount), 2) AS total_revenue
FROM 
    online_sales
WHERE 
    OrderDate IS NOT NULL
GROUP BY 
    sales_year,
    sales_month
ORDER BY 
    sales_year ASC,
    sales_month ASC;


SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(OrderDate, '%d-%b-%y')) AS sales_year,
    EXTRACT(MONTH FROM STR_TO_DATE(OrderDate, '%d-%b-%y')) AS sales_month,
    COUNT(DISTINCT OrderID) AS total_orders,
    ROUND(SUM(TotalAmount), 2) AS total_revenue
FROM 
    online_sales
WHERE 
    STR_TO_DATE(OrderDate, '%d-%b-%y') BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    sales_year,
    sales_month
ORDER BY 
    sales_month ASC;


