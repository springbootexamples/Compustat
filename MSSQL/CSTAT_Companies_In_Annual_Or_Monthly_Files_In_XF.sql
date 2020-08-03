/************************************************************************************************
Finding Number Of Companies In Annual Or Monthly Files In XF.

Packages Required:
Core

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

This query returns the number of companies in the co_adesind data group.

***********************************************************************************************/

SELECT COUNT ( DISTINCT co_adesind.gvkey )

FROM co_adesind co_adesind

WHERE ( co_adesind.popsrc = 'd' )

---SELECT COUNT ( DISTINCT co_mthly.gvkey )FROM co_mthly co_mthl
---returns the number of companies in the co_mthly data group:

