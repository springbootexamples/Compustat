/***********************************************************************************************
Returns Changes To Cash Flow Working Capital Changes For FASB  95

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datafmt
gvkey
indfmt
popsrc

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the components of the Working Capital changes on the Cash Flow Statement for a company using the Compustat data in Xpressfeed

***********************************************************************************************/

SELECT c.conml

, ca.curcd
, ca.gvkey
, ca.datadate
, ca.datafmt
, ca.scf
, ca.compst
, caf1.ap
, caf2.xacc
, caf1.apalch
, cadc1.apalch_dc
, caf1.invt
, caf1.invch
, cadc1.invch_dc
, caf2.rectr
, caf2.recco
, caf2.recch
, cadc2.recch_dc
, cf2.ib_fn

FROM co_adesind ca

JOIN co_afnd1 caf1

ON ca.gvkey = caf1.gvkey

AND ca.datadate = caf1.datadate
AND ca.indfmt = caf1.indfmt
AND ca.datafmt = caf1.datafmt
AND ca.popsrc = caf1.popsrc
AND ca.consol = caf1.consol

JOIN co_afnd2 caf2

ON ca.gvkey = caf2.gvkey

AND ca.datadate = caf2.datadate
AND ca.indfmt = caf2.indfmt
AND ca.datafmt = caf2.datafmt
AND ca.popsrc = caf2.popsrc
AND ca.consol = caf2.consol

JOIN co_afnddc1 cadc1

ON ca.gvkey = cadc1.gvkey

AND ca.datadate = cadc1.datadate
AND ca.indfmt = cadc1.indfmt
AND ca.datafmt = cadc1.datafmt
AND ca.popsrc = cadc1.popsrc
AND ca.consol = cadc1.consol

JOIN co_afnddc2 cadc2

ON ca.gvkey = cadc2.gvkey

AND ca.datadate = cadc2.datadate
AND ca.indfmt = cadc2.indfmt
AND ca.datafmt = cadc2.datafmt
AND ca.popsrc = cadc2.popsrc
AND ca.consol = cadc2.consol

JOIN company c ON c.gvkey = ca.gvkey

JOIN co_afntind1 cf2

ON ca.gvkey = cf2.gvkey

AND ca.datadate = cf2.datadate
AND ca.indfmt = cf2.indfmt
AND ca.datafmt = cf2.datafmt
AND ca.popsrc = cf2.popsrc
AND ca.consol = cf2.consol

WHERE 1 = 1 -- 
AND ca.gvkey IN ( '024616' , '170617' , '008762' )

AND ca.popsrc = 'D'-- 
AND ca.datadate = '12/31/2016'----AND ca.gvkey = 001010 --Company Identifier
AND ca.datafmt = 'STD'

ORDER BY ca.datadate DESC