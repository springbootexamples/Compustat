/***********************************************************************************************
Returns BerryQ Ratio 

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
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the quarterly Berry Ratio for a company using the Compustat  packages in Xpressfeed. Note: This query replicates the quarterly Berry Ratio (BERRYQ) concept in Research Insight

***********************************************************************************************/

Select a.gvkey

,a.conm

,c.datadate

,CONVERT(DECIMAL(10,2)

,(c.saleq-c.cogsq)/NULLIF(c.xsgaq,0)) BerryQtly,---- ASxa0Items used---,

c.saleq

,c.cogsq

,c.xsgaq

FROM company a LEFT JOIN co_ifndq c ON a.gvkey=c.gvkey

WHERE a.gvkey IN (008007,005047,134450)

AND c.datafmt = 'std' --Standard Compustat unrestated annual data

AND c.datadate = '2017-12-31'

AND c.indfmt = 'indl' -- Standard Compustat Industrial presentation will exclude Financial Services FS record for financial companies

ORDER BY c.datadate