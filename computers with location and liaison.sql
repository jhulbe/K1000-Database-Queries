-- Report includes computers that have a label in the label group ID=439 (location)
SELECT M.NAME, M.MAC, M.IP, M.OS_NAME,
ASSET_DATA_1.FIELD_40 AS LIASON,
LABEL.NAME as LOCATION
FROM MACHINE M
LEFT JOIN MACHINE_LABEL_JT ON (MACHINE_LABEL_JT.MACHINE_ID = M.ID)
LEFT JOIN LABEL ON (LABEL.ID = MACHINE_LABEL_JT.LABEL_ID  AND LABEL.TYPE <> 'hidden')
LEFT JOIN LABEL_LABEL_JT ON (LABEL.ID = LABEL_LABEL_JT.CHILD_LABEL_ID AND LABEL_LABEL_JT.LABEL_ID = 439)
JOIN ASSET on LABEL.NAME = ASSET.NAME
JOIN ASSET_DATA_1 ON ASSET_DATA_1.ID = ASSET.ASSET_DATA_ID
WHERE LABEL_LABEL_JT.LABEL_ID = 439
