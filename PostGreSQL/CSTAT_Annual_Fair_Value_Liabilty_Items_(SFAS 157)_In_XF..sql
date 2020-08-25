/***********************************************************************************************
Returns Annual Fair Value Liability Items

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datefmt
gvkey
indfmt
popsrc

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns annual Fair Value Liability Items related to SFAS 157 and Fair Value Changes  in Earnings related to SFAS 159

***********************************************************************************************/

SELECT c.conml

, af1.gvkey

, af1.datadate

, ad.curcd

, ad.fyear

, af1.indfmt

, af1.datafmt

, ad.acctchg

, af1.lqpl1 AS " Level 1 Liability " 

, af1.lol2 AS " Level 2 Liability "

, af1.lul3 AS " Level 3 Liablity "

, af1.lno AS " Fair Value Net Adjustment "

, af2.tfvl AS " Total Fair Value Liability "

, af2.tfvce AS " Fair Value Changes in Earnings "

FROM co_afnd1 af1 


LEFT OUTER JOIN co_afnd2 af2 ON af1.gvkey = af2.gvkey 

AND af1.datadate = af2.datadate 

AND af1.popsrc = af2.popsrc 

AND af1.datafmt = af2.datafmt 

AND af1.indfmt = af2.indfmt

JOIN co_adesind ad ON af1.gvkey = ad.gvkey 

AND af1.datadate = ad.datadate 

AND af1.popsrc = ad.popsrc 

AND af1.datafmt = ad.datafmt 

AND af1.indfmt = ad.indfmt

JOIN company c ON af1.gvkey = c.gvkey


WHERE ad.indfmt = 'INDL' 


AND ad.datafmt = 'STD' 

AND c.gvkey IN ( '007267' )


ORDER BY af1.datadate DESC , af1.gvkey

