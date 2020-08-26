/***********************************************************************************************
Returns Non MSCI Indices

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

This query returns non MSCI indices with constituents available in Xpressfeed

***********************************************************************************************/

SELECT * 

FROM idx_index

WHERE indexcat = 'MSCIFEED'


AND idxcstflg = 'Y'


ORDER BY conm
