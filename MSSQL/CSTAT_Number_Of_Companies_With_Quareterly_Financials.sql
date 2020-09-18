/***********************************************************************************************
Returns Companies With Quarterly Financials

Packages Required:
Core
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey
isocntrycd

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query returns the number of companies per country that have quarterly or semi-annual 
financials available using the Compustat database in Xpressfeed.

***********************************************************************************************/

SELECT i.rp

, FIC, isocntrydesc, Year(datadate) datayear, Count(DISTINCT i.gvkey)Companies

FROM co_idesind i

JOIN company co ON i.gvkey = co.gvkey
JOIN r_country c ON c.isocntrycd = co.FIC--AND co_idesind.datadate = 6/30/2006

WHERE i.rp = 'q' ---‘sa’

AND Year(datadate) BETWEEN 1995 AND 2017AND i.rp IS NOT NULL

GROUP BY i.rp

, FIC, isocntrydesc, Year(datadate)

ORDER BY 1

, 2, 4 