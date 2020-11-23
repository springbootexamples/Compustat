/***********************************************************************************************
Returns companies with merger or spin-off

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
gvkey
iid

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query finds companies with merger or spin-off
NOTE: The following tables can be queried in order to find companies with either mergers or spin-offs in Xpressfeed:
For Mergers:table sec_mth item isalrt = PA or PM prior to 2000 or PA after 2000table sec_mthdiv item cheqvm is not null
For Spin-offs:table sec_mth item isalrt is null and table sec_mthdiv item cheqvm is not null
The data item Comparability Status Code (COMPST and COMPSTQ) can be used for North American Companies to identify 
those that have had a merger or acquisition during the current year with an AA or an AA-combination code.
Uncomment the second query to return the footnote on Sales-Net which can also be used to find acquisitions.

***********************************************************************************************/

SELECT gvkey, datadate, compst

FROM co_adesind

WHERE COMPST in ( 'AA','AF' ,'AR','AS' )

ORDER BY gvkey, DATADATE DESC



--SELECT gvkey, datadate, sale_fn

--FROM co_afntind2

--WHERE SALE_FN = AA

--ORDER BY DATADATE DESC
