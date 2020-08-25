/***********************************************************************************************
Returns MSCI Index Returns(Monthly)

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
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

These queries pull returns for MSCI indices, broken out by daily vs. monthly frequency and local currency vs. U.S. Dollars (USD). This query returns monthly data in the local currency. Note: Uncomment the second query to return returns Monthly data in U.S. Dollars (USD)

***********************************************************************************************/


SELECT a.GVKEYX 

, c.CONM 

,  CASE a.IMD_ITEM 


WHEN 'IDXNVSTDM' THEN 'Price'

WHEN 'IDXNVGRSM' THEN 'Gross' 

WHEN 'IDXNVNETM' THEN 'Net' END 


AS indexLevel 

,  a.DATADATE endDate 

, a.IMD_VALUE endValue 

, b.DATADATE startDate 

, b.IMD_VALUE startValue 

,  ( CONVERT ( NUMERIC ( 18, 6 ) ,a.imd_value ) / CONVERT ( NUMERIC ( 18, 6 ), b.imd_value ) -1 ) *100 percentReturn 


FROM msciidx_mthprc a 


JOIN msciidx_mthprc b 


ON a.GVKEYX = b.GVKEYX  

AND a.IMD_ITEM = b.IMD_ITEM  


JOIN msciidx_index c -- reference table for index name ( optional ) 


ON a.GVKEYX = c.GVKEYX  

WHERE a.GVKEYX = 67398 -- specify desired index 


AND a.DATADATE = '11/30/2012' -- end date ( must be a month-end date ) 

AND b.DATADATE = '10/31/2012' -- start date ( must be a month-end date ) 

AND a.IMD_ITEM IN ( 'IDXNVSTDM', 'IDXNVGRSM', 'IDXNVNETM' ) -- index level types ( price, gross, net ) 


ORDER BY indexLevel 


/****

SELECT a.GVKEYX 

, c.CONM  

,  CASE a.IMMC_ITEM 


WHEN 'IDXLVLPRCSTD' THEN 'Price' 

WHEN 'IDXDTRLVLGRS' THEN 'Gross' 

WHEN 'IDXDTRLVLNET' THEN 'Net' END 

AS indexLevel 

,  a.DATADATE endDate 

, a.IMMC_VALUE endValue 

, b.DATADATE startDate 

, b.IMMC_VALUE startValue 

,  ( CONVERT ( NUMERIC ( 18, 6 ), a.IMMC_VALUE ) / CONVERT ( NUMERIC ( 18, 6 ), b.IMMC_VALUE ) -1 ) *100 percentReturn 


FROM msciidx_mthmulti a 


JOIN msciidx_mthmulti b 


ON a.GVKEYX = b.GVKEYX  

AND a.IMMC_ITEM = b.IMMC_ITEM  

AND a.CURCDM = b.CURCDM 


JOIN msciidx_index c -- reference table for index name ( optional ) 

ON a.GVKEYX = c.GVKEYX  


WHERE a.GVKEYX = 67398 -- specify desired index 


AND a.DATADATE = '11/30/2012' -- end date ( must be a month-end date ) 

AND b.DATADATE = '10/31/2012' -- start date ( must be a month-end date ) 

AND a.IMMC_ITEM IN ( 'IDXLVLPRCSTD', 'IDXDTRLVLGRS', 'IDXDTRLVLNET' ) -- index level types ( price, gross, net ) 

AND a.CURCDM = USD -- specify desired currency 


ORDER BY indexLevel 

****/
