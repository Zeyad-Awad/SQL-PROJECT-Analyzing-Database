-- which countries have most
--  invoives
SELECT BillingCountry,
    COUNT(*) Invoices 
FROM Invoice
GROUP BY 1
ORDER BY 2 DESC