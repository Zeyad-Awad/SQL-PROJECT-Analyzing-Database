-- EMAIL|FIRST NAME|LAST NAME|GENRE

SELECT c.Email,
    c.FirstName,
    c.LastName,
    g.Name Genre 

FROM Customer c 
JOIN Invoice i 
ON c.CustomerId = i.CustomerId 
JOIN InvoiceLine il 
ON i.InvoiceId = il.InvoiceId
JOIN Track t 
ON t.TrackId = il.TrackId
JOIN Genre g 
ON g.GenreId = t.GenreId
WHERE g.Name = 'Rock'
GROUP BY 1,2,3,4
ORDER BY 1