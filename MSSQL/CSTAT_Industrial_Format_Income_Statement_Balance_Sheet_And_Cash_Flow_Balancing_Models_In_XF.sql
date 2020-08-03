/************************************************************************************************
Pulling Industrial Format Income Statement, Balance Sheet, and Cash Flow Balancing Models.

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datafmt
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

This query returns the North America Industrial Format (INDFMT = INDL) Income Statement Balancing Model.
Uncomment the second query to get the North America Industrial Format (INDFMT = INDL) Balance Sheet Balancing Model.
Uncomment the third query to get the North America Industrial Format (INDFMT = INDL) Cash Flow Balancing Model.

***********************************************************************************************/

SELECT c.conml

, ca.curcd

, caf1.popsrc

, ca.indfmt

, ca.datafmt

, caf1.gvkey

, caf1.datadate

, caf2.SALE

, caf2.TXW

, caf2.XOPR

, caf1.COGS

, caf1.GP

, caf2.XSGA

, caf2.XRD

, caf2.XLR

, caf2.XPR

, caf2.XRENT

, caf2.XAD

, caf2.OIBDP

, caf1.DP

, caf1.AM

, caf2.OIADP

, caf2.XINT

, caf2.NOPI

, caf2.NOPIO

, caf1.ESUB

, caf1.INTC

, caf1.FCA

, caf1.IRENT

, caf1.IDIT

, caf2.SPI

, caf2.PI

, caf2.PIDOM

, caf2.PIFO

, caf2.TXT

, caf2.TXFED

, caf2.TXS

, caf2.TXFO

, caf2.TXO

, caf2.TXDI

, caf2.TXDFED

, caf2.TXDS

, caf2.TXDFO

, caf1.IBMII

, caf2.MII

, caf1.IB

, caf1.DVP

, caf1.IBCOM

, caf1.CSTKE

, caf1.IBADJ

, caf2.XIDO

, caf2.XI

, caf1.DO

, caf1.ACCHG

, caf2.NIADJ

, caf1.EPSPX

, caf1.EPSPI

, caf1.EPSFX

, caf1.EPSFI

, caf2.OPEPS

, caf2.OPREPSX

, caf1.DILADJ

, caf1.DILAVX

, caf1.CSHPRI

, caf1.CSHFD

, caf1.DVC

, caf1.AQP

, caf1.AQA

, caf1.AQEPS

, caf1.AQD

, caf1.GLP

, caf1.GLA

, caf1.GLEPS

, caf1.GLD

, caf1.GDWLIP

, caf1.GDWLIA

, caf1.GDWLIEPS

, caf1.GDWLID

, caf2.SETP

, caf2.SETA

, caf2.SETEPS

, caf2.SETD

, caf2.RCP

, caf2.RCA

, caf2.RCEPS

, caf2.RCD

, caf2.WDP

, caf2.WDA

, caf2.WDEPS

, caf2.WDD

, caf1.DTEP

, caf1.DTEA

, caf1.DTEEPS

, caf1.DTED

, caf2.RDIP

, caf2.RDIPA

, caf2.RDIPEPS

, caf2.RDIPD

, caf2.SPIOP

, caf2.SPIOA

, caf2.SPIEPS

, caf2.SPID

, caf1.AQI

, caf1.AQS

, caf1.EBIT

, caf1.EBITDA

, caf2.NIECI

, caf1.GDWLAM

, caf2.XINTOPT

, caf2.XINTD

, caf2.STKCO

, caf1.ESUB

, caf1.IRENT

, caf2.TIE

, caf2.TII

, caf2.NIIT

, caf2.PLL

, caf1.DPRET

, caf2.SRET


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

JOIN company c ON c.gvkey = ca.gvkey


WHERE ca.gvkey = '006066'

AND ca.popsrc = 'D'

AND ca.indfmt = 'INDL'

AND ca.datafmt = 'STD' 


ORDER BY c.conml


, caf1.popsrc

, caf1.datadate DESC




/***********
SELECT c.conml

, ca.curcd

, caf1.gvkey

, caf1.datadate

, caf1.CHE

, caf1.CH

, caf1.IVST

, caf2.RECT

, caf2.RECTR

, caf2.TXR

, caf2.RECCO

, caf2.RECD

, caf1.INVT

, caf1.INVRM

, caf1.INVWIP

, caf1.INVFG

, caf1.INVO

, caf1.ACO

, caf2.XPP

, caf1.ACOX

, caf1.ACDO

, caf1.ACT

, caf2.PPENT

, caf2.PPEGT

, caf1.DPACT

, caf1.IVAEQ

, caf1.IVAO

, caf1.INTAN

, caf1.GDWL

, caf1.INTANO

, caf1.AO

, caf1.DC

, caf1.AOX

, caf1.ALDO

, caf1.AT

, caf1.DLC

, caf1.DD1

, caf2.NP

, caf1.BAST

, caf1.BASTR

, caf1.AP

, caf2.TXP

, caf1.LCO

, caf2.XACC

, caf1.LCOX

, caf1.DRC

, caf1.LCT

, caf1.DLTT

, caf1.DD2

, caf1.DD3

, caf1.DD4

, caf1.DD5

, caf1.DCLO

, caf1.DCVT

, caf1.DCVSUB

, caf1.DCVSR

, caf1.DD

, caf1.DN

, caf1.DS

, caf1.DLTO

, caf1.DCS

, caf1.DFS

, caf1.DM

, caf1.DUDD

, caf1.DLTP

, caf2.TXDITC

, caf2.TXDB

, caf1.ITCB

, caf1.LO

, caf1.DRLT

, caf1.LT

, caf2.MIB

, caf2.PSTK

, caf2.PSTKR

, caf2.PSTKN

, caf2.PSTKC

, caf1.CEQ

, caf1.CSTK

, caf1.CAPS

, caf2.RE

, caf2.REUNA

, caf1.ACOMINC

, caf2.SEQO

, caf2.TSTK

, caf2.TSTKP

, caf2.TSTKC

, caf2.SEQ

, caf2.MIBN

, caf2.TEQ

, caf1.LSE

, caf1.CSHO

, caf1.LIFR

, caf2.WCAP

, caf1.ICAPT

, caf1.CEQL

, caf1.CEQT

, caf1.CSTKCV

, caf1.CB

, caf1.DCPSTK

, caf2.PSTKL

, caf2.PSTKRV

, caf1.DVPA

, caf2.REUNA

, caf2.REUNR

, caf2.TSTKME

, caf2.TSTKN

, caf1.CLG

, caf1.DCOM

, caf2.MRCT

, caf2.MRC1

, caf2.MRC2

, caf2.MRC3

, caf2.MRC4

, caf2.MRC5

, caf2.MRCTA

, caf2.RECTA

, caf2.MSA

, caf2.REAJO

, caf2.REUNR

, caf1.AOCIDERGL

, caf1.AOCIOTHER

, caf1.AOCIPEN

, caf1.AOCISECGL

, caf2.MSA

, caf2.RECTA

, caf1.DPACRE

, caf2.RET 


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


JOIN company c ON c.gvkey = ca.gvkey

JOIN r_giccd r ON r.giccd = c.gsubind


WHERE ca.gvkey = '006066'


AND ca.popsrc = 'D'

AND ca.indfmt = 'INDL'

AND ca.datafmt = 'STD' 

ORDER BY c.conml

, caf1.popsrc

, caf1.datadate DESC
****/



/****
SELECT c.conml

, ca.curcd

, caf1.gvkey

, caf1.datadate

, caf1.IBC

, caf2.XIDOC

, caf1.DPC

, caf2.TXDC

, caf1.ESUBC

, caf2.SPPIV

, caf1.FOPO

, caf2.TXBCO

, caf1.FOPOX

, caf2.RECCH

, caf1.INVCH

, caf1.APALCH

, caf2.TXACH

, caf1.AOLOCH

, caf2.OANCF

, caf1.IVCH

, caf2.SIV

, caf1.IVSTCH

, caf1.CAPX

, caf2.SPPE

, caf1.AQC

, caf1.IVACO

, caf1.IVNCF

, caf2.SSTK

, caf2.TXBCOF

, caf2.PRSTKC

, caf1.DV

, caf1.DLTIS

, caf1.DLTR

, caf1.DLCCH

, caf1.FIAO

, caf1.FINCF

, caf1.EXRE

, caf1.CHECH

, caf1.INTPN

, caf2.TXPD


FROM co_adesind ca 


JOIN co_afnd1 caf1 ON ca.gvkey = caf1.gvkey 


AND ca.datadate = caf1.datadateAND ca.indfmt = caf1.indfmt 

AND ca.datafmt = caf1.datafmt 

AND ca.popsrc = caf1.popsrc 

AND ca.consol = caf1.consol  


JOIN co_afnd2 caf2 ON ca.gvkey = caf2.gvkey


AND ca.datadate = caf2.datadate
AND ca.indfmt = caf2.indfmt 

AND ca.datafmt = caf2.datafmt 

AND ca.popsrc = caf2.popsrc 

AND ca.consol = caf2.consol 


JOIN company c ON c.gvkey = ca.gvkey
JOIN r_giccd r ON r.giccd = c.gsubind 


WHERE ca.gvkey = '006066' 


AND ca.popsrc = 'D' 

AND ca.indfmt = 'INDL' 

AND ca.datafmt = 'STD' 


ORDER BY c.conml 


, caf1.popsrc 

, caf1.datadate DESC 

****/

