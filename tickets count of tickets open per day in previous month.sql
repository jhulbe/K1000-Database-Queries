SELECT DATE(HD_TICKET.CREATED) as "Day",
COUNT(HD_TICKET.ID) as "Tickets Opened"

FROM HD_TICKET  
JOIN HD_CATEGORY ON (HD_CATEGORY.ID = HD_TICKET.HD_CATEGORY_ID) 
LEFT JOIN USER O ON (O.ID = HD_TICKET.OWNER_ID) 
WHERE (HD_TICKET.HD_QUEUE_ID = 2) 
AND MONTH(HD_TICKET.CREATED) = MONTH(DATE_SUB(NOW(),INTERVAL 1 MONTH))
AND YEAR(HD_TICKET.CREATED) = YEAR(DATE_SUB(NOW(),INTERVAL 1 MONTH))
GROUP BY DAY(HD_TICKET.CREATED)
