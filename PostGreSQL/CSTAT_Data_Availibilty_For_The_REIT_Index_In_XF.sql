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
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query returns all the data available for the REIT Index in Xpresfeed

***********************************************************************************************/

SELECT * 

FROM idx_index

WHERE indexid LIKE '%REIT%' 
