/***********************************************************************************************
Returns Master Limited Partnership

Packages Required:
Core
Core 2

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

This query finds Master Limited Partnerships (MLP) using Compustat data in Xpressfeed

***********************************************************************************************/

SELECT gvkey

, conm, conml 

FROM Company 

WHERE conm LIKE '%MLP%' 

OR conm LIKE '%Master Limited%'
OR conm LIKE '%Master LP%' 
