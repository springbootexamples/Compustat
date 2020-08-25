/***********************************************************************************************
Returns Companies With Multiple Issues

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all companies with multiple issues of stock

***********************************************************************************************/

SELECT gvkey, COUNT ( iid )

FROM security

WHERE secstat ='A'

GROUP BY gvkey HAVING COUNT ( iid )> 1
