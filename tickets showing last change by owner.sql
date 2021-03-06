SELECT T.ID, Q.NAME, CAT.NAME, T.TITLE, S.FULL_NAME, O.USER_NAME, STATUS.NAME, T.CREATED, TC.TIMESTAMP as "Last Change",

CONCAT(
   FLOOR(HOUR(TIMEDIFF(NOW(), TC.TIMESTAMP)) / 24), ' days, ',
   MOD(HOUR(TIMEDIFF(NOW(), TC.TIMESTAMP)), 24), ' hours, ',
   MINUTE(TIMEDIFF(NOW(), TC.TIMESTAMP)), ' minutes, ',
   SECOND(TIMEDIFF(NOW(), TC.TIMESTAMP)), ' seconds')
AS "Time Since Last Change"
FROM HD_TICKET T
JOIN HD_QUEUE Q on Q.ID = T.HD_QUEUE_ID
JOIN USER O on O.ID = T.OWNER_ID
JOIN USER S on S.ID = T.SUBMITTER_ID
JOIN HD_CATEGORY CAT on CAT.ID = T.HD_CATEGORY_ID
JOIN HD_STATUS STATUS on STATUS.ID = T.HD_STATUS_ID
JOIN HD_TICKET_CHANGE TC on TC.HD_TICKET_ID = T.ID and TC.USER_ID = T.OWNER_ID and TC.ID = (select MAX(ID) FROM HD_TICKET_CHANGE WHERE HD_TICKET_ID = T.ID)
WHERE T.TIME_CLOSED = "0000-00-00 00:00:00"