/***********************************************************************************************
Returns Growth Or Value Index Constituents 

Packages Required:
Core
Core 2
MSCI Index Level Data (Legacy)

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkeyx

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8,100

This query returns the constituents of the SP/Barra 500 Growth as of July 29, 2005

***********************************************************************************************/

SELECT i.conm 

, c.conm 

, s.tic 

, sdp.datadate 

, sdp.prccd 

, sdp.ajexdi 


FROM idx_index i 


, idxcst_his ic 

, company c 

, security s 

, sec_dprc sdp 


WHERE i.gvkeyx = ic.gvkeyx  


AND ic.gvkey = s.gvkey  

AND ic.iid = s.iid  

AND s.gvkey = sdp.gvkey  

AND s.iid = sdp.iid  

AND s.gvkey = c.gvkey  

AND sdp.datadate = ic.[from]  

AND ( sdp.datadate= ic.thru OR ic.thru IS NULL )  

AND ( ic.gvkeyx = 026113 OR ic.gvkeyx = 026114 )  

AND sdp.datadate = '2005-12-19'

