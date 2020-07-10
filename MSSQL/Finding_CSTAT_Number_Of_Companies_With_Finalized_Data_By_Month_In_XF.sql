/************************************************************************************************
Finding Number of Companies with Finalized Data By Month.

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

This query returns the number of companies that have finalized data by month.

***********************************************************************************************/

SELECT a.*, b.*

,ROUND ( ( CONVERT ( float,a.fin_num_cos ) / CONVERT ( float,b.fin_num_cos ) ) *100,2 ) AS Percentage

FROM ( SELECT YEAR ( datadate ) AS datayear

, MONTH ( datadate ) AS datamonth
, COUNT ( DISTINCT ( gvkey ) ) AS fin_num_cos 


FROM co_adesind 

WHERE YEAR ( datadate ) BETWEEN 2000 AND 2009 AND upd = '3' 

GROUP BY YEAR ( datadate ) , MONTH ( datadate ) )

a JOIN ( SELECT YEAR ( datadate ) AS datayear

, MONTH ( datadate ) AS datamonth
, COUNT ( DISTINCT ( gvkey ) ) AS fin_num_cos 

FROM co_adesind

WHERE YEAR ( datadate ) BETWEEN 2000 AND 2009

GROUP BY YEAR ( datadate ) , MONTH ( datadate ) ) 

b ON a.datayear = b.datayear AND a.datamonth = b.datamonth


ORDER BY a.datayear-- b.datamonth
