/***********************************************************************************************
Determining Primary Issues

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the primary issue when more than one issue is listed as primary  in the Compustat Company table in Xpressfeed

***********************************************************************************************/

SELECT a.*
FROM security a 


JOIN 


( SELECT GVKEY

, CASE WHEN 'FIC' = 'USA' THEN COALESCE ( PRIUSA, PRICAN, PRIROW ) 


WHEN 'FIC' = 'CAN' THEN COALESCE ( PRICAN, PRIUSA, PRIROW )ELSE COALESCE ( PRIROW,PRIUSA,PRICAN ) END AS iid FROM COMPANY ) b 

ON a.gvkey = b.gvkey
AND a.iid = b.iid 
WHERE a.gvkey = '064072' 
