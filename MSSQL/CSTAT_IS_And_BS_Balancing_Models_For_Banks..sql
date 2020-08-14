/***********************************************************************************************
Returns IS And BS Balancing Models For Banks

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized
Xpressfeed Rreference

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datafmt
gvkey
giccd
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

This query returns the Income Statement (IS) balancing model for banks in Xpressfeed. Note: Uncomment the second query to get the Balance Sheet (BS) balancing model for banks in Xpressfeed

***********************************************************************************************/

SELECT c.conml

, ca.curcd

, caf1.gvkey

, caf1.datadate

, caf2.REVT

, caf1.IDIT

, caf1.IDIST

, caf1.IDILB

, caf1.IDILC

, caf1.IDITS

, caf1.IDIIS

, caf1.IDIS

, caf1.INITB

, caf1.CFO

, caf2.TDSG

, caf1.ISGT

, caf1.ISGR

, caf1.ISGU

, caf2.RIS

, caf2.XT

, caf2.XINT

, caf2.XINDC

, caf2.XINDB

, caf2.XINST

, caf2.XINTD

, caf2.XINS

, caf2.XNITB

, caf2.PCL

, caf2.XAGT

, caf2.XSTF

, caf2.XEQO

, caf2.XAGO

, caf1.DP

, caf1.DFXA

, caf1.AM

, caf1.AMDC

, caf2.XLR

, caf2.XPR

, caf1.CFPDO

, caf2.XS

, caf1.FCA

, caf2.SPI

, caf2.PVON

, caf2.PI

, caf1.AUTXR

, caf2.TXT

, caf2.TXC

, caf2.TXDI

, caf2.TXO

, caf1.IBMII

, caf2.MII

, caf2.NIT

, caf1.CGA

, caf1.EIEA

, caf2.NIO

, caf1.IB

, caf2.XI

, caf1.DVT

, caf1.DVP

, caf1.DVC

, caf1.DVSCO

, caf1.DO

, caf1.INTC


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

JOIN company c ON c.gvkey = ca.gvkey

JOIN r_giccd r ON r.giccd = c.gsubind

WHERE ca.gvkey = '146607'

AND ca.popsrc = 'D' 

AND ca.datadate = '12/31/2006'

ORDER BY c.conml

, caf1.popsrc

, caf1.datadate DESC



/***
SELECT c.conml 


, ca.curcd
, caf1.gvkey
, caf1.datadate
, caf1.CH
, caf1.IVST
, caf1.FFS
, caf2.RAGR
, caf2.STIO
, caf1.LCABG
, caf1.LCAT
, caf1.LCAST
, caf1.LCALT
, caf1.LCAG
, caf2.TDST
, caf1.IST
, caf1.LCUACU
, caf1.LCACR
, caf1.LCACL
, caf1.LCAM
, caf1.LCAL
, caf1.LCAO
, caf2.RCL
, caf2.UI
, caf1.ARTFS
, caf1.IVPT
, caf1.IVAEQ
, caf2.VPAC
, caf2.VPO
, caf2.PPENT
, caf2.PPEGT
, caf1.DPACT
, caf1.IVGOD
, caf1.INTAN
, caf1.GDWL
, caf1.FEA
, caf1.CA
, caf1.AO
, caf2.XPP
, caf1.EA
, caf1.DC
, caf1.AOX
, caf1.AT
, caf1.DPTC
, caf1.DPDC
, caf1.DPSC
, caf1.DPTIC
, caf1.DPTB
, caf1.DPSTB
, caf1.DPLTB
, caf1.DLC
, caf1.DD1
, caf1.FDFR
, caf2.RPAG
, caf1.CMP
, caf2.STBO
, caf1.DLTT
, caf1.AP
, caf2.RVUTX
, caf2.PVT
, caf2.TXDB
, caf1.FEL
, caf1.ACCO
, caf2.SSNP
, caf1.LO
, caf2.TXP
, caf2.PRODV
, caf1.LT
, caf2.MIB
, caf2.SEQ
, caf2.PSTK
, caf2.PSTKR
, caf2.PSTKN
, caf1.CSTK
, caf2.PRC
, caf2.SCO
, caf2.TSTK
, caf1.CAPS
, caf2.RVLRV
, caf2.RE
, caf2.UNNP
, caf2.TRANSA
, caf2.MIBN
, caf2.TEQ
, caf1.LSE
, caf1.CEQ
, caf1.ICAPT
, caf1.CAPR1
, caf1.CAPR2
, caf2.NPAT
, caf2.NPANL
, caf2.NPARL
, caf2.NPAORE
, caf1.EMP
, caf1.CSHR 

FROM co_adesind ca 

JOIN co_afnd1 caf1 

ON ca.gvkey = caf1.gvkey
AND ca.datadate = caf1.datadate
AND ca.indfmt = caf1.indfmt
AND ca.datafmt = caf1.datafmt
AND ca.popsrc = caf1.popsrc AND ca.consol = caf1.consol 

JOIN co_afnd2 caf2 

ON ca.gvkey = caf2.gvkey
AND ca.datadate = caf2.datadate
AND ca.indfmt = caf2.indfmt
AND ca.datafmt = caf2.datafmt
AND ca.popsrc = caf2.popsrc
AND ca.consol = caf2.consol 

JOIN company c ON c.gvkey = ca.gvkey
JOIN r_giccd r ON r.giccd = c.gsubind 

WHERE ca.gvkey = '146607' 

AND ca.popsrc = 'D'
AND ca.datadate = '12/31/2006' 

ORDER BY c.conml 

, caf1.popsrc, caf1.datadate DESC xa0

*****/