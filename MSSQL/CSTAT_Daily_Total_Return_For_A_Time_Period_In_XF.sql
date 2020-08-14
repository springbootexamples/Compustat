/***********************************************************************************************
Returns Daily Total Return For A Time Period

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
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the Daily Total Return of one issue for a one-year time period using the 1-year  return for SP Global, Inc. from November 1, 2017 to November 1, 2018 in this example

***********************************************************************************************/

SELECT a.gvkey
, a.iid, 
a.datadate, 
a.ajexdi, 
a.prccd, 
a.qunit,
c.trfd, 
b.datadate, 
b.ajexdi, 
b.prccd, 
b.qunit, 
d.trfd, 
( ( ( ( ( a.prccd / (ISNULL(a.qunit,1)*a.ajexdi )) * ( ISNULL(c.trfd, 1) ) ) / ( ( b.prccd / (ISNULL(B.qunit,1)*b.ajexdi )) * ( ISNULL(d.trfd, 1) ) ) ) - 1 ) * 100 ) AS totalreturn

FROM sec_dprc a

JOIN sec_dprc b 
ON a.gvkey = b.gvkey
AND a.iid = b.iid
LEFT JOIN sec_dtrt c ON a.gvkey = c.gvkey
AND a.iid = c.iid
LEFT JOIN sec_dtrt d ON a.gvkey = d.gvkey
AND a.iid = d.iid

WHERE a.datadate = '2018-11-01'

AND b.datadate = '2017-11-01'
AND a.datadate BETWEEN ISNULL(c.datadate, '1950-01-01') 
AND ISNULL (c.thrudate, '2900-01-01')
AND b.datadate BETWEEN  ISNULL(d.datadate, '1950-01-01') 
AND  ISNULL (d.thrudate, '2900-01-01')
AND a.gvkey = '007163'
AND a.iid = '01'