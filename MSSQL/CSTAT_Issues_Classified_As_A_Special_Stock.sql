/***********************************************************************************************
Returns Compustat Issues Classified As A Special Stock

Packages Required:
Core
Core 2
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
tpcicd

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all of the data items from the security table for issues of stock classified  as Special Stock (TPCI = Q) in Xpressfeed

***********************************************************************************************/

SELECT a.*, 
b.tpcicd 

FROM security a 

INNER JOIN r_issuetyp b 

ON a.TPCI = b.tpcicd 

WHERE a.TPCI = 'Q'
