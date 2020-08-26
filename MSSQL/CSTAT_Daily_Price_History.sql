/***********************************************************************************************
Returns Daily Price History

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid
datadate

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
20/08/2020

DatasetKey:
8

Because there is so much daily history, it is recomended to input a datadate range or the query  will take a long time to run. To pull the enitre history, remove and sec_dprc.datadate = 12/31/2008  from the query

***********************************************************************************************/

SELECT 
        sec_dprc.gvkey,
        sec_dprc.datadate,
        sec_dprc.iid,
        sec_dprc.prccd,
        sec_dprc.ajexdi 

FROM sec_dprc
WHERE sec_dprc.gvkey = '012141' 
        AND sec_dprc.datadate  = '12/31/2008'

ORDER BY sec_dprc.datadate DESC 
