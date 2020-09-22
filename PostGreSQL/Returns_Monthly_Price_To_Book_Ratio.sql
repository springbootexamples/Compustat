/***********************************************************************************************
Returns monthly price to book ratio

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
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

The following sample query calculates monthly price to book ratio using daily pricing

***********************************************************************************************/

--Create this view in SQL for monthend_dprc to align the time periods correctly

do $$
BEGIN
drop table if exists temp_table;
create temporary table if not exists temp_table as

SELECT 
 y.*
, x.prccd
--, DateAdd( day, -1, DateAdd( month, DateDiff( month, 0, x.datadate)+1, 0)) AS datadate,x.curcdd,x.qunit, x.cshoc 
,  (date_trunc('MONTH', x.datadate) + INTERVAL '1 MONTH - 1 day')::date as datadate,x.curcdd,x.qunit, x.cshoc 

FROM sec_dprc x 

JOIN ( SELECT gvkey, iid, extract (year from datadate) AS calyear, extract (month from datadate) AS calmonth, max(datadate) AS lasttradday FROM sec_dprc where extract (year from datadate) =2020  and gvkey = '003813'

GROUP BY gvkey

, iid

,  extract (year from datadate) 

, extract (MONTH from datadate) ) y ON x.gvkey = y.gvkey 

AND x.iid = y.iid 

AND x.datadate = lasttradday LIMIT 100;

end $$;
--Then this query calculates the price-to-book ratio:

SELECT a.gvkey

, a.iid

, a.datadate

, a.prccd

, a.cshoc

, b.datadate

, ceqq

, (cshoc *prccd)/(ceqq *1000000)  AS p2b 

FROM temp_table a 

LEFT JOIN co_ifndq b  ON a.gvkey = b.gvkey -- lag it by three months 

AND b.datadate BETWEEN  a.datadate - interval '3 minutes' ---dateadd (mm, -3, a.datadate) 

AND  a.datadate - interval '1 seconds'---dateadd (ss, -1, a.datadate)

WHERE a.gvkey = '003813' --TGT 

AND cshoc IS NOT NULL

ORDER BY a.datadate;

