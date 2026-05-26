/* 
QUERY 5: PROFITABILITY ANALYSIS BY CATEGORY
English: Calculates Net Profit and Profit Margin % for each product category. 
Using NULLIF prevents 'division by zero' errors, ensuring a robust analysis of 
how efficiently each category generates profit.
Azərbaycanca: Hər bir məhsul kateqoriyası üçün Xalis Mənfəəti və Mənfəət Marjasını (%) hesablayır. 
NULLIF funksiyasından istifadə sıfıra bölünmə xətalarının qarşısını alır və hər bir 
kateqoriyanın mənfəət effektivliyini dəqiq analiz etməyə imkan verir.
*/
SELECT 
    P.Category,
    SUM(S.Quantity * P.[Unit Price USD]) AS Total_Revenue,
    SUM(S.Quantity * P.[Unit Cost USD]) AS Total_Cost,
    SUM(S.Quantity * (P.[Unit Price USD] - P.[Unit Cost USD])) AS Total_Profit,
    CAST(
        (SUM(S.Quantity * (P.[Unit Price USD] - P.[Unit Cost USD])) / 
        NULLIF(SUM(S.Quantity * P.[Unit Price USD]), 0)) * 100 
    AS DECIMAL(10,2)) AS Profit_Margin_Percent
FROM [dbo].[Sales] AS S
INNER JOIN [dbo].[Products] AS P ON S.ProductKey = P.ProductKey
WHERE P.[Unit Cost USD] IS NOT NULL 
GROUP BY P.Category
ORDER BY Total_Profit DESC;