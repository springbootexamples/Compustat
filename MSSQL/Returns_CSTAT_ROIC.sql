/***********************************************************************************************
Returns ROIC For A Company

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query calculates Return on Invested Capital (ROIC) for a company (Here INTL BUSINESS MACHINES CORP)
using the Compustat packages in Xpressfeed.

***********************************************************************************************/

SELECT a.conm

, a.gvkey, b.datadate, b.datafmt, b.ibcom, b.icapt, (b.ibcom / b.icapt) AS ROIC

FROM company a

JOIN co_afnd1 b ON a.gvkey = b.gvkey

WHERE a.gvkey = 006066

AND b.datafmt = 'STD'

ORDER BY b.datadate DESC