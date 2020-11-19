/***********************************************************************************************
Returns Debt-To-Equity-Ratio Annual And Quarterly

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datafmt
gvkey
indfmt

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query calculates Debt-to-Equity (aka Risk, Gearing or Leverage) ratio annually. Note:Uncomment the second query to return Debt-To-Equity Ratio for quarterly basis

***********************************************************************************************/

--Annual: ((DLTT+DLC)/SEQ)*100

SELECT a.gvkey
, a.datadate
, a.datafmt
, a.indfmt
, a.dltt
, a.dlc
, b.seq
, ( ( a.DLTT+a.DLC ) /b.SEQ ) * 100 AS Debt_to_Equity 


FROM co_afnd1 a, co_afnd2 b 

WHERE a.gvkey = b.gvkey 


AND a.datadate = b.datadate 

AND a.gvkey = 006066 

AND a.datadate = '2007-12-31'

AND a.datafmt = 'STD' 

AND a.datafmt = b.datafmt


/*Quarterly: ((DLTTQ+DLCQ)/SEQQ)*100

SELECT a.gvkey


, a.datadate

, a.datafmt

, a.indfmt

, a.dlttq

, a.dlcq

, a.seqq

, ( ( a.DLTTQ+a.DLCQ ) /a.SEQQ ) * 100 AS Debt_to_Equity 


FROM co_ifndq a

WHERE a.gvkey = 006066 


AND a.datadate = 12/31/2007

AND a.datafmt = std */

