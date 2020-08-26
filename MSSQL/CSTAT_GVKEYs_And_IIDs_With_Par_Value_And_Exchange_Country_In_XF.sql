/***********************************************************************************************
Returns Details With Par Value And Exchange Country 

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns GVKEYs and IID with a Par Value and the associated Exchange Country

***********************************************************************************************/

SELECT a.gvkey , 
a.iid, 
b.dsci, 
a.pv, 
b.EXCNTRY 

FROM sec_afnd a 

JOIN security b ON a.gvkey = b.gvkey 
AND a.iid = b.iid 

WHERE a.pv = '0'
AND a.datadate = '2005-12-31'