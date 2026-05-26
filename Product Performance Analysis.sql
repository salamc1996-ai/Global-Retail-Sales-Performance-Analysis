/* 
QUERY 3: TOP SELLING PRODUCTS BY QUANTITY
English: Identifies the most popular products based on the total units sold. 
This helps the business understand customer demand and optimize inventory levels.
Azərbaycanca: Satılan vahidlərin ümumi sayına əsasən ən populyar məhsulları müəyyən edir. 
Bu, biznesə müştəri tələbatını anlamağa və inventar səviyyələrini optimallaşdırmağa kömək edir.
*/ 
SELECT 
    P. [Product Name],
    SUM(S.Quantity) AS Total_Quantity_Sold,
    SUM(S.Quantity * P.[Unit Price USD]) AS Total_Revenue
FROM [dbo].[Sales] AS S
INNER JOIN [dbo].[Products] AS P ON S.ProductKey = P.ProductKey
GROUP BY P.[Product Name]
ORDER BY Total_Quantity_Sold DESC;