--  just a quick query to see if a computer is connected to the KBox
SELECT MACHINE.NAME, MACHINE.CONNECT_TIME, MACHINE.DISCONNECT_TIME, K.CLIENT_CONNECTED
FROM ORG1.MACHINE
JOIN KBSYS.SMMP_CONNECTION K on K.KUID = MACHINE.KUID
WHERE MACHINE.NAME = 'steelc-setuprm'
;
