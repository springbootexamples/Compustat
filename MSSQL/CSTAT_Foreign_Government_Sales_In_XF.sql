/***********************************************************************************************
Returns Foreign Government Sales

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

This query returns GVKEYs where the Customer Name contains foreign government (GOVFRN)

***********************************************************************************************/

SELECT * 

FROM seg_customer 

WHERE cnms like 'foreign g%'

---WHERE ctype like 'govfrn%'  
---(returns GVKEYs where the Customer Type contains govfrn)

---WHERE gvkey=002285 
---(company reporting domestic (GOVDOM) and foreign (GOVFRN) government sales is Boeing)

ORDER BY gvkey
