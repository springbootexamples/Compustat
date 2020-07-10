/************************************************************************************************
Finding FIC Changes Using North America Snapshot

Packages Required:
Snapshot

Universal Identifiers:
GVKEY

Primary Columns Used:
effdate
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

This query finds changes to the ISO Country Code - Incorporation (FIC) in the last 
20 years using the cscompany table in North America Snapshot.

***********************************************************************************************/

WITH x AS ( SELECT gvkey, COUNT ( DISTINCT fic ) AS cnt

FROM cscompany ( NOLOCK )

WHERE DATEDIFF ( YY, effdate, GETDATE () ) = 20 --limit to past 20 years

GROUP BY gvkey

HAVING COUNT ( DISTINCT fic ) = 1 )

SELECT c1.gvkey, 
c1.conm, 
c1.fic, 
c1.effdate

FROM cscompany c1 ( NOLOCK )

JOIN cscompany c2 ( NOLOCK ) ON c1.gvkey = c2.gvkey
AND c1.effdate = DATEADD ( SS, 1, c2.thrudate )
JOIN x ON x.gvkey = c1.gvkey

WHERE c1.fic  c2.fic

UNION

SELECT c3.gvkey, 
c3.conm, 
fic, 
c3.effdate

FROM cscompany c3 ( NOLOCK )

JOIN ( SELECT gvkey, MIN ( effdate ) effdate

FROM cscompany( NOLOCK )
GROUP BY gvkey ) c4

ON c3.gvkey = c4.gvkey AND c3.effdate = c4.effdate

JOIN x ON x.gvkey = c3.gvkey

ORDER BY gvkey, effdate
