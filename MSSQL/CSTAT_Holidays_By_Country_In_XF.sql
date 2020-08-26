/***********************************************************************************************
Returns Compustat Holidays By Country 

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns U.S. holidays in Xpressfeed

***********************************************************************************************/

SELECT *

FROM r_hcalendr
WHERE isocd = 'USA'
ORDER BY datadate DESC
