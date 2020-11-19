/***********************************************************************************************
Returns Daily Translation Rates

Packages Required:
Core
Core 2

Universal Identifiers:
GVKEY

Primary Columns Used:
datadate
tocurd

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

This query returns the daily exchange rate to translate Hong Kong Dollars (HKD) to U.S.  Dollars (USD) since inception

***********************************************************************************************/

SELECT a.datadate

, a.exratd AS hkd_exratd 

, b.exratd AS usd_exratd 

, ( 1/a.exratd ) * b.exratd AS exchange_rate 
-----t.exratd/f.exratd AS fexratd --the daily translation rate


FROM exrt_dly a, exrt_dly b 

WHERE ( a.tocurd = 'HKD' ) 

AND ( a.fromcurd = 'GBP' ) 

AND ( b.tocurd = 'USD' ) 

AND ( b.fromcurd = 'GBP' ) 

AND a.datadate = b.datadate 


ORDER BY datadate desc 



