-- Question 3: Who is the best 
--  customer?

SELECT c.FirstName, c.LastName,
    SUM(total)
from customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
GROUP BY 1,2
ORDER BY 3 DESC 
LIMIT 1