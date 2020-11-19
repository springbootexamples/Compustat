/***********************************************************************************************
Returns Companies With Amended Financial Statements

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all companies that filed an amended 10-K for the fiscal year ending 12/31/2009

***********************************************************************************************/

SELECT co_filedate.gvkey
, co_filedate.datadate
, co_filedate.srctype
, co_filedate.filedate

FROM co_filedate co_filedate

WHERE co_filedate.datadate = '12/31/2009' 
AND co_filedate.srctype = '10K/A'