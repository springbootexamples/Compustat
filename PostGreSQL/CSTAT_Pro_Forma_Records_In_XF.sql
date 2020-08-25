/***********************************************************************************************
Returns Pro Forma Records

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

This query finds pro-forma companies using the Compustat database in Xpressfeed

***********************************************************************************************/

SELECT a.gvkey
, a.datadate 
, a.consol 
, a.indfmt 
, b.conm

FROM co_adesind a

JOIN company b ON a.gvkey = b.gvkey

WHERE a.consol = 'r'

ORDER BY a.datadate DESC
