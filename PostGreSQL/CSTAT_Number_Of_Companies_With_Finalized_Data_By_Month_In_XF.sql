/***********************************************************************************************
Returns Number Of Companies With Finalized Data By Month

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the number of companies that have finalized data by month

***********************************************************************************************/

SELECT a.*, b.*

, ROUND(cast(( CAST ( a.fin_num_cos as float ) / CAST ( b.fin_num_cos as float ) ) *100 as INT), 2) AS Percentage

FROM ( SELECT extract (year from  ( datadate )) AS datayear

, extract (month from  ( datadate )) AS datamonth
, COUNT ( DISTINCT ( gvkey ) ) AS fin_num_cos 


FROM co_adesind 

WHERE extract (year from  ( datadate )) BETWEEN 2000 AND 2009 AND upd = '3' 

GROUP BY extract (year from  ( datadate )) , extract (month from  ( datadate )) )

a JOIN ( select extract (year from  ( datadate )) AS datayear

, extract (month from  ( datadate )) AS datamonth
, COUNT ( DISTINCT ( gvkey ) ) AS fin_num_cos 

FROM co_adesind

WHERE extract (year from  ( datadate )) BETWEEN 2000 AND 2009

GROUP BY extract (year from  ( datadate )) , extract (month from  ( datadate )) ) 

b ON a.datayear = b.datayear AND a.datamonth = b.datamonth


ORDER BY a.datayear-- b.datamonth
