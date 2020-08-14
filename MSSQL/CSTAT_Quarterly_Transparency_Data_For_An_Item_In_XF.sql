/***********************************************************************************************
Returns Quarterly Transparency Data For An Item

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized
Transparency
Transparency History
Vendor Xpressfeed Dictionary
Xpressfeed Dictionary

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datefmt
gvkey
indfmt
item
mnemonic
popsrc
sequencet

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the transparency calculations of Cost of Goods Sold -  Quarterly (COGSQ) on one datadate using the Compustat Transparency data in Xpressfeed

***********************************************************************************************/

SELECT DISTINCT e.conm
, e.gvkey
, cq.datadate
, cq1.item
, cq.cogsq -- item mnemonic
, cq1.operatorc
, ISNULL(cq1.label, d.itemdesc) label, cq1.value, cq1.sequencet

FROM company e

JOIN co_ifndq cq ON e.gvkey = cq.gvkey
JOIN aco_transq cq1 ON cq1.gvkey = cq.gvkey
AND cq1.datadate = cq.datadate
AND cq1.indfmt = cq.indfmt
AND cq1.datafmt = cq.datafmt
AND cq1.popsrc = cq.popsrc
AND cq1.consol = cq.consol
LEFT JOIN dd_item d ON d.mnemonic = cq1.mnemonic

WHERE cq.indfmt = 'INDL'

AND cq1.item = 'cogsq' -- item mnemonic
AND e.gvkey = '006066'
AND cq1.datadate = '03/31/2012'

ORDER BYxa0cq1.sequencet