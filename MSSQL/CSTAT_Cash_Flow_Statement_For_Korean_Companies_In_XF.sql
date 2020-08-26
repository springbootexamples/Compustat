/***********************************************************************************************
Returns Cash Flow Statement For Korean Companies 

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
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
01/07/2020

DatasetKey:
8

This query  returns a Cash Flow Statement for companies from Korea

***********************************************************************************************/


SELECT c.conml
, c.gsector
, r.gicdesc
, c.loc
, ca.curcd
, caf1.gvkey
, caf1.datadate
, ca.scf
, caf1.IBC
, caf2.MIC
, caf1.EIEAC
, caf1.DPC
, caf2.XIDOC
, caf2.TXDC
, caf2.PRV
, caf2.SPPIV
, caf2.RV
, caf2.TXOP
, caf1.INTOACT
, caf1.FOPO
, caf2.RECCH
, caf1.INVCH
, caf1.APCH
, caf1.ACCLI
, caf1.CUSTADV
, caf1.AOLOCH
, caf2.WCAPOPC
, caf2.OANCF
, caf1.IVCH
, caf2.SIV
, caf1.IVSTCH
, caf1.ATOCH
, caf1.CAPX
, caf1.INTANP
, caf2.PSFIX
, caf1.AQC
, caf1.INTIACT
, caf1.IVACO
, caf1.IVNCF
, caf2.SSTK
, caf2.PRSTKC
, caf2.PURTSHR
, caf1.DV
, caf1.LTDCH
, caf1.DLCCH
, caf2.TX
, caf2.PLIACH
, caf2.MISEQ
, caf1.INTFACT
, caf1.FIAO
, caf1.FINCF
, caf1.EXRE
, caf1.CFLAOTH
, caf1.CHECH
, caf1.CHEB
, caf1.CHEE
, caf1.DBTB
, caf1.DBTE
, caf2.ONBALB
, caf2.ONBALE
, caf2.TXPD
, caf1.INTPN

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

WHERE ca.gvkey = '242861'

ORDER BY c.conml, caf1.popsrc, caf1.datadate DESC 
