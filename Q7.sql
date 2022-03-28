-- TOP GENRE PER COUNTRY
WITH 
    t1 AS(
        SELECT COUNT(*) purchases,
            cu.Country country,
            ge.Name genre_name,
            ge.GenreId genre_id

        FROM Customer cu 
        JOIN Invoice i
        ON cu.CustomerId = i.CustomerId
        JOIN InvoiceLine il 
        ON i.InvoiceId = il.InvoiceId
        JOIN Track tr 
        ON tr.TrackId = il.TrackId
        JOIN Genre ge 
        ON ge.GenreId = tr.GenreId
        GROUP BY 2,3,4
        ORDER BY 2 ASC
    ),
    t2 AS(
        SELECT MAX(t1.purchases) max_,
            t1.country country
        FROM t1
        GROUP BY 2
        )

SELECT *
FROM t2
JOIN t1 
ON max_ = t1.purchases 
    AND t1.country = t2.country