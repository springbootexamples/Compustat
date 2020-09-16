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
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all the constituents of the S&P 500 (GVKEYX 000003)  from March 31, 1964 thru December 31, 1991 in Xpressfeed

***********************************************************************************************/

SELECT c.conm 

, indexcst_his.gvkey

, indexcst_his.iid

, indexcst_his.gvkeyx

,indexcst_his.thrudate 


FROM indexcst_his indexcst_his 


, company c 


WHERE c.gvkey = indexcst_his.gvkey 


AND indexcst_his.gvkeyx = '000003'

AND indexcst_his.fromdate = '1964-03-31' 

AND (( indexcst_his.thrudate = '1991-12-31' OR indexcst_his.thrudate IS NULL ))
