/***********************************************************************************************
Returns NAICS And SIC Codes For A Company Segments

Packages Required:
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
siccd

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the Standard Industrial Classification Code - Segment (SICS) and North American Industry  Classification Code - Segment (NAICSS) for a companys segments

***********************************************************************************************/

SELECT a.GVKEY, 
a.DATADATE, 
a.SID, 
SNMS, 
RANKS, 
NAICSS, 
SICS, 
c.SICDESC, 
c.SICSTAT

FROM seg_naics a

JOIN seg_type b ON a.GVKEY = b.GVKEY
AND a.DATADATE = b.DATADATE
AND a.STYPE = b.STYPE
AND a.SID = b.SID

JOIN r_siccd c ON c.SICCD = a.SICS

WHERE a.GVKEY = '003243' --- GVKEY for the Company

--- and a.SID = 31 --- use if we are looking at a specific segment--- and a.DATADATE  12-31-2010 --- use if we are looking for a specific date range

ORDER BY a.DATADATE, a.SID
