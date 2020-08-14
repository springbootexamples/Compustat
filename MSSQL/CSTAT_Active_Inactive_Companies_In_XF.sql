/***********************************************************************************************
Returns Active/Inactive Companies

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

This query  returns all active companies in Xpressfeed. Note: Uncomment the second query to get all inactive companies

***********************************************************************************************/

SELECT company.gvkey
, company.conm
, company.costat

FROM company company
WHERE ( company.costat = 'A' )
ORDER BY company.gvkey

/****
SELECT company.gvkey
, company.conm
, company.costat

FROM company company
WHERE ( company.costat = 'I' )
ORDER BY company.gvkey
****/
