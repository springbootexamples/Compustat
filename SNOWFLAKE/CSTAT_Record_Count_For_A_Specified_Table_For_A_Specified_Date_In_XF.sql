/***********************************************************************************************
Returns Record Count For A Specified Table For A Specified Date

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the record count for a specified table for a specified time period

***********************************************************************************************/

SELECT datadate, COUNT ( * ) 

FROM sec_dtrt

WHERE CAST(datadate AS DATE)  = CAST(DATEADD(DAY, -30, CURRENT_DATE())AS DATE)

GROUP BY datadate 

ORDER BY datadate  DESC



