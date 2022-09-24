
INSERT INTO [star].[Payment]
SELECT DISTINCT
        p.payment_id,
       r.rider_id, 
       ((DATEPART(hour, p.date) * 3600) + (DATEPART(minute, p.date) * 60) + DATEPART(second, p.date)),
       p.amount
FROM payments p
JOIN riders r 
ON r.rider_id = p.rider_id