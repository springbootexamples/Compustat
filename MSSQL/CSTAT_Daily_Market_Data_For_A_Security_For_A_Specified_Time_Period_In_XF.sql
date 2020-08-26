/***********************************************************************************************
Returns Daily Market Data For A Security 

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
curcdd
gvkey
datadate
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  provides the daily close price (PRCCD), adjustment factor (AJEXDI), and  common shares outstanding (CSHOC) for a security over a specified date range

***********************************************************************************************/

SELECT a.gvkey
, b.sedol, 
a.iid, 
a.datadate, 
a.curcdd, 
a.prccd, 
a.ajexdi, 
a.cshoc

FROM sec_dprc a 
JOIN security b ON a.gvkey = b.gvkey 
AND a.iid = b.iid

WHERE a.gvkey = '006066' ---Change this to find another company


AND a.iid = '01' ---Change this to the new companys security IID

AND datadate BETWEEN '2013-01-01' AND '2014-01-01' ---Change this for the time-frame


ORDER BY a.datadate DESC
