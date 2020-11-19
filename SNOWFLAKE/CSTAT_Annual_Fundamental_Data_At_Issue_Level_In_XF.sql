/***********************************************************************************************
Returns Annual Fundamental Data At The Issue Level

Packages Required:
Core
Core 2
Core History

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
datefmt
gvkey
indfmt
iid
popsrc

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns annual fundamental data for Shanghai Electric Group Co Ltd. in Xpressfeed. ---Pulls Annual Issue Data , Footnotes, and Data Codes

***********************************************************************************************/

SELECT c.conml
, s.datadate
, sa.curcdi
, sa.ajexi
, sa.iid
, s.nicon
, fn.nicon_fn
, dc.nicon_dc
, s.epsexcon
, fn.epsexcon_fn
, dc.nicon_dc
, s.cshpria
, fn.cshpria_fn
, dc.cshpria_dc
, s.cshoi
, fn.cshoi_fn
, dc.cshoi_dc
, s.icapi
, fn.icapi_fn
, dc.icapi_dc
, s.pv
, fn.pv_fn
, dc.pv_dc,
e.epspx
, e.epspx_dc
, e.epspi
, epspi_dc
, e.cshpri
, e.cshpri_dc

FROM sec_afnd s

JOIN company c ON c.gvkey = s.gvkey
JOIN sec_adesind sa ON s.gvkey = sa.gvkey

AND s.iid = sa.iid
AND s.datadate = sa.datadate
AND s.popsrc = sa.popsrc

LEFT OUTER JOIN sec_afnt fn ON fn.gvkey = sa.gvkey

AND fn.iid = sa.iid
AND fn.datadate = sa.datadate
AND fn.datafmt = sa.datafmt
AND fn.popsrc = sa.popsrc

LEFT OUTER JOIN sec_afnddc dc ON dc.gvkey = sa.gvkey

AND dc.iid = sa.iid
AND dc.datadate = sa.datadate
AND dc.datafmt = sa.datafmt
AND dc.popsrc = sa.popsrc

LEFT OUTER JOIN sec_eps e ON e.gvkey = sa.gvkey

AND e.iid = sa.iid
AND e.datadate = sa.datadate

WHERE s.gvkey = 272836
ORDER BY c.conml, s.datadate DESC
