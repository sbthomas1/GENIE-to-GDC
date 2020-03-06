/************************************************/
/*               Tables                                           */
/************************************************/
--------------------------------------------------
-- Create Table GDC.DB_Errors
--------------------------------------------------
--drop table GDC.DB_Errors@
Create table GDC.DB_Errors (
    ErrorID                        int                            identity,
    UserName                       VARCHAR(100)                   null,
    ErrorNumber                    int                            null,
    ErrorState                     int                            null,
    ErrorSeverity                  int                            null,
    ErrorLine                      int                            null,
    ErrorProcedure                 VARCHAR(max)                   null,
    ErrorMessage                   VARCHAR(max)                   null,
    ErrorDateTime                  datetime                       null) 
on [PRIMARY] @

--------------------------------------------------
-- Create Table GDC.DimAttribute
--------------------------------------------------
--drop table GDC.DimAttribute@
Create table GDC.DimAttribute (
    daiAttributeId                 int                            identity,
    daiCode                        VARCHAR(255)                   null,
    daiCreatedBy                   VARCHAR(128)  Default user_name()    null,
    daiCreatedDt                   datetime  Default getdate()    null,
    daiModifiedBy                  VARCHAR(128)  Default user_name()    null,
    daiModifiedDt                  datetime  Default getdate()    null)  @

--------------------------------------------------
-- Create Table GDC.DimAttribute_History
--------------------------------------------------
--drop table GDC.DimAttribute_History@
Create table GDC.DimAttribute_History (
    daihAttributeId                int                            not null,
    daihCode                       VARCHAR(255)                   not null,
    daihCreatedBy                  VARCHAR(128)  Default user_name()    null,
    daihCreatedDt                  datetime  Default getdate()    null,
    daihModifiedBy                 VARCHAR(128)  Default user_name()    null,
    daihModifiedDt                 datetime  Default getdate()    null,
    daihUpdatedBy                  VARCHAR(128)  Default user_name()    null,
    daihUpdatedDt                  datetime  Default getdate()    null,
    daihAction                     CHAR(1)                        not null) 
on [PRIMARY] @

--------------------------------------------------
-- Create Table GDC.DimEntity
--------------------------------------------------
--drop table GDC.DimEntity@
Create table GDC.DimEntity (
    deiEntityId                    int                            identity,
    deiCode                        VARCHAR(255)                   null,
    deiEntityTypeId                int                            null,
    deiCreatedBy                   VARCHAR(128)  Default user_name()    null,
    deiCreatedDt                   datetime  Default getdate()    null,
    deiModifiedBy                  VARCHAR(128)  Default user_name()    null,
    deiModifiedDt                  datetime  Default getdate()    null)  @

--------------------------------------------------
-- Create Table GDC.DimEntity_History
--------------------------------------------------
--drop table GDC.DimEntity_History@
Create table GDC.DimEntity_History (
    deihEntityId                   int                            not null,
    deihCode                       VARCHAR(255)                   null,
    deihEntityTypeId               int                            null,
    deihCreatedBy                  VARCHAR(128)  Default user_name()    null,
    deihCreatedDt                  datetime  Default getdate()    null,
    deihModifiedBy                 VARCHAR(128)  Default user_name()    null,
    deihModifiedDt                 datetime  Default getdate()    null,
    deihUpdatedBy                  VARCHAR(128)  Default user_name()    null,
    deihUpdatedDt                  datetime  Default getdate()    null,
    deihAction                     CHAR(1)                        not null) 
on [PRIMARY] @

--------------------------------------------------
-- Create Table GDC.DimEntityType
--------------------------------------------------
--drop table GDC.DimEntityType@
Create table GDC.DimEntityType (
    detEntityTypeId                int                            identity,
    detCode                        VARCHAR(255)                   not null,
    detCreatedBy                   VARCHAR(128)  Default user_name()    null,
    detCreatedDt                   datetime  Default getdate()    null,
    detModifiedBy                  VARCHAR(128)  Default user_name()    null,
    detModifiedDt                  datetime  Default getdate()    null)  @

--------------------------------------------------
-- Create Table GDC.DimEntityType_History
--------------------------------------------------
--drop table GDC.DimEntityType_History@
Create table GDC.DimEntityType_History (
    dethEntityTypeId               int                            not null,
    dethCode                       VARCHAR(255)                   not null,
    dethCreatedBy                  VARCHAR(128)  Default user_name()    null,
    dethCreatedDt                  datetime  Default getdate()    null,
    dethModifiedBy                 VARCHAR(128)  Default user_name()    null,
    dethModifiedDt                 datetime  Default getdate()    null,
    dethUpdatedBy                  VARCHAR(128)  Default user_name()    null,
    dethUpdatedDt                  datetime  Default getdate()    null,
    dethAction                     CHAR(1)                        not null) 
on [PRIMARY] @

--------------------------------------------------
-- Create Table GDC.DimPair
--------------------------------------------------
--drop table GDC.DimPair@
Create table GDC.DimPair (
    dpiPairId                      int                            identity,
    dpiCode                        VARCHAR(3000)                  null,
    dpiAttributeId                 int                            null,
    dpiCreatedBy                   VARCHAR(128)  Default user_name()    null,
    dpiCreatedDt                   datetime  Default getdate()    null,
    dpiModifiedBy                  VARCHAR(128)  Default user_name()    null,
    dpiModifiedDt                  datetime  Default getdate()    null)  @

--------------------------------------------------
-- Create Table GDC.DimPair_History
--------------------------------------------------
--drop table GDC.DimPair_History@
Create table GDC.DimPair_History (
    dpihPairId                     int                            not null,
    dpihCode                       VARCHAR(3000)                  null,
    dpihAttributeId                int                            null,
    dpihCreatedBy                  VARCHAR(128)  Default user_name()    null,
    dpihCreatedDt                  datetime  Default getdate()    null,
    dpihModifiedBy                 VARCHAR(128)  Default user_name()    null,
    dpihModifiedDt                 datetime  Default getdate()    null,
    dpihUpdatedBy                  VARCHAR(128)  Default user_name()    null,
    dpihUpdatedDt                  datetime  Default getdate()    null,
    dpihAction                     CHAR(1)                        not null) 
on [PRIMARY] @

--------------------------------------------------
-- Create Table GDC.FactEAV
--------------------------------------------------
--drop table GDC.FactEAV@
Create table GDC.FactEAV (
    dviPairId                      int                            not null,
    dviEntityId                    int                            not null,
    dviCreatedBy                   VARCHAR(128)  Default user_name()    null,
    dviCreatedDt                   datetime  Default getdate()    null,
    dviModifiedBy                  VARCHAR(128)  Default user_name()    null,
    dviModifiedDt                  datetime  Default getdate()    null)  @

--------------------------------------------------
-- Create Table GDC.FactEAV_History
--------------------------------------------------
--drop table GDC.FactEAV_History@
Create table GDC.FactEAV_History (
    dvihPairId                     int                            not null,
    dvihEntityId                   int                            not null,
    dvihCreatedBy                  VARCHAR(128)  Default user_name()    null,
    dvihCreatedDt                  datetime  Default getdate()    null,
    dvihModifiedBy                 VARCHAR(128)  Default user_name()    null,
    dvihModifiedDt                 datetime  Default getdate()    null,
    dvihUpdatedBy                  VARCHAR(128)  Default user_name()    null,
    dvihUpdatedDt                  datetime  Default getdate()    null,
    dvihAction                     CHAR(1)                        not null) 
on [PRIMARY] @

--------------------------------------------------
-- Create Table GDC.STAGING_LOAD_FACT
--------------------------------------------------
--drop table GDC.STAGING_LOAD_FACT@
Create table GDC.STAGING_LOAD_FACT (
    EntityCode                     VARCHAR(255)                   null,
    EntityTypeCode                 VARCHAR(255)                   null,
    paircode                       VARCHAR(3000)                  null,
    AttributeCode                  VARCHAR(255)                   null) 
on [PRIMARY] @

/************************************************/
/*               Views                          */
/************************************************/

----------------------------------------------------------
-- Create View GDC.All_Mappings_V
-----------------------------------------------------------
--drop view GDC.All_Mappings_V@
CREATE VIEW GDC.All_Mappings_V AS

with prep as (
SELECT   OncotreeCode,
         OncotreeVersion,
         topography,
         morphology,
         tumor_grade,
         daiCode as AttributeCode,
         dpiCode as PairCode
FROM     GDC.SynapseMapping 
         left join gdc.dimentitytype detOnc on OncotreeVersion = detOnc.detCode 
         left join gdc.dimentity deiOnc on detOnc.detEntityTypeId = deiOnc.deiEntityTypeId and OncotreeCode = deiCode 
         left join gdc.facteav factOnc on deiOnc.deientityid = factOnc.dvientityid 
         left join gdc.dimpair dpiOnc on factOnc.dvipairid = dpiOnc.dpipairid 
         right join gdc.dimattribute daiOnc on daiOnc.daiattributeid = dpiOnc.dpiattributeid and daiOnc.daiCode in ('OTTT_NAME', 'OTTT_TISSUE','OTTT_MAINTYPENAME','MRCONSO_CUI')
UNION ALL
SELECT   OncotreeCode,
         OncotreeVersion,
         topography,
         morphology,
         tumor_grade,
         daiCode as AttributeCode,
         dpiCode as PairCode
FROM     GDC.SynapseMapping 
         left join gdc.dimentitytype detTop on detTop.detCode = 'GDC_topography' 
         left join gdc.dimentity deiTop on detTop.detEntityTypeId = deiTop.deiEntityTypeId and topography = deiCode 
         left join gdc.facteav factTop on deiTop.deientityid = factTop.dvientityid 
         left join gdc.dimpair dpiTop on factTop.dvipairid = dpiTop.dpipairid 
         right join gdc.dimattribute daiTop on daiTop.daiattributeid = dpiTop.dpiattributeid and daiTop.daiCode in ('GDC_primary_site', 'GDC_tissue_or_organ_of_origin')
UNION ALL
SELECT   OncotreeCode,
         OncotreeVersion,
         topography,
         morphology,
         tumor_grade,
         daiCode as AttributeCode,
         dpiCode as PairCode
FROM     GDC.SynapseMapping 
         left join gdc.dimentitytype detMorph on detMorph.detCode = 'GDC_morphology' 
         left join gdc.dimentity deiMorph on detMorph.detEntityTypeId = deiMorph.deiEntityTypeId and morphology = deiCode 
         left join gdc.facteav factMorph on deiMorph.deientityid = factMorph.dvientityid 
         left join gdc.dimpair dpiMorph on factMorph.dvipairid = dpiMorph.dpipairid 
         right join gdc.dimattribute daiMorph on daiMorph.daiattributeid = dpiMorph.dpiattributeid and daiMorph.daiCode in ('GDC_primary_diagnosis', 'GDC_morph_prefix')
)



, final as (
select OncotreeCode, OncotreeVersion, topography, morphology, tumor_grade, AttributeCode, PairCode 
from prep
union all
select prep.OncotreeCode, prep.OncotreeVersion, prep.topography, prep.morphology, prep.tumor_grade, daiDis.daiCode as AttributeCode, dpiDis.dpiCode as PairCode
from prep
left join gdc.dimentitytype detDis on detDis.detCode = 'GDC_morph_prefix'
left join gdc.dimentity deiDis on detDis.detEntityTypeId = deiDis.deiEntityTypeId and paircode = deiCode
left join gdc.facteav factDis on deiDis.deientityid = factDis.dvientityid
left join gdc.dimpair dpiDis on factDis.dvipairid = dpiDis.dpipairid
right join gdc.dimattribute daiDis on daiDis.daiattributeid = dpiDis.dpiattributeid and daiDis.daiCode = 'GDC_disease_type'
where prep.attributecode = 'GDC_morph_prefix'
and prep.OncotreeCode is not null
union all
select OncotreeCode, OncotreeVersion, topography, morphology, tumor_grade, AttributeCode, PairCode from (
select prep.OncotreeCode, prep.OncotreeVersion, prep.topography, prep.morphology, prep.tumor_grade, 'UMLS_Name' as AttributeCode, c1.MRCONSO_STR as PairCode
, rank() over (partition by c1.mrconso_cui order by mrrank_rank desc, c1.mrconso_ts asc) rk
from prep
inner join dbo.umls_mrconso c1 on paircode = c1.mrconso_cui
inner join dbo.umls_mrrank on c1.mrconso_Sab = MRRANK_SAB and c1.mrconso_tty = MRRANK_TTY and c1.mrconso_suppress = MRRANK_SUPPRESS
where attributecode = 'MRCONSO_CUI'
) t1
where rk = 1

)

SELECT OncotreeVersion, OncotreeCode, OTTT_NAME, OTTT_TISSUE, OTTT_MAINTYPENAME,  UMLS_Name, topography as GDC_topography, morphology as GDC_morphology, tumor_grade as GDC_tumor_grade, GDC_primary_diagnosis, GDC_primary_site, GDC_tissue_or_organ_of_origin, GDC_disease_type 
FROM (SELECT OncotreeCode, OncotreeVersion, topography, morphology, tumor_grade, 
paircode as value,
attributecode as columnname
FROM final
where OncotreeCode is not null
) d
 pivot (max(value) for columnname in (OTTT_TISSUE, OTTT_MAINTYPENAME, OTTT_NAME, UMLS_Name, GDC_primary_diagnosis, GDC_primary_site, GDC_tissue_or_organ_of_origin, GDC_disease_type)) piv
where ottt_name is not null@


----------------------------------------------------------
-- Create View GDC.EntitiesAsAttributes_V
-----------------------------------------------------------

--drop view GDC.EntitiesAsAttributes_V@
CREATE VIEW GDC.EntitiesAsAttributes_V 
AS 
  SELECT detent.detentitytypeid AS entitytypeid_ent,
         detent.detcode         AS entitytypecode_ent,
         deient.deientityid     AS entityid_ent,
         deient.deicode         AS entitycode_ent,
         daient.daiattributeid  AS attributeid_ent,
         daient.daicode         AS attributecode_ent,
         dpient.dpipairid       AS pairid_ent,
         dpient.dpicode         AS paircode_ent,
         detatt.detentitytypeid AS entitytypeid_att,
         detatt.detcode         AS entitytypecode_att,
         deiatt.deientityid     AS entityid_att,
         deiatt.deicode         AS entitycode_att,
         daiatt.daiattributeid  AS attributeid_att,
         daiatt.daicode         AS attributecode_att,
         dpiatt.dpipairid       AS pairid_att,
         dpiatt.dpicode         AS paircode_att
  FROM  
    GDC.facteav fent
    INNER JOIN GDC.dimpair dpient
    ON fent.dvipairid = dpient.dpipairid
    INNER JOIN GDC.dimentity deient
    ON fent.dvientityid = deient.deientityid
    INNER JOIN GDC.dimentitytype detent
    ON deient.deientitytypeid = detent.detentitytypeid
    INNER JOIN GDC.dimattribute daient
    ON dpient.dpiattributeid = daient.daiattributeid
    INNER JOIN GDC.dimentitytype detatt
    ON daient.daicode = detatt.detcode
    INNER JOIN GDC.dimentity deiatt
    ON detatt.detentitytypeid = deiatt.deientitytypeid AND dpient.dpicode = deiatt.deicode
    INNER JOIN GDC.facteav fatt
    ON deiatt.deientityid = fatt.dvientityid
    INNER JOIN GDC.dimpair dpiatt
    ON fatt.dvipairid = dpiatt.dpipairid
    INNER JOIN GDC.dimattribute daiatt
    ON dpiatt.dpiattributeid = daiatt.daiattributeid@

--------------------------------------------------
-- Create View GDC.EntityAndType_V
--------------------------------------------------
--drop view GDC.EntityAndType_V@
CREATE VIEW GDC.EntityAndType_V as 
SELECT   e1.deiEntityId as EntityId,
         e1.deiCode as EntityCode,
         et1.detEntityTypeId as EntityTypeId,
         et1.detCode as EntityTypeCode
FROM    GDC.dimentity e1 
         inner join GDC.dimentitytype et1 on e1.deiEntityTypeId = et1.detEntityTypeId@

--------------------------------------------------
-- Create View GDC.EntityTypePairAttribute_V
--------------------------------------------------
--drop view GDC.EntityTypePairAttribute_V@
CREATE VIEW GDC.EntityTypePairAttribute_V as 

select  detentitytypeid as EntityTypeId,
 detCode as EntityTypeCode,
 deientityid as EntityId,
 deiCode as EntityCode,
 daiattributeid as AttributeId,
 daicode as AttributeCode,
dpipairid as PairId,
 dpiCode as PairCode

from GDC.facteav
inner join GDC.dimpair on dvipairid = dpipairid
inner join GDC.dimentity on dvientityid = deientityid 
inner join GDC.dimentitytype on deientitytypeid = detentitytypeid
inner join GDC.dimattribute on dpiattributeid = daiattributeid@

/************************************************/
/*               Indexes                        */
/************************************************/
--------------------------------------------------
-- Create Index IDX_dpiCode
--------------------------------------------------
--Drop Index GDC.DimPair.IDX_dpiCode@
create Unique Index IDX_dpiCode
	on GDC.DimPair
	(dpiCode, dpiAttributeId)  
	On [PRIMARY]@

--------------------------------------------------
-- Create Index IDX_daiCode
--------------------------------------------------
--Drop Index GDC.DimAttribute.IDX_daiCode@
create Unique Index IDX_daiCode
	on GDC.DimAttribute
	(daiCode)  
	On [PRIMARY]@

--------------------------------------------------
-- Create Index IDX_deiEntityCodeEntityTypeId
--------------------------------------------------
--Drop Index GDC.DimEntity.IDX_deiEntityCodeEntityTypeId@
create Index IDX_deiEntityCodeEntityTypeId
	on GDC.DimEntity
	(deiCode, deiEntityTypeId)  
	On [PRIMARY]@

--------------------------------------------------
-- Create Index IDX_detCode
--------------------------------------------------
--Drop Index GDC.DimEntityType.IDX_detCode@
create Unique Index IDX_detCode
	on GDC.DimEntityType
	(detCode)  
	On [PRIMARY]@

/************************************************/
/*               Constraints                    */
/************************************************/


--------------------------------------------------
-- Create Primary Key PK_DimAttribute
--------------------------------------------------
--alter table GDC.DimAttribute drop constraint PK_DimAttribute@
alter table GDC.DimAttribute 
	add constraint PK_DimAttribute 
	primary key (daiAttributeId)@

--------------------------------------------------
-- Create Primary Key PK_DimEntity
--------------------------------------------------
--alter table GDC.DimEntity drop constraint PK_DimEntity@
alter table GDC.DimEntity 
	add constraint PK_DimEntity 
	primary key (deiEntityId)@

--------------------------------------------------
-- Create Primary Key PK_DimEntityType
--------------------------------------------------
--alter table GDC.DimEntityType drop constraint PK_DimEntityType@
alter table GDC.DimEntityType 
	add constraint PK_DimEntityType 
	primary key (detEntityTypeId)@

--------------------------------------------------
-- Create Primary Key PK_DimPair
--------------------------------------------------
--alter table GDC.DimPair drop constraint PK_DimPair@
alter table GDC.DimPair 
	add constraint PK_DimPair 
	primary key (dpiPairId)@

--------------------------------------------------
-- Create Primary Key PK_FactEAV
--------------------------------------------------
--alter table GDC.FactEAV drop constraint PK_FactEAV@
alter table GDC.FactEAV 
	add constraint PK_FactEAV 
	primary key (dviPairId, dviEntityId)@

--------------------------------------------------
-- Create Foreign Key FK_deiEntityTypeId
--------------------------------------------------
--alter table GDC.DimEntity drop constraint FK_deiEntityTypeId@
alter table GDC.DimEntity 
	add constraint FK_deiEntityTypeId 
	foreign key (deiEntityTypeId) 
	references GDC.DimEntityType (detEntityTypeId) 
	On Delete No Action
	On Update No Action@

--------------------------------------------------
-- Create Foreign Key FK_dpiAttributeId
--------------------------------------------------
--alter table GDC.DimPair drop constraint FK_dpiAttributeId@
alter table GDC.DimPair 
	add constraint FK_dpiAttributeId 
	foreign key (dpiAttributeId) 
	references GDC.DimAttribute (daiAttributeId) 
	On Delete No Action
	On Update No Action@

--------------------------------------------------
-- Create Foreign Key FK_dviEntityId
--------------------------------------------------
--alter table GDC.FactEAV drop constraint FK_dviEntityId@
alter table GDC.FactEAV 
	add constraint FK_dviEntityId 
	foreign key (dviEntityId) 
	references GDC.DimEntity (deiEntityId) 
	On Delete No Action
	On Update No Action@

--------------------------------------------------
-- Create Foreign Key FK_dviPairId
--------------------------------------------------
--alter table GDC.FactEAV drop constraint FK_dviPairId@
alter table GDC.FactEAV 
	add constraint FK_dviPairId 
	foreign key (dviPairId) 
	references GDC.DimPair (dpiPairId) 
	On Delete No Action
	On Update No Action@




/************************************************/
/*               Triggers                       */
/************************************************/

--------------------------------------------------
-- Create Trigger GDC.DimAttribute_trigger
--------------------------------------------------
create trigger GDC.DimAttribute_trigger
on GDC.DimAttribute
after UPDATE, INSERT, DELETE
as

if exists(SELECT * from inserted) and exists (SELECT * from deleted)
begin
    INSERT INTO GDC.DimAttribute_History(daihAttributeId, daihCode,  daihCreatedBy, daihCreatedDt, daihModifiedBy, daihModifiedDt, daihUpdatedBy, daihUpdatedDt, daihAction)
            select daiAttributeId, daiCode,  daiCreatedBy, daiCreatedDt, daiModifiedBy, daiModifiedDt, 
					user_name(), 
					getdate(), 
					'U'
            FROM inserted;
end

If exists (Select * from inserted) and not exists(Select * from deleted)
begin
    INSERT INTO GDC.DimAttribute_History(daihAttributeId, daihCode,  daihCreatedBy, daihCreatedDt, daihModifiedBy, daihModifiedDt, daihUpdatedBy, daihUpdatedDt, daihAction)
            select daiAttributeId, daiCode,  daiCreatedBy, daiCreatedDt, daiModifiedBy, daiModifiedDt,
					user_name(), 
					getdate(), 
					'I'
            FROM inserted;
end

If exists(select * from deleted) and not exists(Select * from inserted)
begin 

INSERT INTO GDC.DimAttribute_History(daihAttributeId, daihCode, daihCreatedBy, daihCreatedDt, daihModifiedBy, daihModifiedDt, daihUpdatedBy, daihUpdatedDt, daihAction)
            select daiAttributeId, daiCode, daiCreatedBy, daiCreatedDt, daiModifiedBy, daiModifiedDt,
					user_name(), 
					getdate(), 
					'D'
            FROM deleted;
end;@

--------------------------------------------------
-- Create Trigger GDC.DimEntity_trigger
--------------------------------------------------
create trigger GDC.DimEntity_trigger
on GDC.DimEntity
after UPDATE, INSERT, DELETE
as

if exists(SELECT * from inserted) and exists (SELECT * from deleted)
begin
    INSERT INTO GDC.DimEntity_History(deihEntityId, deihCode, deihEntityTypeId, deihCreatedBy, deihCreatedDt, deihModifiedBy, deihModifiedDt, deihUpdatedBy, deihUpdatedDt, deihAction)
            select deiEntityId, deiCode, deiEntityTypeId, deiCreatedBy, deiCreatedDt, deiModifiedBy, deiModifiedDt ,
					user_name(), 
					getdate(), 
					'U'
            FROM inserted;
end

If exists (Select * from inserted) and not exists(Select * from deleted)
begin
    INSERT INTO GDC.DimEntity_History(deihEntityId, deihCode, deihEntityTypeId, deihCreatedBy, deihCreatedDt, deihModifiedBy, deihModifiedDt, deihUpdatedBy, deihUpdatedDt, deihAction)
            select deiEntityId, deiCode, deiEntityTypeId, deiCreatedBy, deiCreatedDt, deiModifiedBy, deiModifiedDt ,
					user_name(), 
					getdate(), 
					'I'
            FROM inserted;
end

If exists(select * from deleted) and not exists(Select * from inserted)
begin 

INSERT INTO GDC.DimEntity_History(deihEntityId, deihCode, deihEntityTypeId, deihCreatedBy, deihCreatedDt, deihModifiedBy, deihModifiedDt, deihUpdatedBy, deihUpdatedDt, deihAction)
            select deiEntityId, deiCode, deiEntityTypeId, deiCreatedBy, deiCreatedDt, deiModifiedBy, deiModifiedDt ,
					user_name(), 
					getdate(), 
					'D'
            FROM deleted;
end@

--------------------------------------------------
-- Create Trigger GDC.DimEntityType_trigger
--------------------------------------------------
create trigger GDC.DimEntityType_trigger
on GDC.DimEntityType
after UPDATE, INSERT, DELETE
as

if exists(SELECT * from inserted) and exists (SELECT * from deleted)
begin
    INSERT INTO GDC.DimEntityType_History(dethEntityTypeId, dethCode, dethCreatedBy, dethCreatedDt, dethModifiedBy, dethModifiedDt, dethUpdatedBy, dethUpdatedDt, dethAction)
            select detEntityTypeId, detCode, detCreatedBy, detCreatedDt, detModifiedBy, detModifiedDt, 
					user_name(), 
					getdate(), 
					'U'
            FROM inserted;
end

If exists (Select * from inserted) and not exists(Select * from deleted)
begin
    INSERT INTO GDC.DimEntityType_History(dethEntityTypeId, dethCode, dethCreatedBy, dethCreatedDt, dethModifiedBy, dethModifiedDt, dethUpdatedBy, dethUpdatedDt, dethAction)
            select detEntityTypeId, detCode, detCreatedBy, detCreatedDt, detModifiedBy, detModifiedDt,
					user_name(), 
					getdate(), 
					'I'
            FROM inserted;
end

If exists(select * from deleted) and not exists(Select * from inserted)
begin 

INSERT INTO GDC.DimEntityType_History(dethEntityTypeId, dethCode, dethCreatedBy, dethCreatedDt, dethModifiedBy, dethModifiedDt, dethUpdatedBy, dethUpdatedDt, dethAction)
            select detEntityTypeId, detCode, detCreatedBy, detCreatedDt, detModifiedBy, detModifiedDt,
					user_name(), 
					getdate(), 
					'D'
            FROM deleted;
end@

--------------------------------------------------
-- Create Trigger GDC.DimPair_trigger
--------------------------------------------------
create trigger GDC.DimPair_trigger
on GDC.DimPair
after UPDATE, INSERT, DELETE
as

if exists(SELECT * from inserted) and exists (SELECT * from deleted)
begin
    INSERT INTO GDC.DimPair_History(dpihPairId, dpihCode, dpihAttributeId, dpihCreatedBy, dpihCreatedDt, dpihModifiedBy, dpihModifiedDt, dpihUpdatedBy, dpihUpdatedDt, dpihAction)
            select dpiPairId, dpiCode, dpiAttributeId, dpiCreatedBy, dpiCreatedDt, dpiModifiedBy, dpiModifiedDt, 
					user_name(), 
					getdate(), 
					'U'
            FROM inserted;
end

If exists (Select * from inserted) and not exists(Select * from deleted)
begin
    INSERT INTO GDC.DimPair_History(dpihPairId, dpihCode, dpihAttributeId, dpihCreatedBy, dpihCreatedDt, dpihModifiedBy, dpihModifiedDt, dpihUpdatedBy, dpihUpdatedDt, dpihAction)
            select dpiPairId, dpiCode, dpiAttributeId, dpiCreatedBy, dpiCreatedDt, dpiModifiedBy, dpiModifiedDt,
					user_name(), 
					getdate(), 
					'I'
            FROM inserted;
end

If exists(select * from deleted) and not exists(Select * from inserted)
begin 

    INSERT INTO GDC.DimPair_History(dpihPairId, dpihCode, dpihAttributeId, dpihCreatedBy, dpihCreatedDt, dpihModifiedBy, dpihModifiedDt, dpihUpdatedBy, dpihUpdatedDt, dpihAction)
            select dpiPairId, dpiCode, dpiAttributeId, dpiCreatedBy, dpiCreatedDt, dpiModifiedBy, dpiModifiedDt,
					user_name(), 
					getdate(), 
					'D'
            FROM deleted;
end;@

--------------------------------------------------
-- Create Trigger GDC.FactEAV_trigger
--------------------------------------------------
create trigger GDC.FactEAV_trigger
on GDC.FactEAV
after UPDATE, INSERT, DELETE
as

if exists(SELECT * from inserted) and exists (SELECT * from deleted)
begin
    INSERT INTO GDC.FactEAV_History(dvihPairId, dvihEntityId, dvihCreatedBy, dvihCreatedDt, dvihModifiedBy, dvihModifiedDt, dvihUpdatedBy, dvihUpdatedDt, dvihAction)
            select dviPairId,  dviEntityId, dviCreatedBy, dviCreatedDt, dviModifiedBy, dviModifiedDt , 
					user_name(), 
					getdate(), 
					'U'
            FROM inserted;
end

If exists (Select * from inserted) and not exists(Select * from deleted)
begin
    INSERT INTO GDC.FactEAV_History(dvihPairId,  dvihEntityId, dvihCreatedBy, dvihCreatedDt, dvihModifiedBy, dvihModifiedDt, dvihUpdatedBy, dvihUpdatedDt, dvihAction)
            select dviPairId, dviEntityId, dviCreatedBy, dviCreatedDt, dviModifiedBy, dviModifiedDt ,
					user_name(), 
					getdate(), 
					'I'
            FROM inserted;
end

If exists(select * from deleted) and not exists(Select * from inserted)
begin 

    INSERT INTO GDC.FactEAV_History(dvihPairId,  dvihEntityId, dvihCreatedBy, dvihCreatedDt, dvihModifiedBy, dvihModifiedDt, dvihUpdatedBy, dvihUpdatedDt, dvihAction)
            select dviPairId,  dviEntityId, dviCreatedBy, dviCreatedDt, dviModifiedBy, dviModifiedDt ,
					user_name(), 
					getdate(), 
					'D'
            FROM deleted;
end;@

/************************************************/
/*               Procedures                     */
/************************************************/

--------------------------------------------------
-- Create Procedure GDC.dimAttributeInsert
--------------------------------------------------
--drop procedure GDC.dimAttributeInsert@
CREATE 
 PROCEDURE [GDC].[dimAttributeInsert]


AS BEGIN
SET NOCOUNT ON 


	BEGIN TRY
	 BEGIN
      BEGIN TRANSACTION
		INSERT INTO GDC.dimAttribute(daiCode)
		SELECT   Distinct  AttributeCode
		FROM     GDC.staging_load_Fact   
        LEFT JOIN GDC.dimAttribute on AttributeCode = daiCode
		WHERE    daiCode is null
      COMMIT TRANSACTION
	  

	  END
    END TRY

		BEGIN CATCH
		INSERT INTO GDC.DB_Errors
		VALUES
	(SUSER_SNAME(),
	 ERROR_NUMBER(),
	 ERROR_STATE(),
	 ERROR_SEVERITY(),
	 ERROR_LINE(),
	 ERROR_PROCEDURE(),
	 ERROR_MESSAGE(),
	 GETDATE());
	END CATCH


	END@

--------------------------------------------------
-- Create Procedure GDC.dimEntityInsert
--------------------------------------------------
--drop procedure GDC.dimEntityInsert@
CREATE 
 PROCEDURE [GDC].[dimEntityInsert]


AS BEGIN
SET NOCOUNT ON 


	BEGIN TRY
	 BEGIN
      BEGIN TRANSACTION
		INSERT INTO GDC.dimEntity(deiCode, deiEntityTypeId)
		SELECT   Distinct  EntityCode, detEntityTypeId
		FROM     GDC.staging_load_Fact   
        INNER JOIN GDC.dimEntityType on EntityTypeCode = detCode
        LEFT JOIN GDC.dimentity on entitycode = deiCode and detEntityTypeId = deiEntityTypeId
		WHERE    deiEntityTypeId is null	
      COMMIT TRANSACTION
	  

	  END
    END TRY

		BEGIN CATCH
		INSERT INTO GDC.DB_Errors
		VALUES
	(SUSER_SNAME(),
	 ERROR_NUMBER(),
	 ERROR_STATE(),
	 ERROR_SEVERITY(),
	 ERROR_LINE(),
	 ERROR_PROCEDURE(),
	 ERROR_MESSAGE(),
	 GETDATE());
	END CATCH


	END@

--------------------------------------------------
-- Create Procedure GDC.dimEntityTypeInsert
--------------------------------------------------
--drop procedure GDC.dimEntityTypeInsert@
CREATE 
 PROCEDURE [GDC].[dimEntityTypeInsert]


AS BEGIN
SET NOCOUNT ON 


	BEGIN TRY
	 BEGIN
      BEGIN TRANSACTION

		INSERT INTO GDC.dimEntityType(detCode)
		SELECT   Distinct entitytypecode
		FROM     GDC.staging_load_Fact 
        LEFT JOIN  GDC.dimentitytype on entitytypecode = detcode
		WHERE    detEntityTypeId is null
      COMMIT TRANSACTION
	  

	  END
    END TRY

		BEGIN CATCH
		INSERT INTO GDC.DB_Errors
		VALUES
	(SUSER_SNAME(),
	 ERROR_NUMBER(),
	 ERROR_STATE(),
	 ERROR_SEVERITY(),
	 ERROR_LINE(),
	 ERROR_PROCEDURE(),
	 ERROR_MESSAGE(),
	 GETDATE());
	END CATCH


	END@

--------------------------------------------------
-- Create Procedure GDC.dimPairInsert
--------------------------------------------------
--drop procedure GDC.dimPairInsert@
CREATE
 PROCEDURE [GDC].[dimPairInsert]


AS BEGIN
SET NOCOUNT ON 


	BEGIN TRY
	 BEGIN
      BEGIN TRANSACTION
		INSERT INTO GDC.dimPair(dpiCode, dpiAttributeId)
		SELECT   Distinct  PairCode, daiAttributeId
		FROM     GDC.staging_load_Fact   
        INNER JOIN GDC.dimAttribute on AttributeCode = daiCode
        LEFT JOIN GDC.dimPair on paircode = dpiCode and daiAttributeId = dpiAttributeId
		WHERE    dpiAttributeId is null
      COMMIT TRANSACTION
	  

	  END
    END TRY

		BEGIN CATCH
		INSERT INTO GDC.DB_Errors
		VALUES
	(SUSER_SNAME(),
	 ERROR_NUMBER(),
	 ERROR_STATE(),
	 ERROR_SEVERITY(),
	 ERROR_LINE(),
	 ERROR_PROCEDURE(),
	 ERROR_MESSAGE(),
	 GETDATE());
	END CATCH


	END@

--------------------------------------------------
-- Create Procedure GDC.FactEAVInsert
--------------------------------------------------
--drop procedure GDC.FactEAVInsert@
CREATE
 PROCEDURE [dbo].[FactEAVInsert]


AS BEGIN
SET NOCOUNT ON 


	BEGIN TRY
	 BEGIN
      BEGIN TRANSACTION
		EXEC GDC.dimEntityTypeInsert;
	  COMMIT TRANSACTION

	  BEGIN TRANSACTION
		EXEC GDC.dimEntityInsert;
	  COMMIT TRANSACTION

	  BEGIN TRANSACTION
		EXEC GDC.dimAttributeInsert;
	  COMMIT TRANSACTION

	  BEGIN TRANSACTION
		EXEC GDC.dimPairInsert;
	  COMMIT TRANSACTION

	  BEGIN TRANSACTION
	   MERGE GDC.FactEAV t1 USING (
		SELECT detentitytypeid AS entitytypeid,
			   detcode         AS entitytypecode,
			   deientityid     AS entityid,
			   deicode         AS entitycode,
			   daiattributeid  AS attributeid,
			   daicode         AS attributecode,
			   pairid_exist    AS pairid_cur,
			   paircode_exist  AS paircode_cur,
			   dpipairid       AS pairid_stg,
			   dpicode         AS paircode_stg
		FROM  
		  GDC.staging_load_fact
		  INNER JOIN GDC.dimentitytype
		  ON entitytypecode = detcode COLLATE SQL_Latin1_General_CP1_CS_AS
		  INNER JOIN GDC.dimentity
		  ON entitycode = deicode COLLATE SQL_Latin1_General_CP1_CS_AS AND detentitytypeid = deientitytypeid
		  INNER JOIN GDC.dimattribute
		  ON attributecode = daicode COLLATE SQL_Latin1_General_CP1_CS_AS
		  INNER JOIN GDC.dimpair
		  ON paircode = dpicode COLLATE SQL_Latin1_General_CP1_CS_AS AND daiattributeid = dpiattributeid 
		  LEFT JOIN (
			SELECT dvientityid    AS entid_exist,
				   daiattributeid AS attid_exist,
				   dpipairid      AS pairid_exist,
				   dpicode        AS paircode_exist
			FROM  
			  GDC.facteav
			  INNER JOIN GDC.dimpair dpicur
			  ON dvipairid = dpicur.dpipairid
			  INNER JOIN GDC.dimentity
			  ON dvientityid = deientityid
			  INNER JOIN GDC.dimentitytype
			  ON deientitytypeid = detentitytypeid
			  INNER JOIN GDC.dimattribute
			  ON dpicur.dpiattributeid = daiattributeid
			  INNER JOIN GDC.staging_load_fact
			  ON deicode = entitycode COLLATE SQL_Latin1_General_CP1_CS_AS AND detcode = entitytypecode COLLATE SQL_Latin1_General_CP1_CS_AS AND daicode = attributecode COLLATE SQL_Latin1_General_CP1_CS_AS 
		  ) ExistRec
		  ON deiEntityId = EntId_Exist and daiAttributeId = AttId_Exist
        ) t2
        ON (t1.dvientityid = t2.entityid and t1.dvipairid = t2.pairid_cur)
        WHEN MATCHED then UPDATE SET t1.dvipairid = t2.pairid_stg 
        WHEN NOT MATCHED THEN INSERT (dvientityid, dvipairid) VALUES (t2.entityid, t2.pairid_stg);

      COMMIT TRANSACTION
	  

	  END
    END TRY

		BEGIN CATCH
		INSERT INTO GDC.DB_Errors
		VALUES
	(SUSER_SNAME(),
	 ERROR_NUMBER(),
	 ERROR_STATE(),
	 ERROR_SEVERITY(),
	 ERROR_LINE(),
	 ERROR_PROCEDURE(),
	 ERROR_MESSAGE(),
	 GETDATE());
	END CATCH



	END@

/************************************************/
/*               Views                                            */
/************************************************/
--------------------------------------------------
-- Create View GDC.EntitiesAsAttributes_V
--------------------------------------------------
CREATE VIEW GDC.EntitiesAsAttributes_V as


select  detEnt.detentitytypeid as EntityTypeId_Ent,
 detEnt.detCode as EntityTypeCode_Ent,
 deiEnt.deientityid as EntityId_Ent,
 deiEnt.deiCode as EntityCode_Ent,
 daiEnt.daiattributeid as AttributeId_Ent,
 daiEnt.daicode as AttributeCode_Ent,
 dpiEnt.dpipairid as PairId_Ent,
 dpiEnt.dpiCode as PairCode_Ent,
detAtt.detentitytypeid as EntityTypeId_Att,
 detAtt.detCode as EntityTypeCode_Att,
 deiAtt.deientityid as EntityId_Att,
 deiAtt.deiCode as EntityCode_Att,
 daiAtt.daiattributeid as AttributeId_Att,
 daiAtt.daicode as AttributeCode_Att,
 dpiAtt.dpipairid as PairId_Att,
 dpiAtt.dpiCode as PairCode_Att

from GDC.facteav fEnt
inner join GDC.dimpair dpiEnt on fEnt.dvipairid = dpiEnt.dpipairid
inner join GDC.dimentity deiEnt on fEnt.dvientityid = deiEnt.deientityid 
inner join GDC.dimentitytype detEnt on deiEnt.deientitytypeid = detEnt.detentitytypeid
inner join GDC.dimattribute daiEnt on dpiEnt.dpiattributeid = daiEnt.daiattributeid
inner join GDC.dimentitytype detAtt on daiEnt.daiCode = detAtt.detCode
inner join GDC.dimentity deiAtt on detAtt.detEntityTypeId = deiAtt.deiEntityTypeId and dpiEnt.dpiCode = deiAtt.deiCode
inner join GDC.facteav fAtt on deiAtt.deiEntityId = fAtt.dviEntityId
inner join GDC.dimpair dpiAtt on fAtt.dviPairId = dpiAtt.dpiPairId
inner join GDC.dimattribute daiAtt on dpiAtt.dpiattributeid = daiAtt.daiattributeid@

--------------------------------------------------
-- Create View GDC.EntityAndType_V
--------------------------------------------------

CREATE VIEW GDC.EntityAndType_V as 
SELECT   e1.deiEntityId as EntityId,
         e1.deiCode as EntityCode,
         et1.detEntityTypeId as EntityTypeId,
         et1.detCode as EntityTypeCode
FROM    GDC.dimentity e1 
         inner join GDC.dimentitytype et1 on e1.deiEntityTypeId = et1.detEntityTypeId@

--------------------------------------------------
-- Create View GDC.EntityTypePairAttribute_V
--------------------------------------------------
CREATE VIEW GDC.EntityTypePairAttribute_V as 

select  detentitytypeid as EntityTypeId,
 detCode as EntityTypeCode,
 deientityid as EntityId,
 deiCode as EntityCode,
 daiattributeid as AttributeId,
 daicode as AttributeCode,
dpipairid as PairId,
 dpiCode as PairCode

from GDC.facteav
inner join GDC.dimpair on dvipairid = dpipairid
inner join GDC.dimentity on dvientityid = deientityid 
inner join GDC.dimentitytype on deientitytypeid = detentitytypeid
inner join GDC.dimattribute on dpiattributeid = daiattributeid@
