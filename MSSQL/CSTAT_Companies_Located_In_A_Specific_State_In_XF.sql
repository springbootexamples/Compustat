/***********************************************************************************************
Returns Companies In A Located State

Packages Required:
Core
Core 2
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
giccd
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  finds companies in Colorado and displays their City, ZIP/Postal Code,  and GICS Sub-Industry Code and description

***********************************************************************************************/

SELECT c.gvkey, 
c.conm, 
c.gsubind, 
g.gicdesc, 
c.city, 
c.addzip

FROM company c 
LEFT OUTER JOIN r_giccd g ON c.gsubind = g.giccd

WHERE ( c.costat = 'A' ) AND ( c.state = 'CO' )

ORDER BY c.city
