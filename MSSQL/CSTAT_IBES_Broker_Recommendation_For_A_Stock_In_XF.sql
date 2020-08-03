/************************************************************************************************
Finding IBES Broker Recommendation for A stock.

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
gvkey

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01\07\2020

DatasetKey:
8

Query the Xpressfeed database on the data item I/B/E/S Recommendations Consensus (IBRECON). This 
item is located in the ibwrecom data group. This item is the mean recommendation consensus. It is 
also helpful to pull in I/B/E/S Number of Recommendations (IBNOREC) from the same table because it gives more 
meaning to the mean recommendation.
The possible recommendations are:1- Strong Buy2- Buy3- Hold4- Underperform5- Sell
SQL Query:

***********************************************************************************************/

SELECT b.gvkey, 
c.conm, 
a.ibtic, 
a.ibrecon, 
a.ibnorec

FROM ibwrecom a, 
security b, 
company c

WHERE a.ibtic = b.ibtic

AND b.gvkey = c.gvkey
AND a.ibtic = 'ibm'