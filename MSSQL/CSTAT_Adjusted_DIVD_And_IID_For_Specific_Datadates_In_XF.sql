/***********************************************************************************************
Returns Adjusted Dividends And IID For Specific Datadates

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
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

This query provides the daily dividends on an adjusted and unadjusted basis

***********************************************************************************************/

SELECT a.gvkey
, a.iid
, a.datadate
, b.div
, b.divd
, b.divsp
, a.ajexdi
, ( b.divd/a.ajexdi ) AS adjustedDiv

FROM sec_dprc a 
JOIN sec_divid b 
ON a.gvkey = b.gvkey 

AND a.iid = b.iid 
AND a.datadate = b.datadate

WHERE a.gvkey = '009771' ---Change this to find another company

AND a.iid = '02' ---Change this for the companys security ID
AND a.datadate BETWEEN '1991-12-31' AND '9999-12-31' ---Start and end of Datadates

ORDER BY a.datadate DESC
