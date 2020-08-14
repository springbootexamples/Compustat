/***********************************************************************************************
Returns Level 3 Fair Value Transparency

Packages Required:
Core
Core 2
Transparency
Transparency History
Vendor Xpressfeed Dictonary
Xpressfeed Dictonary

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datafmt
gvkey
fyr
idnfmt
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

This query returns quarterly transparency for Level 3 assets and liabilities in Xpressfeed

***********************************************************************************************/

SELECT company.conm 

, a.gvkey
, a.datadate
, a.item
, b.itemdesc
--- ISNULL ( a.operatorc,  )
, a.value
,ISNULL ( c.itemdesc, a.label )
, a.mnemonic
 --ISNULL ( d.note,  ) 


FROM aco_transq a 


LEFT OUTER JOIN dd_item b ON a.item = b.mnemonic
JOIN company ON a.gvkey = company.gvkey
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
AND a.item = d.item
AND a.sequencet = d.sequencet 

WHERE a.item IN ( 'aul3q' , 'lul3q' ) 

AND company.gvkey = 001078 AND a.datadate = '6/30/2009'


ORDER BY a.gvkey 

, a.datadate DESC , a.item, a.sequencet 

