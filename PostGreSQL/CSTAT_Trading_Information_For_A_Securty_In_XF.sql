/***********************************************************************************************
Returns Trading Information For A Security

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey
iid

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query  returns the lowest, highest, average, and total daily trading volume including the  number of trading days for Microsoft during 2002
***********************************************************************************************/

SELECT s.tic 


, MIN ( p.cshtrd ) AS " lowest " 

, MAX ( p.cshtrd ) AS " highest " 

, AVG ( p.cshtrd ) AS " average " 

, SUM ( p.cshtrd ) AS " total " 
, COUNT ( p.cshtrd ) AS " number of days " 


FROM sec_dprc p, security s  

WHERE p.gvkey = s.gvkey  


AND s.iid = p.iid  

AND ( ( s.tic = 'MSFT' ) 

AND ( p.datadate = '2002-12-31' ) ) 


GROUP BY s.tic
