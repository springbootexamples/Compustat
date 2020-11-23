/***********************************************************************************************
Returns Shares Outstanding For A Time Period In Compustat

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
iid

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
20/08/2020

DatasetKey:
8

The following sample query pulls the Common Shares Outstanding - Current (CSHOC) values, include From and  To dates (fromDate and toDate), for a company from the Security - Daily Pricing (sec_dprc)  table in Xpressfeed

***********************************************************************************************/

SELECT 
        cshoc,
        gvkey,
        iid,
        MAX ( dataDate ) AS ToDate,
        MIN ( dataDate ) AS FromDate
FROM sec_dprc
WHERE gvkey = '174301'
        AND iid = '01'

GROUP BY cshoc, gvkey, iid
ORDER BY MAX ( datadate ) DESC