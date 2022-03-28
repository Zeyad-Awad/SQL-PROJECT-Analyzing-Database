-- TOP CUSTOMER PER COUNTRY
-- COUNTRY|SPENT|FIRST|LAST
WITH t1 AS(
    SELECT cu.Country,
        SUM(i.Total) totalspent,
        cu.FirstName,
        cu.LastName
    FROM Customer cu 
    JOIN Invoice i 
    ON cu.CustomerId = i.CustomerId
    GROUP BY 3,4,1
),
t2 AS(
    SELECT MAX(totalspent) totspent,
        Country
    FROM t1
    GROUP BY 2
)

SELECT t1.Country, totspent, FirstName, LastName
FROM t1
JOIN t2 
ON t1.Country = t2.Country
    AND t1.totalspent = t2.totspent
ORDER BY t1.Country