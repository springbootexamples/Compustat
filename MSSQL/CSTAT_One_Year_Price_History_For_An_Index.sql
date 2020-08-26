/***********************************************************************************************
Returns One Year Price History For An Index

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
01/07/2020

DatasetKey:
8

This query returns the one-year price history for the S&P 500 Index from June 3, 2003 through June 2, 2004

***********************************************************************************************/

SELECT p.gvkeyx, p.datadate, p.prccd

FROM idx_daily p


WHERE p.gvkeyx = '000003'


AND (CAST(p.datadate AS DATE) = '6/3/2003'

OR CAST(p.datadate AS DATE)= '6/2/2004')


ORDER BY p.datadate DESC 
