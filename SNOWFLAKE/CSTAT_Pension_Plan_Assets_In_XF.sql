/***********************************************************************************************
Returns Pension Plan Assets

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the components of Pension Plan Assets and the Total Plan Assets in Xpressfeed

***********************************************************************************************/

SELECT gvkey, 
datadate, 
pbbat, 
pbarat, 
pbec, 
pbpc, 
pbp, 
pboa, 
pplao, 
( pbbat + pbarat + pbec + pbpc - pbp + pboa ) AS TotalPlanAssets


FROM aco_pnfnda
WHERE gvkey = '006066'
ORDER BY datadate DESC
