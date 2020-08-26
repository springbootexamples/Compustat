/***********************************************************************************************
Returns Interim Fundamental Data At The Issue Level

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
consol
datafmt
gvkey
iid
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

This query returns interim fundamental data for Samsung Electronics Co Ltd. in Xpressfeed

***********************************************************************************************/

---Interim Fundamental Issue Data

SELECT c.gvkey

, c.conm
, s.iid
, s.dsci
, i.datadate
, i.ajexiq
, i.curcdq
, f.niq AS NetIncomeQuarterlyConsolidated
, fn.niq_fn1, f.niq_dc
, f.nisa AS NetIncomeSemiAnnualConsolidated
, fn.nisa_fn1, f.nisa_dc
, f.niy AS NetIncomeYTDConsolidated
, fn.niy_fn1
, f.niy_dc
, f.nincq AS NetIncomeQuarterlyNonConsolidated
, fn.nincq_fn1, f.nincq_dc
, f.nincsa AS NetIncomeSemiAnnualNonConsolidated
, fn.nincsa_fn1
, f.nincsa_dc
, f.nincy AS NetIncomeYTDNonConsolidated
, fn.nincy_fn1
, f.nincy_dc
, f.cshpriaq AS SharesToCalcEPSQtr
, fn.CSHPRIAQ_fn1
, f.CSHPRIAQ_dc
, f.cshpriasa AS SharesToCalcEPSSemiAnnual
, fn.CSHPRIAsa_fn1
, f.CSHPRIAsa_dc
, f.cshpriay AS SharesToCalcEPSYTD
, fn.CSHPRIAY_fn1
, f.CSHPRIAY_dc
, f.cshoiq AS sharesOutIssue
, fn.cshoiq_fn1
, f.cshoiq_dc
, f.tstkniq AS treasuryStockIssue
, fn.cshoiq_fn1
, f.cshoiq_dc
, f.icapiq AS investedCapitalQtr
, fn.icapiQ_fn1
, f.icapiQ_dc
, f.pvq AS parValueQtr
, fn.pvQ_fn1
, f.pvQ_dc

FROM company c

JOIN SECURITY s ON s.gvkey = c.gvkey

JOIN sec_idesind i ON i.gvkey = s.gvkey 

AND i.iid = s.iid

JOIN sec_ifnd f ON f.gvkey = s.gvkey 

AND f.iid = s.iid

AND f.datadate = i.datadate

AND f.indfmt = i.indfmt

AND f.datafmt = i.datafmt

AND f.consol = i.consol

AND f.popsrc = i.popsrc

LEFT OUTER JOIN sec_ifnt fn ON fn.gvkey = i.gvkey

AND fn.iid = i.iid

AND fn.datadate = i.datadate

AND fn.indfmt = i.indfmt

AND fn.datafmt = i.datafmt

AND fn.consol = i.consol

AND fn.popsrc = i.popsrc

WHERE c.gvkey = '104604'

ORDER BY f.datadate DESC