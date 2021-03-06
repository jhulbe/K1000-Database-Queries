SELECT DISTINCT(SOFTWARE.DISPLAY_NAME)
FROM LABEL
JOIN MACHINE_LABEL_JT on MACHINE_LABEL_JT.LABEL_ID = LABEL.ID
JOIN MACHINE on MACHINE.ID = MACHINE_LABEL_JT.MACHINE_ID
JOIN MACHINE_SOFTWARE_JT on MACHINE_SOFTWARE_JT.MACHINE_ID = MACHINE_LABEL_JT.MACHINE_ID
JOIN SOFTWARE on SOFTWARE.ID = MACHINE_SOFTWARE_JT.SOFTWARE_ID 
WHERE LABEL.NAME = "Library Services"
AND NOT IS_PATCH

ORDER BY SOFTWARE.DISPLAY_NAME