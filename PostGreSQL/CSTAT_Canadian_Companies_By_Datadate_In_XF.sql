/***********************************************************************************************
Returns Canadian Companies

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns Canadian companies by annual datadate

***********************************************************************************************/

SELECT a.gvkey
, a.conm
, a.fic
, b.datadate

FROM company a, co_adesind b

WHERE a.gvkey = b.gvkey

AND a.fic = 'CAN' 
AND CAST(b.datadate as VARCHAR(10))='1950/07/31'

ORDER BY b.datadate 





