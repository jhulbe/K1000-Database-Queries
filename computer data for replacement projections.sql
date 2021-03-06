-- Custom report to generate a list of computers with their PO information
-- Our computer asset includes custom fields for PO information and upgrade Cycle
-- Based on purchase date and upgrade cycle, the upgrade date is calculated
SELECT M.ID as UID, M.NAME, M.MAC, M.IP, M.OS_NAME,
M.BIOS_SERIAL_NUMBER, CS_MANUFACTURER, CS_MODEL, RAM_TOTAL,
LAST_USER, USER_FULLNAME, MONITOR,
ASSET_DATA_1.FIELD_40 AS LIAISON,
LOCATION.NAME as LOCATION,
ASSET_DATA_5.FIELD_32 as "PO Number",
ASSET_DATA_5.FIELD_10013 as "PO Date",
ASSET_DATA_5.FIELD_10015 as "Upgrade Cycle",
DATE_ADD(CAST(ASSET_DATA_5.FIELD_10013 as DATE), INTERVAL ASSET_DATA_5.FIELD_10015 YEAR) as "Upgrade Date",
USER.FULL_NAME as "Assigned To",
USER.USER_NAME as "Assigned to User"
FROM MACHINE M
LEFT JOIN ASSET on ASSET.MAPPED_ID = M.ID and ASSET.ASSET_TYPE_ID = 5
LEFT JOIN ASSET LOCATION on LOCATION.ID = ASSET.LOCATION_ID
LEFT JOIN ASSET_DATA_1 ON ASSET_DATA_1.ID = LOCATION.ASSET_DATA_ID
LEFT JOIN ASSET_DATA_5 on ASSET_DATA_5.ID = ASSET.ASSET_DATA_ID
LEFT JOIN USER on USER.ID = ASSET.OWNER_ID
