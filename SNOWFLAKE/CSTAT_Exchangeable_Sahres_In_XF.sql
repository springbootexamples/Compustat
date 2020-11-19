/***********************************************************************************************
Returns Exchangeable Shares

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

This query returns securities described as Exchangeable Shares in Xpressfeed using the term EXCH in the  Security Description (DSCI) data item from the security data group

***********************************************************************************************/

SELECT security.gvkey

, security.iid

, security.dsci


FROM security security

WHERE security.dsci LIKE '%EXCH%'

ORDER BY security.gvkey
