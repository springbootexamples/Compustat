/***********************************************************************************************
Returns Historical Index Constituents Using The Idxcst_his Table

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
01/07/2020

DatasetKey:
8

This query returns all the constituents of the S&P 500 (GVKEYX 000003)  from March 31, 1964 thru December 31, 1991 in Xpressfeed

***********************************************************************************************/

SELECT c.conm 

, idxcst_his.gvkey

, idxcst_his.iid

, idxcst_his.gvkeyx

,idxcst_his.thrudate


FROM indexcst_his idxcst_his 


, company c 


WHERE c.gvkey = idxcst_his.gvkey 


AND idxcst_his.gvkeyx = 000003

AND idxcst_his.[fromdate] = '1964-03-31' 

AND (( idxcst_his.thrudate = '1991-12-31' OR idxcst_his.thrudate IS NULL ))
