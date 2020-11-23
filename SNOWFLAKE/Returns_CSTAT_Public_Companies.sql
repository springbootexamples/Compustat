/***********************************************************************************************
Returns Compustat Public Companies

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query a public or formerly public company that has at least one entry in the security data group trading on an exchange
NOTE: Uncomment the second query to return companies that have pricing in the sec_dprc data group.

***********************************************************************************************/

SELECT gvkey

FROM security

WHERE exchg not in ( 0,1,2,3,4 )

GROUP BY gvkey



--SELECT gvkey

--FROM company c ( NOLOCK )

--WHERE exists 


--( SELECT * 

--FROM sec_dprc p (NOLOCK) 

--WHERE c.gvkey = p.gvkey )







