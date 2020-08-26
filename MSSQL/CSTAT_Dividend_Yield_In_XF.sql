/***********************************************************************************************
Returns Dividend Yield

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
iid
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query calculates dividend yield for IBM as of December 31, 2007 based on Indicated Annual Dividend Rate - Monthly (DVRATE) and Price-Close Monthly (PRCCM)

***********************************************************************************************/

SELECT sec_mthdiv . gvkey 
, sec_mthdiv . iid, sec_mthdiv . datadate, 
sec_mthdiv . dvrate, sec_mth . ajexm, sec_mthprc . prccm , 
( ( ( sec_mthdiv . dvrate / sec_mth . ajexm )/( sec_mthprc . prccm / sec_mth . ajexm ) ) * 100 ) 


AS dividend_yield FROM sec_mth sec_mth


, sec_mthdiv sec_mthdiv, sec_mthprc sec_mthprc


WHERE sec_mth . gvkey = sec_mthdiv . gvkey 


AND sec_mth . gvkey = sec_mthprc. gvkey
AND sec_mth . iid = sec_mthdiv . iid
AND sec_mth . iid = sec_mthprc . iid
AND sec_mth . datadate = sec_mthdiv . datadate
AND sec_mth . datadate = sec_mthprc . datadate
AND sec_mthdiv . gvkey = sec_mthprc . gvkey
AND sec_mthdiv . iid = sec_mthprc . iid
AND sec_mthdiv . datadate = sec_mthprc . datadate 
AND sec_mthdiv . datadate = '12/31/2007' 
AND sec_mthdiv . gvkey = 006066 


