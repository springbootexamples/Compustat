/***********************************************************************************************
Returns Dual Listed Companies With Both US And Non-US Security Listings

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all companies that have both an a U.S. security listing (IID of 01) and  a non-U.S. security listing (IID of 01C), meaning they are double-followed Canadian companies

***********************************************************************************************/

SELECT DISTINCT gvkey

FROM security

WHERE IID IN ( '01', '02', '03', '04', '05' )

AND gvkey IN ( SELECT gvkey
               FROM security
                           WHERE IID LIKE' %C' )

