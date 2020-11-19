/***********************************************************************************************
Returns ROA For An Index

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  returns the Return on Assets (ROA) for the S&P 500 Index as of December 31, 2016  using the Compustat files in Xpressfeed

***********************************************************************************************/

SELECT ia.datadate

, ia.ibcom

, ia.at

, ( ia.ibcom / ia.at ) * 100 AS ROA

FROM idx_ann ia

WHERE gvkeyx = '000003' --- SP 500 Index

AND ia.datadate= '2016-12-31'
