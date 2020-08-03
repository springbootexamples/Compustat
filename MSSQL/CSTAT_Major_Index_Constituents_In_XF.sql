/************************************************************************************************
Finding Major Index Constitutents In XF.

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
01\07\2020

DatasetKey:
8

For the CURRENT constituents of the major indexes:
This example queries the idxcst_his data group to return the current constituents of the SP 500 Index.

Note: The SP Global 1200 (gvkeyx 150918) has 640 constituents in Xpressfeed because the SP 500 and TSX 60 
are not included in it due to a system limitation. A solution to get the full list of constituents 
is to combine the Global 1200 with the SP 500 and TSX 60 as follows: select * from idxcst_his 
where gvkeyx in (150918,000003,118341) and thru is null.
Uncomment the second query for For HISTORICAL constituents of the major indexes
This example queries the spidx_cst data group to return the constituents of the SP 500 as of January 1, 2001.

Note: Another way to query for the SP 500 is to look at the SPMIM marker. Uncomment the third query for that.

Note: For Historical Constituents, since we had more markers for the SP 500 back in 1994, 
you need to look at multiple markers when querying back that far (10 - 60).
Uncomment the fourth query for that.

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


OR ( sec_mth.spmim = '40' )  AND ( sec_mth.datadate =   '1978-12-31' )  

OR ( sec_mth.spmim = '49' )  AND ( sec_mth.datadate =   '1978-12-31' )  

OR ( sec_mth.spmim = '60' )  AND ( sec_mth.datadate = '1978-12-31'  ) 

****/

