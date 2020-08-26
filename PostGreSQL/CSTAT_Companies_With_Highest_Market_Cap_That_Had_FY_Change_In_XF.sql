/***********************************************************************************************
Returns Companies With Highest Market Cap That Had FY Change

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
cfflag
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

This query returns the companies with the highest market cap that also had a fiscal-year change using the Compustat packages in Xpressfeed

***********************************************************************************************/

SELECT  mkvalt

, compst, *

FROM co_adesind a

JOIN co_amkt b on a.gvkey=b.gvkey

WHERE datafmt != 'SUMM_STD'

AND compst='DB'

AND a.datadate BETWEEN '2013-01-01' AND '2018-12-31'

AND b.cfflag='R'

AND b.YEAR='2018'

ORDER BY b.mkvalt desc

limit 2