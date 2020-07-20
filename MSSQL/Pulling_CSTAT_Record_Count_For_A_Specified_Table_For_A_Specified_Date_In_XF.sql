/************************************************************************************************
Pulling Record Count For A Specified Table For A Specified Date.

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns the record count for a specified table for a specified time period.

***********************************************************************************************/

SELECT datadate, COUNT ( * ) 

FROM sec_dtrt

WHERE datadate = GETDATE ( ) - 30 

GROUP BY datadate 

ORDER BY datadate  

