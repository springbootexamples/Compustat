/***********************************************************************************************
Returns Data Item Translated To USD For Non-US Companies

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

This query returns the Global Industry Classification Standard (GICS) Sector, GICS Description (GICDESC),  International Organization for Standardization (ISO) Currency Code (CURCD), Revenue -Total (REVT)  displayed in U.S. Dollars (USD), USD Translation Rate, and the 12-month moving Average Exchange Rate (EXRAT12M) for all European companies in Xpressfeed

***********************************************************************************************/

SELECT a.conm , 
a.gvkey, 
a.loc, 
a.gsector, 
b.gicdesc, 
e.datadate, 
f.curcd, 
SUM ( e.revt* ( d.exrat12m/c.exrat12m ) ) AS revt_USD, e.revt, d.exrat12m AS USD, c.exrat12m 

FROM company a , 
r_giccd b, 
exrt_mth c, 
exrt_mth d, 
co_afnd2 e, 
co_adesind f 

WHERE b.giccd = a.gsector 

AND a.FIC IN ( 'ALB' , 'AND', 'AUT', 'BEL', 'BGR', 'BIH', 'BLR', 'CHE', 'CYP', 'CZE', 'DEU', 'DNK', 'ESP', 'EST', 'FIN', 'FRA', 'FRO', 
'FXX', 'GBR', 'GIB', 'GRC', 'GRL', 'HRV', 'HUN', 'IRL', 'ISL', 'ITA', 'LIE', 'LTU', 'LUX', 'LVA', 'MCO', 'MDA', 'MKD', 'MLT', 'NLD', 
'NOR', 'NUK', 'POL', 'PRT', 'ROM', 'RUS', 'SJM', 'SMR', 'SUN', 'SVK', 'SVN', 'SWE', 'TUR', 'UKR', 'VAT', 'YUG' ) 

AND a.costat = 'A'
AND a.gvkey = e.gvkey
AND a.gvkey = f.gvkey
AND f.datadate = d.datadate
AND f.datadate = e.datadate
AND f.datadate = c.datadate
AND f.popsrc = e.popsrc
AND f.popsrc = 'I'
AND c.tocurm = f.curcd
AND d.tocurm = 'USD'
AND f.datadate BETWEEN '06/30/2002' AND '05/31/2003' 

GROUP BY a.conm , 
a.gvkey, 
a.loc, 
a.gsector, 
b.gicdesc, 
e.datadate, 
f.curcd, 
e.revt, 
d.exrat12m, 
c.exrat12m 

ORDER BY e.revt DESC
