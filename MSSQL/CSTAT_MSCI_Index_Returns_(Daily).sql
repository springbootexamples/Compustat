/***********************************************************************************************
Returns MSCI Index Returns(Daily)

Packages Required:
MSCI DM Core Constituent Daily (Legacy)
MSCI EM DM Core Constituent Daily (Legacy)
MSCI EM DM Licensed Index (Legacy)
MSCI Index / Constituent Level Base Pop (Legacy)

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkeyx
idd_item

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

These queries pull returns for MSCI indices, broken out by daily vs. monthly frequency and local currency vs. U.S. Dollars (USD). This query returns daily data in the local currency. Note: Uncomment the second query to return returns daily data in U.S. Dollars (USD)

***********************************************************************************************/

SELECT a.GVKEYX 

, c.CONM 

, CASE a.IDD_ITEM 


WHEN 'IDXNVSTD' THEN 'Price' 

WHEN 'IDXNVGRS' THEN 'Gross' 

WHEN 'IDXNVNET' THEN 'Net'  END 


AS indexLevel 

, a.DATADATE endDate 

, a.IDD_VALUE endValue 

, b.DATADATE startDate 

, b.IDD_VALUE startValue 

, ( CONVERT ( NUMERIC ( 18, 6 ), a.idd_value ) /  

CONVERT ( NUMERIC ( 18, 6 ), b.idd_value ) -1 ) *100 percentReturn 


FROM msciidx_dprc a  


JOIN msciidx_dprc b  ON a.GVKEYX = b.GVKEYX  AND a.IDD_ITEM = b.IDD_ITEM 

JOIN msciidx_index c -- reference table for index name ( optional ) 

ON a.GVKEYX = c.GVKEYX 

WHERE a.GVKEYX = 67398 -- specify desired index 


AND a.DATADATE = '11/30/2012' -- end date 

AND b.DATADATE = '11/29/2012' -- start date 

AND a.IDD_ITEM IN ( 'IDXNVSTD', 'IDXNVGRS', 'IDXNVNET' ) -- index level types ( price, gross, net ) 


ORDER BY indexLevel 


/*

SELECT a.GVKEYX 

, c.CONM 

, CASE a .IDMC_ITEM 


WHEN 'IDXLVLPRCSTD' THEN 'Price' 

WHEN 'IDXDTRLVLGRS' THEN  'Gross' 

WHEN 'IDXDTRLVLNET' THEN 'Net' END 


AS indexLevel 

, a.DATADATE endDate 

, a.IDMC_VALUE endValue 

, b.DATADATE startDate 

, b.IDMC_VALUE startValue 

, ( CONVERT ( NUMERIC ( 18, 6 ) , a.IDMC_VALUE) / CONVERT ( NUMERIC ( 18, 6 ), b.IDMC_VALUE ) -1 ) *100 percentReturn 


FROM msciidx_dlymulti a 


JOIN msciidx_dlymulti b 


ON a.GVKEYX = b.GVKEYX 

AND a.IDMC_ITEM = b.IDMC_ITEM 

AND a.CURCDD = b.CURCDD 


JOIN msciidx_index c  -- reference table for index name ( optional ) 

ON a.GVKEYX = c.GVKEYX 

WHERE a.GVKEYX = 67398  -- specify desired index 

AND a.DATADATE = '11/30/2012' -- end date 

AND b.DATADATE = '11/29/2012' -- start date 

AND a.IDMC_ITEM IN ( 'IDXLVLPRCSTD', 'IDXDTRLVLGRS', 'IDXDTRLVLNET' )  -- index level types ( price, gross, net ) 

AND a.CURCDD = 'USD'  -- specify desired currency 

ORDER BY indexLevel 

*/


