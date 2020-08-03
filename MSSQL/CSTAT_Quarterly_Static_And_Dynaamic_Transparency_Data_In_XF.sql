/************************************************************************************************
Finding Quarterly  Static And Dynamic Transparency Data.

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
01\07\2020

DatasetKey:
8

This query returns both the static and dynamic quarterly transparency for a GVKEY on a specific datadate.

***********************************************************************************************/

SELECT company.conm 


, a.gvkey 

, a.datadate 

, a.item 

, b.itemdesc 

---, ISNULL ( a.operatorc,  ) AS operator 

, a.value 

---, ISNULL ( c.itemdesc, a.label ) AS label 

, d.note 

, d.subtype 

, a.sequencet 


FROM aco_transq a 

LEFT OUTER JOIN dd_item b ON a.item = b.mnemonic 

JOIN company ON a.gvkey = company.gvkey 

LEFT OUTER JOIN dd_item c ON a.mnemonic = c.mnemonic 

LEFT OUTER JOIN aco_notesq d ON a.gvkey = d.gvkey 

AND a.datadate = d.datadate 

AND a.indfmt = d.indfmt 

AND a.datafmt = d.datafmt 

AND a.consol = d.consol 

AND a.popsrc = d.popsrc 

AND a.item = d.item 

AND a.fyr = d.fyr 

AND a.item = d.item 

AND a.sequencet = d.sequencet 

WHERE a.gvkey IN ( '001210' ) AND a.datadate = '6/30/2010' 

ORDER BY 1 , 4 DESC , 5 , a.sequencet 

