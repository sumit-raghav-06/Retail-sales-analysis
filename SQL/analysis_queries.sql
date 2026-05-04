-- Top Categories by Sales
SELECT Category, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC

-- Average Sales by Region
SELECT Region, AVG(Sales) AS Avg_Sales
FROM sales
GROUP BY Region
ORDER BY Avg_Sales DESC

-- Top Profitable States
SELECT State, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 3

-- Highest Transaction per Region
WITH RankedSales AS (
    SELECT 
        Region, 
        Sales, 
        ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Sales DESC) as rn 
    FROM sales
)
SELECT Region, Sales 
FROM RankedSales 
WHERE rn = 1
ORDER BY Sales DESC;
