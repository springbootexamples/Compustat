/***********************************************************************************************
Returns Number Of Companies With Fundamental Data Available

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized
Xpressfeed Reference

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey
isocntrycd

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the GVKEYs and the Company Names for U.S. and Canadian companies with fundamental data. Note:To get fundamental data for active companies use: WHERE ( A.costat = A ), To get fundamental data for inactive companies use: WHERE ( A.costat = I ). To get the number of active and inactive Canadian companies with fundamental data available for the 2012  fiscal year use: AND ( b.datadate = 6/30/2012 AND b.datadate = 5/31/2013 )

***********************************************************************************************/

SELECT costat
, isocntrydesc
, b.gvkey
, conm

FROM company A

JOIN co_adesind B ON A.gvkey = B.gvkey

JOIN r_country C ON A.loc = C.isocntrycd

WHERE popsrc= 'D'

AND loc = 'USA'

OR loc= 'CAN'

GROUP BY costat
, isocntrydesc
, b.gvkey
, a.conm

ORDER BY 1,2