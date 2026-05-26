/* 
QUERY 6: CUSTOMER VALUE SEGMENTATION (VIP Customers)
English: Ranks customers by their total spending and order frequency. 
This list is vital for loyalty programs and personalized marketing to retain high-value clients.
Azərbaycanca: Müştəriləri ümumi xərcləmələrinə və sifariş tezliyinə görə sıralayır. 
Bu siyahı, yüksək dəyərli müştəriləri əldə saxlamaq üçün loyallıq proqramları və fərdi marketinq üçün həyati əhəmiyyət kəsb edir.
*/
SELECT 
    C.CustomerKey,
    C.Name AS Customer_Name,
    COUNT(S.[Order Number]) AS Total_Orders,
    SUM(S.Quantity * P.[Unit Price USD]) AS Total_Spent,
    CASE 
        WHEN SUM(S.Quantity * P.[Unit Price USD]) > 10000 THEN 'VIP Customer'
        WHEN SUM(S.Quantity * P.[Unit Price USD]) BETWEEN 5000 AND 10000 THEN 'Premium'
        WHEN SUM(S.Quantity * P.[Unit Price USD]) BETWEEN 1000 AND 5000 THEN 'Regular'
        ELSE 'Occasional'
    END AS Customer_Segment
FROM [dbo].[Customers] AS C
INNER JOIN [dbo].[Sales] AS S ON C.CustomerKey = S.CustomerKey
INNER JOIN [dbo].[Products] AS P ON S.ProductKey = P.ProductKey
GROUP BY C.CustomerKey, C.Name
ORDER BY Total_Spent DESC;