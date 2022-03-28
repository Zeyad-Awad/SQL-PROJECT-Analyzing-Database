-- WHICH ARTIST EARNED INVOIVELINES
-- WHICH CUSTOMR SPENT THE MOST ON HIM

WITH
    top_earning AS(
        SELECT ar.Name artistname,
            SUM(il.UnitPrice*il.Quantity) earnings
        FROM Artist ar 
        JOIN Album al 
        ON ar.ArtistId = al.ArtistId
        JOIN Track tr 
        ON al.AlbumId = tr.AlbumId
        JOIN InvoiceLine il 
        ON tr.TrackId = il.TrackId
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 1
    )
SELECT cu.FirstName firstname,
    cu.LastName lastname,
    i.CustomerId,
    SUM(il.UnitPrice*il.Quantity) amount
FROM Customer cu
JOIN Invoice i
ON cu.CustomerId = i.CustomerId
JOIN InvoiceLine il 
ON i.InvoiceId = il.InvoiceId
JOIN Track tr 
ON tr.TrackId = il.TrackId 
JOIN Album al 
ON al.AlbumId = tr.AlbumId
JOIN Artist ar 
ON ar.ArtistId = al.ArtistId
WHERE ar.Name = 
    (SELECT artistname FROM top_earning)
GROUP BY 3,1,2
ORDER BY 4 DESC
