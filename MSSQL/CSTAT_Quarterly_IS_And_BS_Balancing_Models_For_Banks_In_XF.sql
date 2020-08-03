/************************************************************************************************
Finding Quarterly IS And BS Balancing Models For Banks.

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datafmt
giccd
gvkey
indfmt
popsrc

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query returns Quarterly Income Statement (IS) balancing model for banks in Xpressfeed.
Note: Uncomment the second query to  return the Quarterly Balance Sheet balancing model for banks in Xpressfeed.

***********************************************************************************************/

SELECT c.conml

, ca.curcd
, caf1.gvkey
, caf1.datadate
, caf1.REVTQ
, caf1.IDITQ
, caf1.CFOQ
, caf1.TDSGQ
, caf1.ISGTQ
, caf1.RISQ
, caf1.XTQ
, caf1.XINTQ
, caf1.PCLQ
, caf1.XAGTQ
, caf1.DPQ
, caf1.DFXAQ
, caf1.AMQ
, caf1.CFPDOQ
, caf1.XSQ
, caf1.FCAQ
, caf1.SPIQ
, caf1.PIQ
, caf1.AUTXRQ
, caf1.TXTQ
, caf1.TXDIQ
, caf1.IBMIIQ
, caf1.MIIQ
, caf1.NITQ
, caf1.IBQ
, caf1.XIQ
, caf1.DVTQ
, caf1.DVPQ
, caf1.DOQ
, caf1.INTCQ

FROM co_adesind ca

JOIN co_ifndQ caf1 

ON ca.gvkey = caf1.gvkey
AND ca.datadate = caf1.datadate
AND ca.indfmt = caf1.indfmt
AND ca.datafmt = caf1.datafmt
AND ca.popsrc = caf1.popsrc
AND ca.consol = caf1.consol

JOIN company c ON c.gvkey = ca.gvkey
JOIN r_giccd r ON r.giccd = c.gsubind

WHERE ca.gvkey = '015632'

AND ca.popsrc = 'i'
AND ca.datadate = '12/31/2009'

ORDER BY c.conml, caf1.popsrc, caf1.datadate DESC


/*****

SELECT c.conml

, ca.curcd
, caf1.gvkey
, caf1.datadate
, caf1.CHQ
, caf1.IVSTQ
, caf1.LCABGQ
, caf1.TDSTQ
, caf1.ISTQ
, caf1.ARTFSQ
, caf1.IVPTQ
, caf1.IVAEQQ
, caf1.PPENTQ
, caf1.PPEGTQ
, caf1.DPACTQ
, caf1.INTANQ
, caf1.GDWLQ
, caf1.FEAQ
, caf1.CAQ
, caf1.AOQ
, caf1.XPPQ
, caf1.ATQ
, caf1.DPTCQ
, caf1.DPTBQ
, caf1.DLCQ
, caf1.DD1Q
, caf1.DLTTQ
, caf1.APQ
, caf1.RVUTXQ
, caf1.PVTQ
, caf1.TXDBQ
, caf1.FELQ
, caf1.ACCOQ
, caf1.SSNPQ
, caf1.LOQ
, caf1.TXPQ
, caf1.LTQ
, caf1.MIBQ
, caf1.SEQQ
, caf1.PSTKQ
, caf1.PSTKRQ
, caf1.PSTKNQ
, caf1.CSTKQ
, caf1.PRCQ
, caf1.SCOQ
, caf1.TSTKQ
, caf1.CAPSQ
, caf1.RVLRVQ
, caf1.REQ
, caf1.UNNPQ
, caf1.TRANSAQ
, caf1.MIBNQ
, caf1.TEQQ
, caf1.LSEQ
, caf1.CEQQ
, caf1.ICAPTQ
, caf1.CAPR1Q
, caf1.CAPR2Q
, caf1.NPATQ

FROM co_adesind ca

JOIN co_ifndq caf1 

ON ca.gvkey = caf1.gvkey

AND ca.datadate = caf1.datadate
AND ca.indfmt = caf1.indfmt
AND ca.datafmt = caf1.datafmt
AND ca.popsrc = caf1.popsrc
AND ca.consol = caf1.consol

JOIN company c ON c.gvkey = ca.gvkey
JOIN r_giccd r ON r.giccd = c.gsubind

WHERE ca.gvkey = '015632'
AND ca.popsrc = 'i'

AND ca.datadate = '12/31/2006'

ORDER BY c.conml, caf1.popsrc, caf1.datadate DESC

*****/
