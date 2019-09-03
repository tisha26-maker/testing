/*
This table is used to store tags and related information
oid                                      : Surrogate primary key
tagDictionaryId                          : Tag Id
tagName                                  : Name of tag
description                              : Description
rejectionCause                           : Why reject it
status                                   : Status of tag BankMade, BankApproved, Active, Inactive, BankRejected
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             TagDictionary
(
oid                                      varchar(128)                                                not null,
tagDictionaryId                          varchar(128)                                                not null,
tagName                                  varchar(256)                                                not null,
description                              text,
rejectionCause                           text,
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_TagDictionary                                            primary key    (oid),
constraint                               ck_status_TagDictionary                                     check          (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable')
);

/*
This table maps tags with entities
oid                                      : Surrogate privary key
tagLinkId                                : Unique key to identify this record
entityId                                 : Id of item
entityCode                               : Entity code
tagLibOid                                : Tag Id
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             TagLink
(
oid                                      varchar(128)                                                not null,
tagLinkId                                varchar(128)                                                not null,
entityId                                 varchar(128)                                                not null,
entityCode                               varchar(128)                                                not null,
tagLibOid                                varchar(128),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_TagLink                                                  primary key    (oid),
constraint                               fk_tagLibOid_TagLink                                        foreign key    (tagLibOid)
                                                                                                     references     TagDictionary(oid)
);

/*
This table stores draft mapping between tags and entities
oid                                      : Surrogate primary key
tagLinkId                                : Unique key to identify this record
entityId                                 : Entity Id
entityCode                               : Entity code
tagLibOid                                : Oid of tag link table
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             TagLinkDraft
(
oid                                      varchar(128)                                                not null,
tagLinkId                                varchar(128),
entityId                                 varchar(128),
entityCode                               varchar(128),
tagLibOid                                varchar(128),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_TagLinkDraft                                             primary key    (oid)
);

/*
Bank accounts are categorized as Products like Savings, Current, Time, Scheme etc.
oid                                      : Surrogate primary key
productId                                : Product Id
productName                              : Product Name
productType                              : Type of product - SCHEME, TIME, SAVINGS, CURRENT
productDefinition                        : In json define product rule
legacyGlCode                             : It is used for cbs
status                                   : Status of product BankMade, BankApproved, Active, Inactive, BankRejected
rejectionCause                           : Why product rejected
makerId                                  : Who (which login) made the record
checkerId                                : Who (which login) check the record
approverId                               : Who (which login) approve the record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             Product
(
oid                                      varchar(128)                                                not null,
productId                                varchar(128)                                                not null,
productName                              varchar(256),
productType                              varchar(32),
productDefinition                        text,
legacyGlCode                             varchar(128),
status                                   varchar(32),
rejectionCause                           text,
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
createdBy                                varchar                                                     not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar,
updatedOn                                timestamp,
constraint                               pk_Product                                                  primary key    (oid),
constraint                               ck_productType_Product                                      check          (productType = 'SCHEME' or productType = 'TIME' or productType = 'SAVINGS' or productType = 'CURRENT'),
constraint                               ck_status_Product                                           check          (status = 'Active' or status = 'Inactive' or status = 'Closed')
);

/*
MetaProperty is the table for storing all configuration data be it a value or a list. A property is identified by propertyId
oid                                      : Surrogate primary key
propertyId                               : Unikey key
valueJson                                : Defination of this property in Json
description                              : Description of property
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             MetaProperty
(
oid                                      varchar(128)                                                not null,
propertyId                               varchar(128)                                                not null,
valueJson                                text                                                        not null,
description                              text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_MetaProperty                                             primary key    (oid),
constraint                               u_propertyId_MetaProperty                                   unique         (propertyId)
);

/*
DdlMetaData is the table for storing all configuration data be it a value or a list. A property is identified by ddlMetaDataId
oid                                      : Surrogate primary key
ddlMetaDataId                            : DDL meta data id
ddlKey                                   : Key
valueJson                                : DDL key value in json
status                                   : Status of key - BankMade, BankApproved, Active, Inactive, BankRejected
description                              : Description of ddl
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             DdlMetaData
(
oid                                      varchar(128)                                                not null,
ddlMetaDataId                            varchar(128)                                                not null,
ddlKey                                   varchar(128)                                                not null,
valueJson                                text                                                        not null,
status                                   varchar(32),
description                              text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_DdlMetaData                                              primary key    (oid),
constraint                               ck_status_DdlMetaData                                       check          (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable')
);

/*
This table is used to store Geo Location code Division->District->Upazila->Union/Ward
oid                                      : Surrogate primary key
bbsCode                                  : 8 digit (divisionCode+districtCode+upazillaCode+unionCode) 
divisionCode                             : 2 digit left padded with 0
districtCode                             : 2 digit left padded with 0
upazillaCode                             : 2 digit left padded with 0
unionCode                                : 2 digit left padded with 0
divisionName                             : In English
districtName                             : In English
upazillaName                             : In English
unionName                                : In English
municipalityName                         : In English
divisionName_bn                          : In Bangla
districtName_bn                          : In Bangla
upazillaName_bn                          : In Bangla
unionName_bn                             : In Bangla
municipalityName_bn                      : In Bangla
version                                  : BBS updates after 3/4 years (bbs.2011) . 
createdBy                                : who (which login) created the record
createdOn                                : when the record was created
updatedBy                                : who (which login) last updated the record
updatedOn                                : when the record was last updated
*/
create table                             GeoData
(
oid                                      varchar(128)                                                not null,
bbsCode                                  varchar(64)                                                 not null,
divisionCode                             varchar(16)                                                 not null,
districtCode                             varchar(16)                                                 not null,
upazillaCode                             varchar(16)                                                 not null,
unionCode                                varchar(16)                                                 not null,
divisionName                             varchar(256)                                                not null,
districtName                             varchar(256)                                                not null,
upazillaName                             varchar(256)                                                not null,
unionName                                varchar(256)                                                not null,
municipalityName                         varchar(256),
divisionName_bn                          varchar(256)                                                not null,
districtName_bn                          varchar(256)                                                not null,
upazillaName_bn                          varchar(256)                                                not null,
unionName_bn                             varchar(256),
municipalityName_bn                      varchar(256),
version                                  varchar(256),
createdBy                                varchar(256)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_GeoData                                                  primary key    (oid)
);


