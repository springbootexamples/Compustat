/***********************************************************************************************
Returns Customer Names And Sales For A Company 

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all customer names and customer sales for Apple as of September 30, 2017  using Compustat Segment data in Xpressfeed

***********************************************************************************************/

SELECT c.conm

, CONVERT (VARCHAR ( 10 ), m.datadate, 101) AS datadate
, m.ctype
, m.cid
, m.cnms
, m.salecs

FROM company c

JOIN dbo.seg_customer m ON c.gvkey = m.gvkey

WHERE c.gvkey = 001690

AND m.datadate = '09/30/2017'
AND m.salecs IS NOT NULL

ORDER BY m.gvkey

, m.datadate, m.cid