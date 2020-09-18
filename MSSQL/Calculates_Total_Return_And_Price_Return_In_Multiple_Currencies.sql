/***********************************************************************************************
Returns Total Return And Price Return In Multiple Currencies

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
curcdd
datadate
gvkey
iid
tocurd

Database_Type:
MSSQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query returns the Price Return and Total Return values for a company
in Local Currency, British Pounds (GBP), U.S. Dollars (USD), and Euros (EUR) for a 
specified period of time using the Compustat® database in Xpressfeed.

***********************************************************************************************/

DECLARE @GVKey AS varchar ( 6 )

, @IID AS varchar ( 3 ), @StartDate AS datetime, @EndDate AS datetime ;

SET @GVKey = '014894' --Enter the GVKey
SET @IID = '01W' --Enter the IID
SET @StartDate = '2002-01-02' --Enter the Start Date
SET @EndDate = '2001-12-03' --Enter the End Date
SELECT a.gvkey

, a.iid, a.curcdd AS Local_Currency, ( ( ( ( a.prccd / a.ajexdi ) / ( b.prccd / b.ajexdi ) ) -1 ) *100 ) AS PriceReturn_in_Local_Currency,
( ( ( ( ( a.prccd / a.ajexdi ) * c.trfd ) / ( ( b.prccd / b.ajexdi ) * d.trfd ) ) -1 ) *100 ) AS TotalReturn_in_Local_Currency, 
( ( ( ( a.prccd / a.ajexdi / e.exratd ) / ( b.prccd / b.ajexdi / f.exratd ) ) -1 ) *100 ) AS PriceReturn_in_GBP, 
( ( ( ( ( a.prccd / a.ajexdi / e.exratd ) * c.trfd ) / ( ( b.prccd / b.ajexdi / f.exratd ) * d.trfd ) ) -1 ) *100 ) AS TotalReturn_in_GBP,
( ( ( ( a.prccd / a.ajexdi / e.exratd * g.exratd ) / ( b.prccd / b.ajexdi / f.exratd * h.exratd ) ) -1 ) *100 ) AS PriceReturn_in_USD, 
( ( ( ( ( a.prccd / a.ajexdi / e.exratd * g.exratd ) * c.trfd ) / ( ( b.prccd / b.ajexdi / f.exratd * h.exratd ) * d.trfd ) ) -1 ) *100 ) AS TotalReturn_in_USD, 
( ( ( ( a.prccd / a.ajexdi / e.exratd * i.exratd ) / ( b.prccd / b.ajexdi / f.exratd * j.exratd ) ) -1 ) *100 ) AS PriceReturn_in_EUR, 
( ( ( ( ( a.prccd / a.ajexdi / e.exratd * i.exratd ) * c.trfd ) / ( ( b.prccd / b.ajexdi / f.exratd * j.exratd ) * d.trfd ) ) -1 ) *100 ) AS TotalReturn_in_EUR

FROM sec_dprc  a

JOIN sec_dprc b ON a.gvkey + a.iid = b.gvkey + b.iid
JOIN sec_dtrt c ON a.gvkey + a.iid = c.gvkey + c.iid
JOIN sec_dtrt d ON a.gvkey + a.iid = d.gvkey + d.iid
LEFT JOIN exrt_dly e ON a.datadate = e.datadate 
AND a.curcdd = e.tocurd
LEFT JOIN exrt_dly f ON CAST(b.datadate AS DATE) = CAST(f.datadate AS DATE) AND b.curcdd = f.tocurd
LEFT JOIN exrt_dly g ON CAST(a.datadate AS DATE) = CAST(g.datadate AS DATE) AND g.tocurd = 'USD'
LEFT JOIN exrt_dly h ON CAST(b.datadate AS DATE) = CAST(h.datadate AS DATE) AND h.tocurd = 'USD'
LEFT JOIN exrt_dly i ON CAST(a.datadate AS DATE) = CAST(i.datadate AS DATE) AND i.tocurd = 'EUR'
LEFT JOIN exrt_dly j ON CAST(b.datadate AS DATE) = CAST(j.datadate AS DATE) AND j.tocurd = 'EUR'

WHERE a.datadate = @EndDate

AND b.datadate = @StartDate
AND @EndDate BETWEEN c.datadate AND ISNULL ( c.thrudate , 2900-01-01 )AND @StartDate BETWEEN d.datadate AND ISNULL ( d.thrudate , 2900-01-01 )
AND a.gvkey = @GVKey
AND a.iid = @IID