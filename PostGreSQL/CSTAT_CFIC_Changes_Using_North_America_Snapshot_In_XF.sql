/***********************************************************************************************
Returns FIC Changes Using North America Snapshot

Packages Required:
Snapshot

Universal Identifiers:
GVKEY

Primary Columns Used:
effdate
gvkey

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query finds changes to the ISO Country Code - Incorporation (FIC) in the last  20 years using the cscompany table in North America Snapshot

***********************************************************************************************/

WITH x AS ( SELECT gvkey, COUNT ( DISTINCT fic ) AS cnt, DATE_PART('year', effdate::date),  DATE_PART('year', NOW()::date)

FROM cscompany 

WHERE --date_part ( 'YEAR' , cast(effdate as date), cast (NOW() as date) ) = 20 --limit to past 20 years

 ABS(DATE_PART('year', effdate::date) - DATE_PART('year', NOW()::date)) = 20

GROUP BY gvkey,cscompany.effdate

HAVING COUNT ( DISTINCT fic ) = 1 )

SELECT c1.gvkey, 
c1.conm, 
c1.fic, 
c1.effdate

FROM cscompany c1 

JOIN cscompany c2  ON c1.gvkey = c2.gvkey
AND c1.effdate = c2.thrudate + interval '1 Second' ---DATEADD ( SS, 1, c2.thrudate )
JOIN x ON x.gvkey = c1.gvkey

WHERE c1.fic =   c2.fic

UNION

SELECT c3.gvkey, 
c3.conm, 
fic, 
c3.effdate

FROM cscompany c3 

JOIN ( SELECT gvkey, MIN ( effdate ) effdate

FROM cscompany
GROUP BY gvkey ) c4

ON c3.gvkey = c4.gvkey AND c3.effdate = c4.effdate

JOIN x ON x.gvkey = c3.gvkey

ORDER BY gvkey, effdate
