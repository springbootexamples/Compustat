/***********************************************************************************************
Returns Data Item That Have Never Been Restated In Snapshot 

Packages Required:
Snapshot

Universal Identifiers:
GVKEY

Primary Columns Used:
coifnd_id

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns a true or false based on how many records exist in the Snapshot  North America database for COGSQ for IBM:

***********************************************************************************************/

SELECT c .*

FROM csco_ikey c

JOIN ( SELECT b .coifnd_id , COUNT ( item ) AS countitem


FROM csco_ikey a


JOIN csco_ifndq b ON a .coifnd_id = b .coifnd_id


WHERE gvkey = 006066 AND item = 'COGSQ'

GROUP BY b .coifnd_id HAVING COUNT ( item ) = 1 )

d ON c .coifnd_id = d .coifnd_id