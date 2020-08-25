/***********************************************************************************************
Returns Annual Transparency Notes For Multiple Items Companies Years

Packages Required:
Core
Core 2
Transparency
Transparency History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey
indfmt
item

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns Compustat annual transparency notes for Net Sales (SALE), Cost of Goods Sold (COGS), Selling, General and Administrative Expenses (XSGA), Depreciation and Amortization (DP), and  Special Items (SPI) for IBM (GVKEY 006066), McCormick  Co Inc (GVKEY 007146), and SP Global,  Inc.(GVKEY 007163) for any time periods after November 30, 2016 in Xpressfeed

***********************************************************************************************/

SELECT e.conm

, cq1.gvkey

, CAST( cq1.datadate as date) AS datadate

, cq1.item, coalesce (cq1.label, cq1.mnemonic) AS Label

, cq1.operatorc, cq1.value

FROM company e

JOIN aco_transa cq1 ON cq1.gvkey = e.gvkey

WHERE cq1.indfmt = 'INDL'

AND cq1.datafmt = 'STD'

AND cq1.item IN ( 'SALE', 'COGS', 'XSGA', 'DP', 'SPI' )

AND e.gvkey IN ( '006066', '007163', '007146' )

AND cq1.datadate = '11/30/2016'

ORDER BY e.gvkey

, cq1.datadate, cq1.item, cq1.sequencet