/***********************************************************************************************
Returns GDRs

Packages Required:
Core
Core 2

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

This query finds Global Depository Receipts (GDS) by searching the Issue Description  item (DSCI) for GDR and returns all items in the the security data table

***********************************************************************************************/

SELECT *

FROM security

WHERE ( security.dsci 
        LIKE '%GDR%' )
