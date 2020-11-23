/***********************************************************************************************
Returns Structured Products

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

This query r returns Structured Products using Compustat tables in Xpressfeed

***********************************************************************************************/

SELECT dsci, *

FROM security

WHERE dsci LIKE '%STRUCT%PROD%'