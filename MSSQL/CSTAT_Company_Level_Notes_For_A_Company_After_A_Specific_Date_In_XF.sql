/***********************************************************************************************
Returns Company Level Notes

Packages Required:
Core
Core 2
Transparency
Transparency History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the company-level notes for a company after a specific data date

***********************************************************************************************/

SELECT company.conm

, a.gvkey

, a.datadate

, a.note


FROM aco_amda a 


JOIN company ON a.gvkey = company.gvkey


WHERE a.gvkey IN ( '025434' ) 

AND a.datadate >' 06/30/2007'

ORDER BY a.notetype
