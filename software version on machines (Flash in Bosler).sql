-- Example report to find the version of a specific software title on a group of computers 
select CONCAT(DISPLAY_NAME, " (", DISPLAY_VERSION ,")") as Software_Title,
MACHINE.NAME as Computer_Name,
SYSTEM_DESCRIPTION,
IP, MAC, CS_DOMAIN,
REPLACE(MACHINE.USER_LOGGED,'\\','\\\\') as USER_LOGGED
from (SOFTWARE, MACHINE_SOFTWARE_JT, MACHINE)
where MACHINE.ID = MACHINE_SOFTWARE_JT.MACHINE_ID and MACHINE_SOFTWARE_JT.SOFTWARE_ID = SOFTWARE.ID
and not IS_PATCH
and DISPLAY_NAME like "Adobe Flash Player%"
and MACHINE.NAME like "bos%"
order by Computer_Name, Software_Title
