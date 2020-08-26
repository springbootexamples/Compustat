/***********************************************************************************************
Returns Open Price For Index Constituents

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the Open Price (PRCOD) for the constituents of the S&P 500 Index for December 1, 2016 in Xpressfeed

***********************************************************************************************/

SELECT company.gvkey 

, company.conm

, security.tic

, sec_dprc.datadate

, sec_dprc.ajexdi

, sec_dprc.prcod

, idxcst_his.gvkeyx

, idxcst_his.thru 


FROM company

, idxcst_his

, sec_dprc

, security 


WHERE company.gvkey = idxcst_his.gvkey 


AND company.gvkey = sec_dprc.gvkey
AND company.gvkey = security.gvkey
AND idxcst_his.gvkey = sec_dprc.gvkey
AND idxcst_his.gvkey = security.gvkey
AND idxcst_his.iid = sec_dprc.iid
AND idxcst_his.iid = security.iid
AND sec_dprc.gvkey = security.gvkey
AND sec_dprc.iid = security.iid
AND ( ( sec_dprc.datadate = '2016-12-1') AND ( idxcst_his.gvkeyx = '000003' ) 
AND ( idxcst_his.thru IS NULL ) ) 

