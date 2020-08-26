/***********************************************************************************************
Returns Price-To-Book-Ratio For ADRs

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This formula calculates the price-to-book ratio, also called market-to-book, for American Depositary Receipts (ADRs) (PRCCMCSHOC/ADRRC)/CEQQ Note:This query returns the price-to-book ratio for Loreal - ADR in Xpressfeed

***********************************************************************************************/

SELECT company.conm
, s.iid
, company.gvkey
, sec_mthprc.datadate AS pricedate
, co_ifndq.datadate AS sharedate
, sec_mthprc.prccm
, sec_dprc.cshoc
, sec_dprc.adrrc
, co_ifndq.ceqq
, ( ( sec_mthprc.prccm*( sec_dprc.cshoc/1000000 ) /sec_dprc.adrrc ) /co_ifndq.ceqq ) AS ptb


FROM company company, 
security s, 
sec_dprc sec_dprc, 
co_ifndq co_ifndq, 
sec_mthprc sec_mthprc


WHERE company.gvkey = s.gvkey


AND company.gvkey = sec_dprc.gvkey
AND company.gvkey = co_ifndq.gvkey
AND company.gvkey = sec_mthprc.gvkey
AND s.gvkey = sec_dprc.gvkey
AND s.gvkey = co_ifndq.gvkey
AND s.gvkey = sec_mthprc.gvkey
AND co_ifndq.popsrc = 'd'
AND co_ifndq.datafmt = 'std'
AND sec_dprc.gvkey = sec_mthprc.gvkey
AND sec_dprc.gvkey = co_ifndq.gvkey
AND co_ifndq.gvkey = sec_mthprc.gvkey
AND s.iid = sec_dprc.iid
AND s.iid = sec_mthprc.iid
AND sec_dprc.iid = sec_mthprc.iid
AND YEAR(co_ifndq.datadate) = YEAR( DATEADD ( m, -8, GETDATE ( ) ) )
AND YEAR(sec_mthprc.datadate) = Year( DATEADD ( m, -2, GETDATE ( ) ) )
AND sec_dprc.datadate = sec_mthprc.datadate
AND company.gvkey = '100581'
AND s.iid = '90'

ORDER BY pricedate desc ,sharedate desc
