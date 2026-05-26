/*Query 1: Executive Summary
English: Calculates the core Business KPIs: Total Revenue, Total Units Sold, and Unique Order Count. Using DISTINCT on Order Numbers ensures we count actual transactions, not just line items.

Azərbaycanca: Biznesin əsas KPI-larını hesablayır: Ümumi gəlir, satılan məhsulların cəmi və unikal sifariş sayı. Sifariş nömrələrinə DISTINCT tətbiq etməklə biz səbətdəki sətirləri deyil, real kassa çeklərinin sayını tapırıq.
*/


SELECT
    COUNT(DISTINCT S.[Order Number]) AS [Total Orders],
    
    SUM(S.Quantity) AS [Total Units Sold],
    
    SUM(S.Quantity * P.[Unit Price USD]) AS [Total Revenue]
FROM [dbo].[Sales] AS S
INNER JOIN [dbo].[Products] AS P ON S.ProductKey = P.ProductKey;