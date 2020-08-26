/***********************************************************************************************
Returns GICS Code Description For All Level Of GICS Codes

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
20/08/2020

DatasetKey:
8

The following sample query returns the GICS code description for all level of GICS codes as well as the numeric  code in Xpressfeed for a given company(Here INTL BUSINESS MACHINES CORP)

***********************************************************************************************/

SELECT 
        a.conm,
        a.gvkey,
        b.gicdesc,
        b.giccd
FROM company a, r_giccd b
WHERE ( a.gsubind = b.giccd
        OR a.ggroup = b.giccd
        OR a.gind = b.giccd
        OR a.ggroup = b.giccd
        OR a.gsector = b.giccd ) 
        AND a.gvkey = '006066'
