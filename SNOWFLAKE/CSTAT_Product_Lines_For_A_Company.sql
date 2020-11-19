/***********************************************************************************************
Returns Compustat Product Lines For A Company

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all reported product lines for Georgia Pacific as of December 31, 2002

***********************************************************************************************/

SELECT c.conm
,TO_VARCHAR (p.datadate,'mm/dd/yyyy' ) datadate, 
to_char ( p.pdid) +  pdid AS pdid
, p.pnms
, p.saleps
, p.naicsp
, n.naicsdesc

FROM seg_product p
, company c
, r_naiccd n

WHERE c.gvkey = p.gvkey
AND p.naicsp = n.naicscd
AND c.gvkey = '005134'
AND p.datadate = '2002-12-31'

ORDER BY p.gvkey
, p.datadate
, p.saleps DESC 

