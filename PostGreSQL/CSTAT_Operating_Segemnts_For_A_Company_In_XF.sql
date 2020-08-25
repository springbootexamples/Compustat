/***********************************************************************************************
Returns Operating Segments For A Company

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
01/07/2020

DatasetKey:
8

This query returns all operating segments for ALLIS-CHALMERS ENERGY INC as of 12/31/2007 _ /

***********************************************************************************************/

SELECT c.conm
, CAST (  n.datadate as date ) AS " datadate "
, n.stype
, n.sid
, n.ranks
, n.naicss
, rn.naicsdesc
, n.sics
, rs.sicdesc

FROM company c
, seg_naics n
, r_naiccd rn
, r_siccd rs

WHERE c.gvkey = n.gvkey

AND n.naicss = rn.naicscd
AND n.sics = rs.siccd 
AND n.gvkey = '001308'
AND ( n.datadate = '2007-12-31' )
AND n.stype = 'OPSEG'

ORDER BY n.gvkey
, n.datadate
, n.stype
, n.sid

