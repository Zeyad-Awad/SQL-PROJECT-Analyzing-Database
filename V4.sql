-- VIS 4
SELECT al.AlbumId,
    al.Title,
    SUM(il.Quantity * il.UnitPrice) TotalSpent
FROM Album al
JOIN Track tr
ON al.AlbumId = tr.AlbumId
JOIN InvoiceLine il 
ON tr.TrackId = il.TrackId
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10

