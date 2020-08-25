/***********************************************************************************************
Returns Geographic Segments For A Company

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
24/08/2020

DatasetKey:
8

This query returns all geographic segments and sales for each segment for IBM as  of December 31, 2016 using Compustat Segment packages in Xpressfeed

***********************************************************************************************/

SELECT c.conm,
--, CONVERT (VARCHAR ( 10 ), g.datadate, 101) AS datadate, 
cast(g.datadate as date) AS datadate,
g.stype, 
g.sid, 
g.gareag AS geo_area, 
g.gareat AS geo_type, a.sales

FROM company c

JOIN seg_geo g ON c.gvkey = g.gvkey
JOIN seg_annfund a ON a.gvkey = g.gvkey
AND a.stype = g.stype
AND a.sid = g.sid
AND a.datadate = g.datadate

WHERE c.gvkey = '006066'

AND g.datadate = '2016-12-31'
AND a.srcdate = g.datadate--PULLS IN DATA FROM PERIOD END SOURCE DATE
AND g.stype = 'GEOSEG'

ORDER BY g.gvkey

, g.datadate, g.stype, g.sid, g.gareag