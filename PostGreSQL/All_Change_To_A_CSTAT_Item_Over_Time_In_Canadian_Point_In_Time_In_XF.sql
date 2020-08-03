/************************************************************************************************
Pulling All Change To A Cstat Item Over Time In Canadian Point In Time In XF.

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate
srcdate

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query  query specifically identifies original values and the corresponding changes from 
the original to restated values for Quarterly Selling, General  Administrative expenses for GVKEY 149049:

***********************************************************************************************/

SELECT k.gvkey 
, k.datadate 
, MIN ( k.pointdate ) AS pointdate 
, CASE  WHEN p.xsgaqh_dc = '7'  THEN NULL 
          
		 WHEN ( p.xsgaqh_dc IS NULL OR p.xsgaqh_dc = '2' OR p.xsgaqh_dc = '3' )  THEN coalesce ( p.xsgaqh, c.xsgaq ) 
             
	     ELSE NULL  END  AS xsgaqh_alias 


, CASE  WHEN p.xsgaqh_dc IS NOT NULL THEN p.xsgaqh_dc  ELSE c. xsgaq_dc  END  AS xsgaqh_dc_alias 


FROM co_pthstkeyscdn k 

LEFT JOIN co_pthstfndcdn p  ON ( k.gvkey = p.gvkey ) 

AND ( k.pointdate = p.pointdate ) 

AND ( k.datadate = p.datadate ) 

LEFT JOIN co_ptfndcdn c  ON ( k.gvkey = c.gvkey ) 

AND ( k.datadate = c.datadate ) 

AND ( k.datacqtr = c.datacqtr ) 

WHERE k.gvkey IN ( '149049' ) 

GROUP BY k.gvkey 

, k.datadate 

, p.xsgaqh 

, p.xsgaqh_dc 

, c.xsgaq 

, c.xsgaq_dc 


ORDER BY k.gvkey 

, k.datadate 

, pointdate 

