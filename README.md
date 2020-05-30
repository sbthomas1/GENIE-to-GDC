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

# Overview of using LEAP
1. Add all information for one classification system into the STAGING_LOAD_FACT table (ensure table is empty before loading).
2. Run the FactEAVInsert procedure, which will load the information from the staging table into the dimension/fact tables.
3. Truncate STAGING_LOAD_FACT to remove the information from Step 1.
4. Add all information for the second classification system into the STAGING_LOAD_FACT table 
5. Run the FactEAVInsert procedure again to load the second classification system from the staging table into the dimension/fact tables.
6. To link classifications, add the EntityType and Entity data from the second system as Attribute and Pair data (respectively) for the corresponding EntityType and Entity from the first system.  You can use the STAGING_LOAD_FACT table / FactEAVInsert procedure combination for these to be added to the dimension/fact tables as links.

##Example
1. EntityType: oncotree_2017_06_21; Entity: AODG; Attribute: OTTT_NAME; Pair: Anaplastic Oligodendroglioma
2. EntityType: GDC_morphology; Entity:9451/3; Attribute: GDC_primary_diagnosis; Pair: Oligodendroglioma, anaplastic
3. EntityType: oncotree_2017_06_21; Entity: AODG; Attribute:GDC_morphology; Pair:9451/3
