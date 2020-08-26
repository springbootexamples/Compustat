/***********************************************************************************************
Returns Annual Transparency Notes For A Company 

Packages Required:
Core
Core 2
Transparency
Transparency History
Vendor Xpressfeed Dictionary
Xpressfeed Dictionary

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey
item
mnemonic
sequencen
sequencet

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all annual item notes and note subtypes for Starbucks Corp later than September 30, 2007 in Xpressfeed

***********************************************************************************************/

SELECT company.conm , 
a.gvkey, 
a.datadate, a.item, b.itemdesc, a.note, a.subtype, a.notetype, a.sequencen 

FROM aco_notesa a 

LEFT OUTER JOIN dd_item b ON a.item = b.mnemonic
JOIN company ON a.gvkey = company.gvkey 

WHERE a.gvkey in ( '025434' ) 

AND a.datadate = '09/30/07' 
AND a.sequencet = '0' 

ORDER BY a.notetype 
