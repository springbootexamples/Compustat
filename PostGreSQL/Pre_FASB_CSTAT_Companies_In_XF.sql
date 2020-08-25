/***********************************************************************************************
Returns Pre-FASB Companies

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
01/07/2020

DatasetKey:
8

This query returns the Company Name (CONM), Global Company Key (GVKEY), and Security  Description (DSCI) for pre-FASB companies in Xpressfeed

***********************************************************************************************/

SELECT b.CONM, a.* 


FROM security a, company b 


WHERE a.gvkey = b.gvkey 


AND dsci LIKE '%PRE FASB%' 


ORDER BY secstat


, b.gvkey

