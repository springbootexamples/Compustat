/************************************************************************************************
Datadate new adjustment factor is applied to given company

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
20/08/2020

DatasetKey:
8

The following sample returns the datadate that a new adjustment factor is applied for stock splits.

***********************************************************************************************/


DROP  TABLE  IF  EXISTS temp_x;
--CREATE TEMPORARY TABLE IF NOT EXISTS temp_x AS
CREATE TEMPORARY TABLE temp_x(
   sequence int  GENERATED ALWAYS AS IDENTITY,
   gvkey varchar(100),
   iid varchar(100),
   ajexdi int,
   datadate date
);




insert into temp_x(gvkey, iid, ajexdi, datadate)
SELECT 
	gvkey,
	iid,
	ajexdi,
	MIN ( datadate ) AS datadate

FROM sec_dprc
WHERE gvkey = '117768'

GROUP BY gvkey, iid, ajexdi 
ORDER BY gvkey, iid, MIN ( datadate );

SELECT 
	a.gvkey,
	a.iid,
	a.ajexdi,
	b.ajexdi,
	a.datadate,
	a.ajexdi/b.ajexdi " ajexdi non cum "
FROM temp_x a
JOIN temp_x b on b.sequence = a.sequence + 1

ORDER BY a.gvkey, a.iid, a.datadate;
