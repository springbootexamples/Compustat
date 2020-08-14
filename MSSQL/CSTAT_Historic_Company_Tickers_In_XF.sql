/***********************************************************************************************
Returns Historic Company Tickers

Packages Required:
Core

Universal Identifiers:
GVKEY
Ticker

Primary Columns Used:
datadate

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the Compustat historic company tickers from the Corporate Tracker package in Xpressfeed

***********************************************************************************************/

SELECT *FROM sec_idhist

WHERE gvkey = 160329 

AND item = 'tic'

---AND itemValue = 'GOOG'

----To return the GVKEY for the ticker GOOG

