/***********************************************************************************************
Returns Daily TRFD

Packages Required:
Core
Core 2

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

This query returns the most recent value for Total Return Factor -  Daily (TRFD) using the Compustat database in Xpressfeed. Note:Uncomment the second query to return TRFD for a specific datadate

***********************************************************************************************/

SELECT * 

FROM sec_dtrt

WHERE thrudate IS NULL


AND gvkey = '007163'

AND iid = '01'



/**SELECT *

FROM sec_dtrt

WHERE gvkey = 007163


AND iid = 01

AND '2009-01-25'

BETWEEN sec_dtrt. datadate

AND ISNULL ( sec_dtrt. thrudate, 2900-01-01 )**/