/***********************************************************************************************
Joining Semi Annual Income Statement Items With Quarterly Balance Sheet Items For International Companies

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datefmt
fyr
gvkey
indfmt
popsrc

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query joins Semi-Annual Sales from the Income Statement items with Quarterly Total Assets from the Balance Sheet items for International companies

***********************************************************************************************/

SELECT sa.datadate

, sa.salesa

, qb.atq

FROM co_ifndsa sa


JOIN co_ifndq qb ON qb.gvkey = sa.gvkey 

AND qb.datadate = sa.datadate

AND qb.indfmt = sa.indfmt 

AND qb.consol = sa.consol

AND qb.popsrc = sa.popsrc 

AND qb.fyr = sa.fyr

AND qb.datafmt = 'HIST_STD'


WHERE sa.gvkey = '016603'

ORDER BY sa.datadate desc 
