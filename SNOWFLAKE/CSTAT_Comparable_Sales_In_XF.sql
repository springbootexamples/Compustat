/***********************************************************************************************
Returns Comparable Sales

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

This query returns the details of the Comparable Sales (%) - Quarterly for a company in Xpressfeed

***********************************************************************************************/

SELECT RTLCSQ, *

FROM aco_indstq

WHERE gvkey = '004990'

ORDER BY datadate DESC
