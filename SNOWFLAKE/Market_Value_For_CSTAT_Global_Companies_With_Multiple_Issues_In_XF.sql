/***********************************************************************************************
Returns Market Value For Global Companies With Multiple Issues

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey
iid

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query calculates market capitalization for a Global company with multiple  issues with fundamental data available

***********************************************************************************************/

SELECT a.gvkey , 
b.datadate, 
SUM ( ( ( cshoc/1000000 ) * prccd ) / IFNULL ( qunit, 1 ) ) AS company_level_market_cap

FROM security a 

JOIN sec_dprc b 

ON a.gvkey = b.gvkey 
AND a.iid = b.iid --Issue participates in earnings 

WHERE a.epf = 'Y' 

AND a.gvkey = '015634'
AND b.datadate = '12/31/2010' 

GROUP BY a.gvkey
, b.datadate 

ORDER BY a.gvkey
, b.datadate DESC 

