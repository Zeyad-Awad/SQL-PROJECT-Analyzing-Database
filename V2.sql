-- VIS 2
WITH t1 AS(
    SELECT ge.Name Genre,
        AVG(il.UnitPrice) AvgUnitPrice
    FROM Genre ge 
    JOIN Track tr 
    ON ge.GenreId = tr.GenreId
    JOIN InvoiceLine il 
    ON tr.TrackId = il.TrackId
    GROUP BY 1
    ORDER BY 2 DESC
)
SELECT *,
    CASE WHEN AvgUnitPrice > (Select AVG(AvgUnitPrice) FROM t1)
        THEN '> AVG'
        ELSE '<= AVG'
    END AS 'Price Category'
FROM t1 
