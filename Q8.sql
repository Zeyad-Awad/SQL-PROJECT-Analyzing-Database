-- TRACKS ABOVE AVERAGE LENGTH|MS

SELECT Name,
    Milliseconds
FROM Track
WHERE Milliseconds > (SELECT AVG(Milliseconds) 
    FROM Track)
    ORDER BY 2 DESC