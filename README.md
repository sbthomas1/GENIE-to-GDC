# GENIE-to-GDC
Source code, diagrams, and documentation for the process used to harmonize Oncotree cancer diagnoses to ICD-O-3 for AACR's GENIE submission to NCI's GDC

# Database object creation scripts
Database scripts use @ to delimit statements.

Scripts load all objects to schema named "GDC"

Run scripts in the following order:
1. GENIE-to-GDC/Scripts/DatabaseScript_01_Create.sql
2. GENIE-to-GDC/Scripts/DatabaseScript_02_InsertEntities.sql
3. GENIE-to-GDC/Scripts/DatabaseScript_03_InsertPairs.sql

To view a pivoted table of all mappings, query GDC.All_Mappings_V
