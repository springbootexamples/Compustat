/************************************************************************************************
Pulling When Issued Stocks.

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

This query returns When Issued stocks in Xpressfeed.

***********************************************************************************************/

SELECT *
FROM security

WHERE tic LIKE '%.wi%'
