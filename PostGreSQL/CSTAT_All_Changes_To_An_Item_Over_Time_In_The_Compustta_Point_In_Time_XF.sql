/***********************************************************************************************
Returns All Changes To An Item Over Time In Compustat Point-In-Time

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
pointdate
datadate
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query uses tables in the Compustat Point-in-Time Backtest Package to show original values and any subsequent changes to a data item over time. It returns the datadate, pointdate, value and data code for the original and revised instances. The query represents an abbreviated time series in that it does not return all datadates and pointdates for the item: It only returns datadates and pointdates for when there is an original value or a change. Note:This query specifically identifies original values and changes to quarterly sales for GVKEY 001487.The mnemonic and GVKEY can be changed to run for other items and companies

***********************************************************************************************/

SELECT k.gvkey
, k.datadate
, MIN ( k.pointdate ) AS pointdate
, CASE WHEN p.saleqh_dc = 7 THEN NULL

 WHEN ( p.saleqh_dc IS NULL 


 OR p.saleqh_dc = 2 

  OR p.saleqh_dc = 3 ) 

THEN coalesce ( p.saleqh, c.saleq )

ELSE NULL END AS saleqh_alias, 
CASE WHEN p.saleqh_dc IS NOT NULL THEN p.saleqh_dc ELSE c.saleq_dc END AS saleqh_dc_alias 

FROM co_pointhstkeys k

LEFT JOIN co_pointhstfund p ON ( k.gvkey = p.gvkey )

AND ( k.pointdate = p.pointdate)
AND ( k.datadate = p.datadate)

LEFT JOIN co_pointfund c ON ( k.gvkey = c.gvkey )

AND ( k.datadate = c.datadate )
AND ( k.datacqtr = c.datacqtr )

WHERE k.gvkey IN ( '001487' )

GROUP BY k.gvkey
, k.datadate
, p.saleqh
, p.saleqh_dc
, c.saleq
, c.saleq_dc


ORDER BY k.gvkey


, k.datadate

, pointdate

