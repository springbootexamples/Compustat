/***********************************************************************************************
Returns Major Index Constituents

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

For the CURRENT constituents of the major indexes: This example queries the idxcst_his data group to return the current constituents of the S&P 500 Index

***********************************************************************************************/

SELECT ic.gvkey, c.conm 

FROM company c, idxcst_his ic 

WHERE ic.gvkey = c.gvkey  


AND ( ( ic.gvkeyx = '000003')  

AND ( ic.thru IS NULL ) ) 


ORDER BY c.conm 

/***

SELECT gvkey 

, iid 

, datadate 

, indexid 

, conmx 

, contype 

, conval 

, cusipx 

, exchgx 

, ticx 


FROM spidx_cst 

WHERE ( indexid = '500' )  AND ( datadate = '2001-1-31' ) 

ORDER BY conmx 

***/


/****

SELECT sec_mth.gvkey 


, sec_mth.datadate 

, sec_mth.spmim 


FROM sec_mth sec_mth 

WHERE ( sec_mth.datadate = '2006-01-31 00:00:00' )  AND ( sec_mth.spmim = '10' ) 

ORDER BY sec_mth.gvkey 

****/


/***

SELECT sec_mth.gvkey 

, sec_mth.datadate 

, sec_mth.spmim 


FROM sec_mth sec_mth 

WHERE ( sec_mth.spmim = '10' )  AND ( sec_mth.datadate = '1978-12-31' )  


OR ( sec_mth.spmim = '40' )  AND ( sec_mth.datadate = xa0 '1978-12-31' )  

OR ( sec_mth.spmim = '49' )  AND ( sec_mth.datadate = xa0 '1978-12-31' )  

OR ( sec_mth.spmim = '60' )  AND ( sec_mth.datadate = '1978-12-31'  ) 

****/

