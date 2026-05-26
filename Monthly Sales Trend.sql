  /* 
QUERY 2: MONTHLY SALES TREND analysis
English: Tracks the business growth over time. By grouping data by month, we identify 
seasonal patterns and verify if the revenue is trending upwards or downwards.
Azərbaycanca: Biznesin zaman daxilindəki inkişafını izləyir. Məlumatları aylara görə 
qruplaşdırmaqla mövsümi trendləri aşkar edirik və gəlirin artma-azalma meylini yoxlayırıq.
*/
SELECT 
      CAST(DATETRUNC(month, S.[Order Date]) AS DATE) AS [Order Date],
      SUM(S.Quantity * P.[Unit Price USD]) AS [Total Revenue],
      COUNT(S.[Order Number]) AS [Order Number]
FROM [dbo].[Sales] AS S
INNER JOIN [dbo].[Products] AS P ON S.ProductKey = P.ProductKey
GROUP BY DATETRUNC(month, S.[Order Date])
ORDER BY [Order Date];