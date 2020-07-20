/************************************************************************************************
Pulling One Year Price History For An Index.

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns the one-year price history for the SP 500 Index from June 3, 
2003 through June 2, 2004.

***********************************************************************************************/

SELECT p.gvkeyx, p.datadate, p.prccd

FROM idx_daily p

WHERE p.gvkeyx = 000003


AND p.datadate = '6/3/2003'

AND p.datadate = '6/2/2006'


ORDER BY p.datadate DESC 
