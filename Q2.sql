-- Question 2: Which city has 
--  the best customers?

SELECT BillingCity,
    SUM(total) invoice_total
FROM Invoice
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 1