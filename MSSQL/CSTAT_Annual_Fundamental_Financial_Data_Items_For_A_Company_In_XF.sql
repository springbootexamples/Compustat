/***********************************************************************************************
Returns Annual Fundamental Financial Data Items 

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datefmt
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

This query returns all of the annual fundamental financial data items for all annual periods  for a company . Note: Uncomment the second query to return ll data in the Company table for all companies  that contain Enron anywhere in the company name (CONM)

***********************************************************************************************/

SELECT a.csho, *FROM co_afnd1 a


JOIN co_afnd2 b ON a.gvkey = b.gvkey
AND CAST(a.datadate AS DATE) = CAST(b.datadate AS DATE)
AND a.indfmt = b.indfmt
AND a.datafmt = b.datafmt
AND a.consol = b.consol
AND a.popsrc = b.popsrc


WHERE a.gvkey ='006066'
ORDER BY a.datadate DESC


---SELECT *  

---FROM company company 

---WHERE conm LIKE %enron%