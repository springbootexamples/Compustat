/***********************************************************************************************
Returns Data Availability For A Particular Index

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  the data available the REIT Index in Xpresfeed

***********************************************************************************************/

SELECT * 

FROM spidx_cst 

WHERE indexid = 'reit' 

ORDER BY datadate 
