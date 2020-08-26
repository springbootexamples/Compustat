/***********************************************************************************************
Returns Primary EPS In Compustat

Packages Required:
Core
Core 2
Core History
Core Prelim Standardized

Universal Identifiers:
GVKEY

Primary Columns Used:
consol
datadate
datafmt
gvkey
indfmt
popsrc

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
20/08/2020

DatasetKey:
8

The following sample query returns the earnings and shares used to validate the Compustat values for Primary  EPS (EPSPX and EPSPI) and Fully Diluted (EPSFX and EPSFI) in Xpressfeed

***********************************************************************************************/

SELECT
        c.conml,
        ca.curcd,
        ca.gvkey,
        ca.datadate,
        ca.datafmt,
        caf1.IBADJ,
        caf1.CSHPRI,
        ROUND ( caf1.ibadj / caf1.cshpri , 2 ) AS EPSPXCalc,
        caf1.EPSPX, caf2.XIDO,
        ROUND ( ( caf1.IBADJ + caf2.XIDO ) / caf1.cshpri , 2 ) AS EPSPICalc,
        caf1.EPSPI, caf1.DILAVX, caf1.CSHFD,
        ROUND ( caf1.DILAVX / caf1.CSHFD , 2 ) AS EPSFXCalc,
        caf1.EPSFX,
        ROUND ( ( caf1.DILAVX + caf2.XIDO ) / CAF1.CSHFD , 2 ) AS EPSFICalc,
        caf1.EPSFI

FROM co_adesind ca
JOIN co_afnd1 caf1 ON ca.gvkey = caf1.gvkey
        AND ca.datadate = caf1.datadate
        AND ca.indfmt = caf1.indfmt
        AND ca.datafmt = caf1.datafmt
        AND ca.popsrc = caf1.popsrc
        AND ca.consol = caf1.consol
JOIN co_afnd2 caf2 ON ca.gvkey = caf2.gvkey
        AND ca.datadate = caf2.datadate
        AND ca.indfmt = caf2.indfmt
        AND ca.datafmt = caf2.datafmt
        AND ca.popsrc = caf2.popsrc
        AND ca.consol = caf2.consol
JOIN company c ON c.gvkey = ca.gvkey

WHERE 1 = 1
        AND ca.popsrc = 'D'
        AND ca.datadate = '12/31/2015'
        AND ca.datafmt = 'STD'
        AND ca.gvkey IN ( '006066', '019528', '007435', '001906' )

ORDER BY caf2.mib DESC