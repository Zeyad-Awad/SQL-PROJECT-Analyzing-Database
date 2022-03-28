-- VIS 3
SELECT cu.Country, 
    cu.State,
    SUM(i.Total) TotalSpent
FROM Customer cu
JOIN Invoice i
ON cu.CustomerId = i.CustomerId
GROUP BY 1,2
HAVING cu.Country = 'USA'
