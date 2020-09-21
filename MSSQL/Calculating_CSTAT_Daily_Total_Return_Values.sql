/***********************************************************************************************
Returns Compustat Daily Total Return Values

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

The following sample query returns the history for TRFD for a single company (Here INTL BUSINESS MACHINES CORP)

***********************************************************************************************/

DECLARE @BeginDate DATETIME 
SET @BeginDate = '1/1/2020'
DECLARE @EndDate DATETIME 
SET @EndDate = getdate ()--Today
DECLARE @Gvkey VARCHAR (6) 
SET @Gvkey = '006066'


select c.gvkey,
c.conm,
s1.datadate,
s1.prccd,
s1.ajexdi,
t1.trfd,
s2.datadate,
s2.prccd,
s2.ajexdi,
t2.trfd,
( ( ( s1.prccd/s1.ajexdi ) *t1.trfd ) / ( ( s2.prccd/s2.ajexdi ) *t2.trfd ) -1 ) * 100 AS tot_return, --Here is the formula for Daily Price Return
rn1.gvkey,
rn1.iid,
rn1.datadate,
rn1.rowNumber,
rn2.*
from company c
JOIN security s on s.gvkey = c.gvkey
        and s.iid = c.priusa --Primary trading us security
JOIN (
        SELECT
        gvkey,
        datadate,
        iid,
        ROW_NUMBER () 
        OVER ( PARTITION BY gvkey, iid ORDER BY gvkey, iid, datadate ASC) AS rowNumber 
        FROM sec_dprc
        WHERE 1 = 1 
        AND gvkey = @Gvkey 
) rn1 on rn1.gvkey = s.gvkey
        and rn1.iid = s.iid
JOIN sec_dprc s1 on s1.gvkey = rn1.gvkey
        and s1.iid = rn1.iid
        and s1.datadate = rn1.datadate
JOIN ( 
        SELECT gvkey,
        datadate,
        iid,
        ROW_NUMBER () OVER ( PARTITION BY gvkey, iid ORDER BY gvkey, iid, datadate ASC) AS rowNumber
        FROM sec_dprc
        WHERE 1 = 1 
        AND gvkey = @Gvkey 
) rn2 on rn2.gvkey = rn1.gvkey
        and rn2.iid = rn1.iid
        and rn2.rowNumber = rn1.rowNumber -1

join sec_dprc s2 on s2.gvkey = rn2.gvkey
        and s2.iid = rn2.iid
        and s2.datadate = rn2.datadate

join sec_dtrt t1 on t1.gvkey = s1.gvkey
        and t1.iid = s1.iid     
        and s1.datadate BETWEEN t1.datadate and isnull( t1.thrudate, '1/1/2900')

join sec_dtrt t2 on t2.gvkey = s2.gvkey
        and t2.iid = s2.iid
        and s2.datadate BETWEEN t2.datadate and isnull( t2.thrudate, '1/1/2900')

where 1=1
and c.gvkey = @gvkey 
and s1.datadate BETWEEN @BeginDate and @EndDate
ORDER BY c.gvkey, s1.datadate


