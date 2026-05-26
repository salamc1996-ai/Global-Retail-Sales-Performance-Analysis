/* 
QUERY 4: REGIONAL SALES PERFORMANCE
English: Analyzes sales distribution by country. It helps the business understand its strongest 
markets and identify geographic expansion opportunities.
Azərbaycanca: Satışların ölkələr üzrə paylanmasını analiz edir. Bu, biznesə özünün ən güclü 
bazarlarını anlamağa və coğrafi genişlənmə imkanlarını tapmağa kömək edir.
*/

SELECT 
    ST.Country,
    SUM(S.Quantity * P.[Unit Price USD]) AS Country_Revenue,
    SUM(S.Quantity) AS Total_Units_Sold
FROM [dbo].[Sales] AS S
INNER JOIN [dbo].[Stores] AS ST ON S.StoreKey = ST.StoreKey
INNER JOIN [dbo].[Products] AS P ON S.ProductKey = P.ProductKey
GROUP BY ST.Country
ORDER BY Country_Revenue DESC; 