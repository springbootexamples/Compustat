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
POSTGRESQL

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

, FIC, isocntrydesc, extract ( year from cast(datadate as date)) datayear, Count(DISTINCT i.gvkey)Companies

FROM co_idesind i

JOIN company co ON i.gvkey = co.gvkey
JOIN r_country c ON c.isocntrycd = co.FIC--AND co_idesind.datadate = 6/30/2006

WHERE i.rp = 'Q' ---‘sa’

AND  extract ( year from cast(datadate as date)) BETWEEN 1995 AND 2017 AND i.rp IS NOT NULL

GROUP BY i.rp

, FIC, isocntrydesc, extract ( year from cast(datadate as date))

ORDER BY 1

, 2, 4;