/************************************************************************************************
Finding Number of Securities Issued per Company.

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
01\07\2020

DatasetKey:
8

This query returns the number of securities issued per company.

***********************************************************************************************/

SELECT s.gvkey, 
COUNT ( * ) AS count, 
MAX ( c.conm ) AS conm

FROM company c, 
security s

WHERE s.gvkey = c.gvkey
GROUP BY s.gvkey
ORDER BY count DESC
