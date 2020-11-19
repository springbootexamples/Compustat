/***********************************************************************************************
Returns Primary And Secondary SIC Codes For A Company

Packages Required:
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
siccd

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the primary and secondary Standard Industrial Classification (SIC) codes for a company in Xpressfeed. Note: Uncomment the second query to return the historical SIC Xpressfeed

***********************************************************************************************/

SELECT s.srcdate

, s.sid

, s.stype

, s.sales

, n.ranks

, b.*

, n.sics


FROM SEG_ANNFUND s


JOIN seg_naics n ON n.gvkey = s.gvkey


AND n.datadate = s.datadate

AND n.sid = s.sid

AND n.stype = s.stype


LEFT JOIN r_siccd b ON n.sics = b.siccd


WHERE n.gvkey = '001537'


AND n.datadate = '1986-12-31'

AND s.stype = 'BUSSEG'


ORDER BY sales DESC

/*

SELECT s.srcdate

, s.sid

, s.stype

, s.sales

, n.ranks

, b.*

, n.sics

, h.sich


FROM SEG_ANNFUND s

JOIN seg_naics n ON n.gvkey = s.gvkey

AND n.datadate = s.datadate

AND n.sid = s.sid

AND n.stype = s.stype

LEFT JOIN r_siccd b ON n.sics = b.siccd

JOIN co_industry h 

ON s.gvkey=h.gvkey AND s.datadate=h.datadate

WHERE n.gvkey = '001537'


AND n.datadate = '1986-12-31'

AND s.stype = 'BUSSEG'

ORDER BY sales DESC

*/