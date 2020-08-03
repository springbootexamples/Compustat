/************************************************************************************************
Finding Monthly Return For A Time Period Uisng Monthly Pricing.

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
01\07\2020

DatasetKey:
8

This query returns the 3-Month Total Return for McGraw-Hill Financial (GVKEY: 007163) using 
monthly pricing from December 13, 2006 to March 31, 2007.

***********************************************************************************************/

SELECT a.gvkey
, a.iid
, a.datadate
, e.ajexm
, f.AJEXM
, a.prccm
, b.prccm
, c.trfm
, d.TRFM
, ( ( ( ( ( a.prccm/e.ajexm ) *c.trfm ) / ( ( b.prccm/f.ajexm ) *d.trfm ) ) -1 ) *100 ) AS totalreturn

FROM sec_mthprc a

, sec_mthprc b

, sec_mthtrt c

, sec_mthtrt d

, sec_mth e

, sec_mth f

WHERE a.gvkey = b.gvkey

AND a.iid = b.iid

AND b.gvkey = c.gvkey

AND b.iid = c.iid

AND a.DATADATE=c.DATADATE

AND c.gvkey = d.gvkey

AND c.iid = d.iid

AND c.DATADATE = e.DATADATE

AND d.gvkey = e.gvkey

AND d.iid = e.iid

AND b.DATADATE = f.DATADATE

AND e.gvkey = f.gvkey

AND e.iid = f.iid

AND d.DATADATE = f.DATADATE

AND a.datadate = '2007-03-31'

AND b.DATADATE = '2006-12-31'

AND a.gvkey = '007163'

AND a.iid = '01'

