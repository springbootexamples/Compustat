/***********************************************************************************************
Returns Semi-Annual Cah Flow For International Companies

Packages Required:
Core

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datafmt
fyr
gvkey
indfmt
popsrc

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
01/07/2020

DatasetKey:
8

The following sample query calculates semi-annual cash flow from operating activities (OANCFY) for international companies

***********************************************************************************************/

do $$

declare vgvkey varchar(100);

begin
	
	select '016603' into vgvkey; --First query subtracts Q2 ytd from Q4 ytd to get second half cash flow:
	
	
drop table if exists temp_table;
create table if not exists temp_table as

SELECT ( y4.oancfy-y2.oancfy ) oancfsa

, curcdq

, d.gvkey

, d.datadate

, d.fyr

, d.datafmt

, d.scfq

, d.pdytd

, d.fqtr


FROM co_idesind d


JOIN co_ifndytd y4 --cash flow data from fqtr 4 

ON y4.gvkey = d.gvkey


AND CAST(y4.datadate AS DATE) = CAST(d.datadate AS DATE)

AND y4.indfmt = d.indfmt

AND y4.consol = d.consol

AND y4.popsrc = d.popsrc

AND y4.fyr = d.fyr

AND y4.datafmt = d.datafmt

AND y4.oancfy IS NOT NULL

JOIN co_ifndytd y2 --cash flow data from fqtr 2 

ON y2.gvkey = d.gvkey

AND y2.indfmt = d.indfmt

AND y2.consol = d.consol

AND y2.popsrc = d.popsrc

AND y2.fyr = d.fyr

AND y2.datafmt = d.datafmt

AND y2.datadate =  y2.datadate - interval '6 MON'--DATEADD ( mm, -6, y2.datadate )

AND y2.oancfy IS NOT NULL

JOIN co_ifntytd yf --cash flow footnotes 

ON yf.gvkey = d.gvkey

AND yf.datadate = d.datadate

AND yf.indfmt = d.indfmt

AND yf.consol = d.consol

AND yf.popsrc = d.popsrc

AND yf.fyr = d.fyr

AND yf.datafmt = d.datafmt

WHERE d.gvkey = vgvkey

AND d.popsrc = 'i'

AND d.datafmt = 'hist_std'

AND d.fqtr = 4 --4th quarter only

AND d.pdytd = 12 --12 month values only


UNION

--Second query adds in Q2 ytd as is:

SELECT y2.oancfy oancfsa

, curcdq

, d.gvkey

, d.datadate

, d.fyr

, d.datafmt

, d.scfq

, d.pdytd

, d.fqtr


FROM co_idesind d

JOIN co_ifndytd y2 --cash flow data from fqtr 2 

ON y2.gvkey = d.gvkey


AND y2.indfmt = d.indfmt

AND y2.consol = d.consol

AND y2.popsrc = d.popsrc

AND y2.fyr = d.fyr

AND y2.datafmt = d.datafmt

AND CAST(y2.datadate AS DATE) = CAST( d.datadate AS DATE)

AND y2.oancfy IS NOT NULL


JOIN co_ifntytd yf --cash flow footnotes 

ON yf.gvkey = d.gvkey


AND yf.datadate = d.datadate

AND yf.indfmt = d.indfmt

AND yf.consol = d.consol

AND yf.popsrc = d.popsrc

AND yf.fyr = d.fyr

AND yf.datafmt = d.datafmt



WHERE d.gvkey = vgvkey


AND d.popsrc = 'I'

AND d.datafmt = 'HIST_STD'

AND d.fqtr = 2 --4th quarter only

AND d.pdytd = 6 --12 month values only


ORDER BY datadate desc;

	
end $$;

select * from temp_table;
