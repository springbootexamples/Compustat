/***********************************************************************************************
Returns Index Membership For A Country

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the dates that a company was a constituent of an index along with the name of the  index it was a member of

***********************************************************************************************/

SELECT a.*, 
b.conm 

FROM idxcst_his a 

JOIN idx_index b ON a.gvkeyx=b.gvkeyx 

WHERE a.gvkey = '012691'
AND IID = '01' 

ORDER BY a.THRU DESC 
