SELECT OWNER_ID, USER.USER_NAME, COUNT(ASSET.ID) as Assets,
GROUP_CONCAT(M.NAME) as Computers
FROM ASSET
LEFT JOIN USER on USER.ID = ASSET.OWNER_ID
LEFT JOIN MACHINE M on M.ID = ASSET.MAPPED_ID
WHERE ASSET_TYPE_ID = 5
and OWNER_ID != 0
and USER.USER_NAME not like '%computer'
GROUP BY OWNER_ID
HAVING Assets > 1
ORDER BY Assets DESC