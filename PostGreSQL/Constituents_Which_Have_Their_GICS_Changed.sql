/***********************************************************************************************
Returns constituents which have their GICS code changed prior to quarter-end

Packages Required:
GICS History Daily
S&P TSX 60 Constituent Name History

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
100

The following sample query returns constituents of the SP 1500 since June 30, 2015 
that have had their Global Industry Classification Standard (GICS) code changed prior 
to quarter-end in Xpressfeed

***********************************************************************************************/

SELECT * FROM indexcst_his a 


JOIN gic_history b ON CAST(a.gvkey as varchar(100)) = CAST(b.gvkey as varchar(100)) 


WHERE gvkeyx = '031855' 


AND (thrudate IS NULL OR thrudate = '6/30/15' ) AND fromDate IN ( '7/1/2015' , '10/1/2015' , '1/1/2016' , '4/1/2016' , '7/1/2016' ) 


ORDER BY fromDate
