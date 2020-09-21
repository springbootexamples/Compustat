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
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query calculates monthly price to book ratio using daily pricing

***********************************************************************************************/

--Create this view in SQL for monthend_dprc to align the time periods correctly
SELECT top 100 
 y.*
, x.prccd
, DateAdd( day, -1, DateAdd( month, DateDiff( month, 0, x.datadate)+1, 0)) AS datadate,x.curcdd,x.qunit, x.cshoc INTO #Ttemp

FROM sec_dprc x 

JOIN ( SELECT gvkey, iid, year(datadate) AS calyear, month(datadate) AS calmonth, max(datadate) AS lasttradday FROM sec_dprc where YEAR(datadate) =2020  and gvkey = '003813'

GROUP BY gvkey

, iid

, year(datadate)

, month(datadate)) y ON x.gvkey = y.gvkey 

AND x.iid = y.iid 

AND x.datadate = lasttradday 

--Then this query calculates the price-to-book ratio:

SELECT a.gvkey

, a.iid

, a.datadate

, a.prccd

, a.cshoc

, b.datadate

, ceqq

, (cshoc *prccd)/(ceqq *1000000)  AS p2b 

FROM #Ttemp a 

LEFT JOIN co_ifndq b  ON a.gvkey = b.gvkey -- lag it by three months 

AND b.datadate BETWEEN dateadd (mm, -3, a.datadate) 

AND dateadd (ss, -1, a.datadate)

WHERE a.gvkey = '003813' --TGT 

AND cshoc IS NOT NULL

ORDER BY a.datadate 

drop table #Ttemp
