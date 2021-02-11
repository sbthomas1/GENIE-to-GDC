# GENIE-to-GDC
Source code, diagrams, and documentation for the process used to harmonize Oncotree cancer diagnoses to ICD-O-3 for AACR's GENIE submission to NCI's GDC.  Article that details this work can be found here: https://ascopubs.org/doi/full/10.1200/CCI.20.00037

# Database object creation scripts
Database scripts use @ to delimit statements.

Scripts load all objects to schema named "GDC"

Run scripts in the following order:
1. GENIE-to-GDC/Scripts/DatabaseScript_01_Create.sql
2. GENIE-to-GDC/Scripts/DatabaseScript_02_InsertEAV.sql

To view a pivoted table of all mappings, query GDC.All_Mappings_V

# Overview of using LEAP
1. Add the entity types, entities, attributes, and pairs for one classification system into the STAGING_LOAD_FACT table (ensure table is empty before loading).
2. Run the FactEAVInsert procedure, which will load the information from the staging table into the dimension/fact tables.
3. Truncate STAGING_LOAD_FACT to remove the information from Step 1.
4. Add the entity types, entities, attributes, and pairs for the second classification system into the STAGING_LOAD_FACT table 
5. Run the FactEAVInsert procedure again to load the second classification system from the staging table into the dimension/fact tables.
6. To link classifications, add the EntityType and Entity data from the second system as Attribute and Pair data (respectively) for the corresponding EntityType and Entity from the first system.  You can use the STAGING_LOAD_FACT table again.
7. Run FactEAVInsert procedure for these to be added to the dimension/fact tables as links.

## Example
1. Load to STAGING_LOAD_FACT --> EntityType: oncotree_2017_06_21; Entity: AODG; Attribute: OTTT_NAME; Pair: Anaplastic Oligodendroglioma
2. Run FactEAVInsert procedure
3. Truncate STAGING_LOAD_FACT
4. Load to STAGING_LOAD_FACT --> EntityType: GDC_morphology; Entity:9451/3; Attribute: GDC_primary_diagnosis; Pair: Oligodendroglioma, anaplastic
5. Run FactEAVInsert procedure
6. Truncate STAGING_LOAD_FACT then load to STAGING_LOAD_FACT --> EntityType: oncotree_2017_06_21; Entity: AODG; Attribute:GDC_morphology; Pair:9451/3
7. Run FactEAVInsert procedure

After doing these steps, the AODG Entity for oncotree_2017_06_21 will have two attributes: 
  1. OTTT_Name (Anaplastic Oligodendroglioma)
  2. GDC_morphology (9451/3) </br>
     a.  This attribute can be connected to: </br>
         (1). Entity 9451/3 (with EntityType GDC_morphology), which has the attribute: </br>
              (a).  GDC_primary_diagnosis (Oligodendroglioma, anaplastic)
