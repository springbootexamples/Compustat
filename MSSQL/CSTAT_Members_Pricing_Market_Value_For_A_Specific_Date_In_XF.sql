/***********************************************************************************************
Returns Members, Pricing And Market Value For A Specific Date

Packages Required:
Core

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

This query returns the adjusted close price, common shares outstanding current,  adjusted common shares outstanding current, ticker symbol, and the market value for  members of the SP 500 Index on a specific date in Xpressfeed

***********************************************************************************************/

DECLARE @500MembersThisDate SMALLDATETIME; 
SET @500MembersThisDate = '1/31/2011';

SELECT sec_dprc.gvkey 
, sec_dprc.iid
, spidx_cst.ticx
, spidx_cst.conmx
, sec_dprc.datadate
, ( sec_dprc.prccd/sec_dprc.ajexdi ) AS adj_price
, sec_dprc.cshoc , ( sec_dprc.cshoc*sec_dprc.ajexdi ) AS adj_shares
, ( ( sec_dprc.prccd/sec_dprc.ajexdi ) * ( sec_dprc.cshoc*sec_dprc.ajexdi ) ) AS mkval 

FROM sec_dprc 

LEFT OUTER JOIN spidx_cst 

ON spidx_cst.gvkey = sec_dprc.gvkey

AND spidx_cst.iid = sec_dprc.iid 
AND spidx_cst.datadate = sec_dprc.datadate 

WHERE spidx_cst.indexid = '500' 

AND sec_dprc.datadate = @500MembersThisDate 


ORDER BY sec_dprc.datadate, sec_dprc.gvkey 

