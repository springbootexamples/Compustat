/***********************************************************************************************
Returns Record Count For A Specified Table For A Specified Date

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
POSTGRESQL

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

WHERE cast(datadate as date) = cast(NOW() - interval  '30 day' as date)

GROUP BY datadate 

ORDER BY datadate  

