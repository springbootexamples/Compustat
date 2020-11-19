/***********************************************************************************************
Returns Companies With More Than Specified Number Of Securities

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns all companies that have issued more than 10 securities

***********************************************************************************************/

SELECT c.gvkey, c.conm

FROM company c

WHERE ( SELECT COUNT ( * ) 


FROM security s 

WHERE s.gvkey = c.gvkey ) > 10

