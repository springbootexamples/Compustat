/***********************************************************************************************
Returns Business Segments For A Company 

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate
srcdate

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  returns the Company Name, GVKEY, Data Date, Segment Name, and Segment Sales for business segments for the entire history of a company in Xpressfeed. Note: Uncomment the second query to get the number of all active segments specified per segment for a company on each available data date using Compustat packages in Xpressfeed

***********************************************************************************************/

SELECT c.conm, 
s.gvkey, 
s.datadate, 
s.stype, 
s.sid, 
b.snms, 
s.sales 

FROM seg_annfund s
, company c, seg_type b

WHERE c. gvkey = s. gvkey


AND c.gvkey = b.gvkey
AND s.gvkey = b.gvkey
AND s.sid = b.sid
AND s.datadate = b.datadate
AND s.stype = b.stype
AND c.gvkey = '005134'
AND s.stype = 'BUSSEG'

ORDER BY s.datadate , s.sid


/**
SELECT c.conm, CONVERT ( VARCHAR ( 10 ) , s.datadate, 101 ) AS datadate, COUNT ( * ) num_of_segs, s.stype

FROM seg_annfund s, company c

WHERE c.gvkey = s.gvkey AND c.gvkey = '005134'

GROUP BY s.gvkey, c.conm, s.datadate, s.stype

ORDER BY s.datadat
**/