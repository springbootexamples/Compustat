/***********************************************************************************************
Returns Population Of Private Companies With Public Debt

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

This query returns the companies with public debt in the Compustat population in Xpressfeed

***********************************************************************************************/

SELECT DISTINCT a.gvkey

, a.conm

, a.conml

, a.costat

, b.secstat

, b.exchg

, b.tic

, c.itemvalue

, c.thrudate

FROM company a

, [security]b, co_cotype c

WHERE a.gvkey = b.gvkey

AND a.gvkey = c.gvkey
AND a.conm NOT LIKE '%REDH%'
AND a.conm NOT LIKE '%-SPN'
AND a.costat = 'A'
AND b.secstat = 'A'
AND b.exchg IN (0,1)AND c.itemvalue IN ('SUB','PRIVATE')AND c.thrudate IS NULL