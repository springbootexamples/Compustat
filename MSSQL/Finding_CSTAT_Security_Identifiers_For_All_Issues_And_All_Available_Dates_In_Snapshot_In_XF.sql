/************************************************************************************************
Finding Security Identifiers for all issues and all dates in Snapshot

Packages Required:
Snapshot

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns the identifiers and the exchanges that were active for each issue 
during specified times.

***********************************************************************************************/

SELECT a . gvkey 
, a . iid
, a . effdate
, a . thrudate
, a . secstat
, a . dsci
, a . exchg
, c . exchgdesc
, a . sedol 

FROM cssecurity a--From Xpressfeed

JOIN r_ex_codes c ON a . exchg = c . exchgcd
WHERE a . gvkey = '010846'

ORDER BY a . iid , a . effdate 

 
