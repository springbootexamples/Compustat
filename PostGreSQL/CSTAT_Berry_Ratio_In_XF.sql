/************************************************************************************************
Calculating Berry Ratio

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datafmt
gvkey
indfmt
popsrc

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns the Berry Ratio for companies on a specific datadate using the Compustat packages
in Xpressfeed. Note: This query replicates the Berry Ratio (BERRY) concept in Research Insight.

***********************************************************************************************/

SELECT a.gvkey

, a.conm

, b.datadate

, ((c.sale-b.cogs)/COALESCE(c.xsga,0)) AS Berry_annual

FROM company a 

LEFT JOIN co_afnd1 b ON b.gvkey = a.gvkey

LEFT JOIN co_afnd2 c ON c.gvkey = b.gvkey

AND c.datadate = b.datadate

AND c.indfmt = b.indfmt

AND c.datafmt = b.datafmt

AND b.consol = c.consol

AND b.popsrc = c.popsrc

WHERE a.gvkey IN ('001078'

,'002285','003851','004503','005047','007257','012141','009203','008007')

AND b.datafmt = 'STD'

AND b.datadate = '2017-12-31'

AND b.indfmt = 'INDL'

ORDER BY a.conm
