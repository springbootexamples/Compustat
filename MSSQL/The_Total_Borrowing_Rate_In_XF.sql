/************************************************************************************************
Calculating Total Borrowing Rate.

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey
indfmt

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns the Borrowing Rate by dividing Interest Expense by 
Total Debt multiplied by 100 to return a percentage for IBM for the fiscal-year ending 12/31/2008.

***********************************************************************************************/

SELECT a.gvkey
, a.datadate
, a.datafmt
, a.indfmt
, b.xint
, a.dltt
, a.dlc
, ( b.xint/ ( a.dltt+a.dlc ) *100 ) AS borrowrate

FROM co_afnd1 a, co_afnd2 b
WHERE a.gvkey = b.gvkey

AND a.datadate = b.datadate
AND a.datafmt = b.datafmt
AND a.indfmt = b.indfmt
AND a.datafmt = 'std'
AND a.datadate = '12/31/2008'
AND a.gvkey = '006066'

