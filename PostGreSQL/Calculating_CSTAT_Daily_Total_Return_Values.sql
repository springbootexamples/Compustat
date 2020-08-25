/************************************************************************************************
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
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
20/08/2020

DatasetKey:
8

The following sample query returns the history for TRFD for a single company (Here INTL BUSINESS MACHINES CORP)

***********************************************************************************************/
DO $$

DECLARE vBeginDate  DATE;
DECLARE vEndDate  DATE;
DECLARE vGvkey   VARCHAR (6);

BEGIN
	
	SELECT  '1/1/2020' INTO vBeginDate;
	SELECT  NOW() INTO vEndDate;
	SELECT '006066' INTO vGvkey;


DROP  TABLE  IF  EXISTS temp_table;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table AS

select c.gvkey as C_GVKEY,
c.conm,
s1.datadate as S1_DATADATE,
s1.prccd as S1_PRCCDS,
s1.ajexdi as S1_AJEXDI,
t1.trfd as T1_TRFD,
s2.datadate as S2_DATADATE,
s2.prccd,
s2.ajexdi,
t2.trfd,
( ( ( s1.prccd/s1.ajexdi ) *t1.trfd ) / ( ( s2.prccd/s2.ajexdi ) *t2.trfd ) -1 ) * 100 AS tot_return, --Here is the formula for Daily Price Return
rn1.gvkey  "rn1_gvkey",
rn1.iid as RN1_IID,
rn1.datadate as RN1_datadate,
rn1.rowNumber as RN1_ROWNUMBER,
rn2.*
from company c
JOIN security s on s.gvkey = c.gvkey
	and s.iid = c.priusa--Primary trading us security
	JOIN (select gvkey, datadate,
	 iid,
	ROW_NUMBER () 
	OVER ( PARTITION BY gvkey, iid order by gvkey,iid,datadate ASC) AS rowNumber
	FROM sec_dprc
	WHERE 1 = 1 
	AND gvkey = vgvkey
) rn1 on rn1.gvkey = s.gvkey
	and rn1.iid = s.iid
JOIN sec_dprc s1 on s1.gvkey = rn1.gvkey
	and s1.iid = rn1.iid
	and s1.datadate = rn1.datadate
JOIN ( 
	SELECT gvkey,
	datadate,
	iid,
	ROW_NUMBER () 
	OVER (PARTITION BY gvkey, iid order by gvkey,iid,datadate ASC) AS rowNumber
	FROM sec_dprc
	WHERE 1 = 1 
	AND gvkey = vgvkey
) rn2 on rn2.gvkey = rn1.gvkey
	and rn2.iid = rn1.iid
	and rn2.rowNumber = rn1.rowNumber -1

join sec_dprc s2 on s2.gvkey = rn2.gvkey
	and s2.iid = rn2.iid
	and s2.datadate = rn2.datadate

join sec_dtrt t1 on t1.gvkey = s1.gvkey
	and t1.iid = s1.iid	
	and s1.datadate BETWEEN t1.datadate and coalesce( t1.thrudate, '1/1/2900')

join sec_dtrt t2 on t2.gvkey = s2.gvkey
	and t2.iid = s2.iid
	and s2.datadate BETWEEN t2.datadate and coalesce( t2.thrudate, '1/1/2900')

where 1=1
and c.gvkey = vgvkey
and s1.datadate BETWEEN vBeginDate and vEndDate
ORDER BY c.gvkey, s1.datadate;

	
END $$;

select * from temp_table;


