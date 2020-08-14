/***********************************************************************************************
Returns Daily Total Return For Multiple Periods

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
curcdd
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

This calculates the Daily Total Returns for IBMs primary issue (GVKEY = 006066, IID = 01)  for three time periods:Note: The 1-year return (TRT1Y) is calculated over the period from  March 6, 2012 thru March 6, 2013. The 3-year return (TRT3Y) is calculated over the period from  March 4, 2010 thru March 6, 2013. The 5-year return (TRT5Y) is calculated over the period  from March 4, 2008 thru March 6, 2013

***********************************************************************************************/

SELECT a.GVKEY
, a.IID
, a.DATADATE
, a.AJEXDI
, a.PRCCD AS endprice
, a.CURCDD
, b.DATADATE
, b.AJEXDI
, b.PRCCD AS oneyearback
, e.PRCCD AS threeyearsback
, f.PRCCD AS fiveyearsback
, b.CURCDD
, ( ( ( ( ( a.PRCCD/ a.AJEXDI ) * ISNULL ( c.TRFD,1 ) ) / ( ( b.PRCCD/b.AJEXDI ) * ISNULL ( d.TRFD,1 ) ) ) -1 ) *100 ) AS TotalReturn1
, ( ( ( ( ( a.PRCCD/ a.AJEXDI ) * ISNULL ( c.TRFD,1 ) ) / ( ( e.PRCCD/e.AJEXDI ) * ISNULL ( g.TRFD,1 ) ) ) -1 ) *100 ) AS TotalReturn3Yr
, ( ( ( ( ( a.PRCCD/ a.AJEXDI ) * ISNULL ( c.TRFD,1 ) ) / ( ( f.PRCCD/f.AJEXDI ) * ISNULL ( h.TRFD,1 ) ) ) -1 ) *100 ) AS TotalReturn5Yr

FROM sec_dprc a

JOIN sec_dprc b ON a.GVKEY = b.GVKEY
AND a.IID = b.IID
AND b.DATADATE = '2012-03-06'

LEFT JOIN sec_dtrt c ON a.GVKEY = c.GVKEY

AND a.IID = c.IID
AND 2013-03-06 BETWEEN ISNULL ( c.DATADATE, 1900-01-01 ) AND ISNULL ( c.THRUDATE, 2900-01-01 )

LEFT JOIN sec_dtrt d ON a.GVKEY = d.GVKEY

AND a.IID = d.IID
AND 2012-03-06 BETWEEN ISNULL ( d.DATADATE, 1900-01-01 ) AND ISNULL ( d.THRUDATE, 2900-01-01 )

LEFT JOIN sec_dprc e ON a.GVKEY = e.GVKEY

AND a.IID = e.IID
AND e.DATADATE = '2010-03-04'
AND a.CURCDD = e.CURCDD

LEFT JOIN sec_dprc f ON a.GVKEY = f.GVKEY

AND a.IID = f.IID
AND f.DATADATE = '2008-03-04'
AND a.CURCDD = f.CURCDD

LEFT JOIN sec_dtrt g ON a.GVKEY = g.GVKEY

AND a.IID = g.IID
AND 2010-03-06 BETWEEN ISNULL ( g.DATADATE, 1900-01-01 ) AND ISNULL ( g.THRUDATE, 2900-01-01 )

LEFT JOIN sec_dtrt h ON a.GVKEY = h.GVKEY 

AND a.IID = h.IID 
AND 2008-03-06 BETWEEN ISNULL ( h.DATADATE, 1900-01-01 ) AND ISNULL ( h.THRUDATE, 2900-01-01 )

WHERE a.DATADATE = '2013-03-06'

AND a.GVKEY = '006066'
AND a.IID = '01'
AND a.CURCDD = b.CURCDD