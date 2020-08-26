/***********************************************************************************************
Returns Foreign Sales As A Percentage Of Total Sales 

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the sales values for each geographic segment for IBM for fiscal year 2010 as a  percentage of total sales in Xpressfeed

***********************************************************************************************/

SELECT c.conm

, v.datadate

, v.srcdate

, v.stype

, v.sid

, t.snms 

, v.sales AS [ Net Sales ]

, s.sale AS [ Company Sales ]

, t.datadate

, c.gvkey

, ( v.sales/s.sale )*100 AS [ Percent of Foreign ]

, s.datafmt

, v.sales


FROM company c

, co_afnd2 s

, seg_type t

, seg_annfund v


WHERE c.gvkey = v.gvkey 


AND v.gvkey = t.gvkey

AND s.gvkey = v.gvkey 

AND v.datadate = t.datadate 

AND t.datadate = s.datadate 

AND v.datadate = s.datadate 

AND v.stype = t.stype 

AND v.sid = t.sid

AND c.gvkey = 006066

AND v.datadate = v.srcdate

AND v.datadate = '12/31/2010'

AND t.stype = 'geoseg'

AND t.geotp = '3'

AND s.datadate = '12/31/2010'

AND s.datafmt = 'std' 

