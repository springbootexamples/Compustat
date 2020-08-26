/***********************************************************************************************
Returns Duplicate Company Names 

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query finds multiple company names that exist for more than one distinct GVKEY in Xpressfeed

***********************************************************************************************/


SELECT c1.gvkey 
, c1.conm
, c1.costat
, c1.fic

FROM company c1

WHERE exists ( SELECT c2.conm 
               FROM company c2 

             WHERE c1.gvkey = c2.gvkey 
                         AND c1.conm = c2.conm )

ORDER BY c1.conm
