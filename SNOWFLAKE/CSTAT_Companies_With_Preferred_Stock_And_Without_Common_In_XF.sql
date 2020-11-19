/***********************************************************************************************
Returns Companies With Preferred Stock And Without Common

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

This query returns companies without common or ordinary stock, but with preferred shares in Xpressfeed

***********************************************************************************************/

SELECT *

FROM security

WHERE gvkey NOT IN 

( SELECT DISTINCT gvkey 
FROM security 
WHERE tpci = '0' )

AND gvkey IN ( SELECT DISTINCT gvkey 
              FROM security 
                          WHERE tpci = '1' )

