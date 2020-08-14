/***********************************************************************************************
Returns Differences In CSHOC

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
datadate
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query determines when Common Shares Outstanding - Current (CSHOC) values change from  one day to the next for a company and calculates the difference in those values

***********************************************************************************************/

SELECT a.gvkey
, a.IID
, a.DATADATE
, a.CSHOC
, b.DATADATE
, b.CSHOC
, a.CSHOC - b.CSHOC  AS Share_difference

FROM sec_dprc a

JOIN sec_dprc b ON a.gvkey =b.gvkey
AND a.IID = b.IID

WHERE a.DATADATE = b.DATADATE + 1  
AND ( a.CSHOC > b.CSHOC

OR a.CSHOC < b.CSHOC )

AND a.CSHOC IS NOT NULL

AND b.CSHOC IS NOT NULL

AND a.gvkey = '006066'

AND a.IID = '01'

ORDER BY a.DATADATE DESC