/***********************************************************************************************
Returns Compustat Market Data

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

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

This query subtract the number of companies with market data that also have an annual  descriptor record indicating the availability of fundamental data, and returns the number of companies  with market data only

***********************************************************************************************/

SELECT COUNT ( DISTINCT ( a.gvkey ) ) AS totals
, COUNT ( DISTINCT ( a.gvkey ) ) - ( SELECT COUNT ( DISTINCT ( a.gvkey ) )


FROM co_adesind a, company b

WHERE a.gvkey = b.gvkey ) AS total_mkt_only

FROM company a, security b

WHERE a.gvkey = b.gvkey
