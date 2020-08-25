/***********************************************************************************************
Returns AJEXQ For Current Month

Packages Required:
Core

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

This query In Compustat Xpressfeed, AJEXQ is tied to quarterly fundamental data  availability so AJEXQ is not available until the fundamental data for that period is available.  You can find more current information in Compustat Xpressfeed utilizing the co_adjfact data group. Co_adjfact is organized with effective from and thru dates rather than specific data periods. Note: Uncomment the second query to return the adjustment factor as of a specific date returning only  one row of data

***********************************************************************************************/

SELECT *

FROM co_adjfact

WHERE gvkey = '014802'
AND adjex IS NOT NULL

ORDER BY effdate

/***

SELECT *

FROM co_adjfact

WHERE gvkey = '014802'


AND adjex IS NOT NULL

AND effdate = '12/31/2007'

AND thrudate = '12/31/2007'


ORDER BY effdate
***/