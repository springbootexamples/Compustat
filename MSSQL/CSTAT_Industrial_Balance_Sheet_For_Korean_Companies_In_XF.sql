/***********************************************************************************************
Returns Industrial Balance Sheet For Korean Companies

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
datafmt
consol
giccd
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

This query  returns an Industrial Balance Sheet for companies from Korea

***********************************************************************************************/

SELECT c.conml
, c.gsubind
, r.gicdesc
, c.loc
, ca.curcd
, caf1.gvkey
, caf1.datadate
, caf1.CH
, caf1.IVST
, caf1.CHE
, caf2.RECTR
, caf2.RECCO
, caf2.RECT
, caf1.INVRM
, caf1.INVWIP
, caf1.INVFG
, caf1.INVO
, caf1.INVT
, caf2.XPP
, caf2.TSCA
, caf1.ACOX
, caf1.ACO
, caf1.ACT
, caf2.PPEGT
, caf1.DPACT
, caf1.IVGOD
, caf2.PPENT
, caf1.IVAEQ
, caf1.IVAO
, caf1.GDWL
, caf1.INTAN
, caf1.DC
, caf2.TSTLTA
, caf2.UNL
, caf1.EA
, caf1.AOX
, caf1.AO
, caf1.AT
, caf1.DD1
, caf2.NP
, caf1.DLC
, caf1.AP
, caf2.XACC
, caf2.TXP
, caf1.APO
, caf2.PRODV
, caf1.LCOX
, caf1.LCO
, caf1.LCT
, caf2.TXDB
, caf1.DLTT
, caf2.RVUTX
, caf1.LO
, caf1.LT
, caf2.MIB
, caf2.PSTK
, caf2.PSTKR
, caf2.PSTKN
, caf1.CSTK
, caf2.SCO
, caf2.PRC
, caf2.TSTK
, caf1.CAPS
, caf2.RVLRV
, caf2.RE
, caf2.UNNP
, caf1.ERO
, caf2.TRANSA
, caf2.SEQ
, caf1.LSE
, ca.BSPR
, caf1.CEQ
, caf1.ICAPT
, caf1.CSHR
, caf1.EMP

FROM co_adesind ca 

JOIN co_afnd1 caf1 ON ca.gvkey = caf1.gvkey 

AND ca.datadate = caf1.datadate
AND ca.indfmt = caf1.indfmt 
AND ca.datafmt = caf1.datafmt 
AND ca.popsrc = caf1.popsrc 
AND ca.consol = caf1.consol

JOIN co_afnd2 caf2 ON ca.gvkey = caf2.gvkey 

AND ca.datadate = caf2.datadate
AND ca.indfmt = caf2.indfmt 
AND ca.datafmt = caf2.datafmt 
AND ca.popsrc = caf2.popsrc 
AND ca.consol = caf2.consol

JOIN company c ON c.gvkey = ca.gvkeyJ

OIN r_giccd r ON r.giccd = c.gsubind

WHERE ca.gvkey = '242861'
AND ca.popsrc = 'I'

ORDER BY c.conml, caf1.popsrc, caf1.datadate DESC 
