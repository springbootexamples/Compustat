/***********************************************************************************************
Returns Adjusted CSHOQ For A Company Over A Specific Time Period

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This querypulls the quarterly common shares outstanding (CSHOQ) on an unadjusted and adjusted basis

***********************************************************************************************/

SELECT cshoq
, ajexq
, ( cshoq * ajexq ) AS AdjustedCSHOQ
, a.gvkey
, a.datadate

FROM co_ifndq a 
JOIN co_idesind b 
ON a.gvkey = b.gvkey 
AND a.datadate = b.datadate
WHERE a.gvkey = '003144' ---Change this to find another company

AND a.datadate BETWEEN '2011-01-01' AND '2013-01-01' ---Change the specified dates here

ORDER BY b.datadate
