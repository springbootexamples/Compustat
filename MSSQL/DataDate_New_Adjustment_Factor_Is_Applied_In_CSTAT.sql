/************************************************************************************************
Datadate new adjustment factor is applied to given company

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
20/08/2020

DatasetKey:
8

The following sample returns the datadate that a new adjustment factor is applied for stock splits.

***********************************************************************************************/

IF OBJECT_ID ( 'tempdb..#x' ) IS NOT NULL
DROP TABLE #x
GO

SELECT 
	IDENTITY ( INT, 1, 1 ) AS sequence,
	gvkey,
	iid,
	ajexdi,
	MIN ( datadate ) AS datadate
INTO #x

FROM sec_dprc
WHERE gvkey = '117768'

GROUP BY gvkey, iid, ajexdi 
ORDER BY gvkey, iid, MIN ( datadate ) 

GO 

SELECT 
	a.gvkey,
	a.iid,
	a.ajexdi,
	b.ajexdi,
	a.datadate,
	a.ajexdi/b.ajexdi [ ajexdi non cum ] 
FROM #x a
JOIN #x b on b.sequence = a.sequence + 1

ORDER BY a.gvkey, a.iid, a.datadate 
