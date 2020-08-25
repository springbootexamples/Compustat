/***********************************************************************************************
Returns Quarterly Fair Value Asset Items

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datefmt
fyr
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

This query returns quarterly Fair Value Asset Items related to SFAS 157 and Fair  Value Changes in Earnings related to SFAS 159

***********************************************************************************************/

SELECT c.conml

, cd.gvkey

, cd.datadate

, cd.curcdq

, cd.datacqtr

, qf1.indfmt

, qf1.datafmt

, cd.acctchgq

, qf1.aqpl1q AS " Level 1 Asset " 

, qf1.aol2q AS " Level 2 Asset " 

, qf1.aul3q AS " Level 3 Asset "

, qf1.anoq AS " Fair Value Net Adjustment "

, qf1.tfvaq AS " Total Fair Value Assets "

, qf1.tfvceq AS " Fair Value Changes in Earnings "


FROM co_idesind cd 

INNER JOIN co_ifndq qf1 ON qf1.gvkey = cd.gvkey 

AND qf1.datadate = cd.datadate 

AND qf1.indfmt = cd.indfmt 

AND qf1.datafmt = cd.datafmt 

AND qf1.fyr = cd.fyr 

AND qf1.popsrc = cd.popsrc 

AND qf1.consol = cd.consol

INNER JOIN company c ON cd.gvkey = c.gvkey

WHERE cd.datafqtr IS NOT NULL

AND cd.popsrc = 'D'

AND c.gvkey IN ( '177088' )

ORDER BY cd.datadate DESC
