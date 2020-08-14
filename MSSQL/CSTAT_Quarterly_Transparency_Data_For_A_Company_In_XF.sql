/***********************************************************************************************
Returns Quarterly Transparency Data For A Company

Packages Required:
Core
Core 2
Transparency
Transparency History
Vendor Xpresssfeed Dictionary
Xpresssfeed Dictionary

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datafmt
fyr
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

This query returns transparency data for Cost of Goods Sold Quarterly (COGSQ),  Net Sales Quarterly (SALEQ), and Selling, General, and Administrative Expenses Quarterly (XSGAQ)  for Wells Fargo  Co (WFC) at September 30, 2007 in Xpressfeed

***********************************************************************************************/

SELECT s.tic

, company.conm

, a.gvkey

, a.datadate

, a.item

, b.itemdesc

, a.sequencet

, a.mnemonic

, a.value 


FROM aco_transq a 


LEFT OUTER JOIN dd_item b ON a.item = b.mnemonic
JOIN security s ON a.gvkey = s.gvkey
JOIN company ON s.gvkey = company.gvkey
LEFT OUTER JOIN dd_item c ON a.mnemonic = c.mnemonic
LEFT OUTER JOIN aco_notesq d 

ON a.gvkey = d.gvkey
AND a.datadate = d.datadate
AND a.indfmt = d.indfmt
AND a.datafmt = d.datafmt
AND a.consol = d.consol
AND a.popsrc = d.popsrc
AND a.item = d.item
AND a.fyr = d.fyr
AND a.item = d.item AND a.sequencet = d.sequencet 

WHERE s.tic = 'WFC'

AND a.datadate = '09/30/2007' AND a.item IN ( 'SALEQ', 'COGSQ', 'XSGAQ' ) 

ORDER BY 1, 4 DESC, 5, 7 
