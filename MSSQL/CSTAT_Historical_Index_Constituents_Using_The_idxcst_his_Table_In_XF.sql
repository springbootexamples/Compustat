/************************************************************************************************
Pulling Historical Indx Constituents using the idxcst_his table in XF.

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
gvkeyx
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns all the constituents of the SP 500 (GVKEYX 000003) 
from March 31, 1964 thru December 31, 1991 in Xpressfeed.

***********************************************************************************************/

SELECT c.conm 

, idxcst_his.gvkey

, idxcst_his.iid

, idxcst_his.gvkeyx

,idxcst_his.thru 


FROM idxcst_his idxcst_his 


, company c 


WHERE c.gvkey = idxcst_his.gvkey 


AND idxcst_his.gvkeyx = 000003

AND idxcst_his.[from] = '1964-03-31' 

AND (( idxcst_his.thru = '1991-12-31' OR idxcst_his.thru IS NULL )) 