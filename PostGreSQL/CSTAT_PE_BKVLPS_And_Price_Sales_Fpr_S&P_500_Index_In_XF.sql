/***********************************************************************************************
Returns PE, BKVLPS And Price Sales

Packages Required:
Core
Core 2
MSCI Index Level Data (Legacy)

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkeyx

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8,100

This query returns returns Price-to-Earnings ratio (PE), Price-to-Book (Book Value per Share) , and Price-to-Sales (Price/Sales) for the SP 500 Index in Xpressfeed

***********************************************************************************************/

SELECT im.gvkeyx

, im.datadate

, im.epsx12

, im.bkvlps

, im.prccm

, ROUND ( SUM (im.prccm/im.bkvlps), 4) AS KBK

, ROUND ( SUM (im.prccm/im.epsx12), 4) AS PE

, ROUND ( SUM (im.prccm/ia.sale), 4) AS Pricesale 

FROM idx_mth im

, idx_ann ia 

WHERE im.gvkeyx = '000003'

AND im.gvkeyx = ia.gvkeyx 

AND im.datadate = ia.datadate 

GROUP BY im.gvkeyx

, im.datadate

, im.bkvlps

, im.prccm

, im.epsx12

, ia.sale 

ORDER BY im.datadate DESC