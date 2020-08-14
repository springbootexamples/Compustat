/***********************************************************************************************
Returns REITs

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

This query return Real Estate Investment Trust (REIT) companies by searching for companies with a Standard Industrial Classification (SIC) code of 6798 or a Global Industry Classification Standard (GICS)  Industry code of 404020 in the company table in Xpressfeed.(Uncomment the second query to get GICS)

***********************************************************************************************/

---Using SIC:
SELECT company.gvkey 
,company.conm
,company.sic
,r_siccd.sicdesc 

FROM company company, r_siccd r_siccd 

WHERE company.sic = '6798' 

AND company.sic = r_siccd.siccd 

ORDER BY company.conm


---Using GICS:

/**
SELECT company.gvkey 
, company.conm
, company.gsubind
, r_giccd.gicdesc 

FROM company company, r_giccd r_giccd 

WHERE company.gind = '601010' 

AND company.gsubind = r_giccd.giccd 

ORDER BY company.conm 
**/