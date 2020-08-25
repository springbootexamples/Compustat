/***********************************************************************************************
Returns Count Of Data Item Availability

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
24/08/2020

DatasetKey:
8

This query counts the number of occurrences of specific data items for Domestic (POPSRC = D)  and International (POPSRC + I)companies in each Industry Format (INDFMT) in the Compustat database in Xpressfeed

***********************************************************************************************/

SELECT popsrc

, indfmt

, SUM ( che ) AS che

, SUM ( ch ) AS ch

, SUM ( ivst ) AS ivst

FROM

( SELECT popsrc

, indfmt, ( CASE WHEN 'che' IS NOT NULL THEN 1 ELSE 0 END ) AS che, 
( CASE WHEN 'ch' IS NOT NULL THEN 1 ELSE 0 END ) AS ch, 
( CASE WHEN 'ivst' IS NOT NULL THEN 1 ELSE 0 END ) AS ivst

FROM co_afnd1 ) p


GROUP BY indfmt, popsrc
ORDER BY indfmt, popsrc
