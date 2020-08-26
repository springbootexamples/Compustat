/***********************************************************************************************
Returns Industrial Income Statement For Korean Companies

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
01/07/2020

DatasetKey:
8

This query returns an Industrial format Income Statement for companies from Korea

***********************************************************************************************/

SELECT c.conml

, c.loc

, ca.curcd

, caf1.popsrc

, ca.indfmt

, ca.datafmt

, caf1.gvkey

, ca.ISMOD

, caf1.datadate

, caf2.SALE

, caf1.COGS

, caf1.GP

, caf2.XSGA

, caf2.RAWMSM

, caf2.STKCH

, caf1.CAPCST

, caf2.XSTF

, caf2.XOPRO

, caf2.XOPR

, caf2.OIBDP

, caf1.DFXA

, caf1.AM

, caf1.DP

, caf2.OIADP

, caf2.XINT

, caf1.INTC

, caf1.IDIT

, caf2.NOPIO

, caf2.NOPI

, caf2.PI

, caf1.AUTXR

, caf2.TXC

, caf2.TXDI

, caf2.TXO

, caf2.TXT

, caf2.MII

, caf1.EIEA

, caf2.PACQP

, caf2.NIO

, caf2.NIT

, caf1.IB

, caf2.XI

, caf1.DVT

, caf1.DVP

, caf1.DVC

, caf1.DVSCO

, caf2.TXW

, caf2.XLR

, caf2.XPR

, caf2.XRD

, caf1.AMDC

, caf2.XRENT

, caf1.IRENT

, caf1.ESUB

, caf2.TXFO

, caf1.FCA

, caf2.SPI

, caf1.DO

, caf1.CSTKE


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


WHERE ca.gvkey = '207920'

AND ca.popsrc = 'I'

ORDER BY caf1.datadate DESC

, c.conml

, caf1.popsrc

