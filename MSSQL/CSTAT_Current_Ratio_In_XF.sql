/***********************************************************************************************
Returns Current Ratio 

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
datafmt
fyr
gvkey
indfmt
popsrc

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the current ratio quarterly for IBM for the quarter ended March 31, 2008

***********************************************************************************************/

SELECT co_ifndq.gvkey


, co_ifndq.datadate

, co_ifndq.indfmt

, co_ifndq.consol

, co_ifndq.popsrc

, co_ifndq.fyr

, co_ifndq.datafmt

, co_ifndq.actq/co_ifndq.lctq AS current_ratio 


FROM co_ifndq co_ifndq

WHERE ( co_ifndq.gvkey = '006066' ) 

AND co_ifndq.datadate = '3/31/2008'
