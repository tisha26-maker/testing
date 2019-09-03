/*
GlMasterData is the table for storing all Bank GL Related data. GL> General Ledger
oid                                      : Surrogate primary key
glId                                     : Gl id
glType                                   : Type of Gl DR, CR, VAT, CP
description                              : Description of Gl
mnemonic                                 : Gl name
glNo                                     : Gl number
traceId                                  : 
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthGlMasterData
(
oid                                      varchar(128)                                                not null,
glId                                     varchar(128)                                                not null,
glType                                   varchar(32)                                                 not null,
description                              text,
mnemonic                                 varchar(64),
glNo                                     varchar(64)                                                 not null,
traceId                                  varchar(128),
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthGlMasterData                                       primary key    (oid),
constraint                               ck_glType_UnauthGlMasterData                                check          (glType = 'DR' or glType = 'CR' or glType = 'VAT' or glType = 'CP'),
constraint                               u_mnemonic_UnauthGlMasterData                               unique         (mnemonic),
constraint                               ck_editCommit_UnauthGlMasterData                            check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_status_UnauthGlMasterData                                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_UnauthGlMasterData                     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthGlMasterData                           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
GlMasterData is the table for storing all Bank GL Related data. GL> General Ledger
oid                                      : Surrogate primary key
glId                                     : Gl id
glType                                   : Type of Gl DR, CR, VAT, CP
description                              : Description of Gl
mnemonic                                 : Gl name
glNo                                     : Gl number
traceId                                  : 
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             GlMasterData
(
oid                                      varchar(128)                                                not null,
glId                                     varchar(128)                                                not null,
glType                                   varchar(32)                                                 not null,
description                              text,
mnemonic                                 varchar(64),
glNo                                     varchar(64)                                                 not null,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_GlMasterData                                             primary key    (oid),
constraint                               ck_glType_GlMasterData                                      check          (glType = 'DR' or glType = 'CR' or glType = 'VAT' or glType = 'CP'),
constraint                               u_mnemonic_GlMasterData                                     unique         (mnemonic),
constraint                               ck_status_GlMasterData                                      check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_GlMasterData                           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_GlMasterData                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
GlMasterData is the table for storing all Bank GL Related data. GL> General Ledger
oid                                      : Surrogate primary key
glId                                     : Gl id
glType                                   : Type of Gl DR, CR, VAT, CP
description                              : Description of Gl
mnemonic                                 : Gl name
glNo                                     : Gl number
traceId                                  : 
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             GlMasterDataHistory
(
oid                                      varchar(128)                                                not null,
glId                                     varchar(128)                                                not null,
glType                                   varchar(32)                                                 not null,
description                              text,
mnemonic                                 varchar(64),
glNo                                     varchar(64)                                                 not null,
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_GlMasterDataHistory                                      primary key    (oid),
constraint                               ck_glType_GlMasterDataHistory                               check          (glType = 'DR' or glType = 'CR' or glType = 'VAT' or glType = 'CP'),
constraint                               u_mnemonic_GlMasterDataHistory                              unique         (mnemonic),
constraint                               ck_status_GlMasterDataHistory                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_GlMasterDataHistory                    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_GlMasterDataHistory                          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store tags and related information
oid                                      : Surrogate primary key
tagDictionaryId                          : Tag Id
tagName                                  : Name of tag
description                              : Description
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthTagDictionary
(
oid                                      varchar(128)                                                not null,
tagDictionaryId                          varchar(128)                                                not null,
tagName                                  varchar(256)                                                not null,
description                              text,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editcommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthTagDictionary                                      primary key    (oid),
constraint                               ck_status_UnauthTagDictionary                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthTagDictionary                           check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthTagDictionary                    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthTagDictionary                          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store tags and related unauthorized information
oid                                      : Surrogate primary key
tagDictionaryId                          : Tag Id
tagName                                  : Name of tag
description                              : Description
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             TagDictionary
(
oid                                      varchar(128)                                                not null,
tagDictionaryId                          varchar(128)                                                not null,
tagName                                  varchar(256)                                                not null,
description                              text,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_TagDictionary                                            primary key    (oid),
constraint                               ck_status_TagDictionary                                     check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_TagDictionary                          check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_TagDictionary                                check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store tags and related information for history
oid                                      : Surrogate primary key
tagDictionaryId                          : Tag Id
tagName                                  : Name of tag
description                              : Description
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             TagDictionaryHistory
(
oid                                      varchar(128)                                                not null,
tagDictionaryId                          varchar(128)                                                not null,
tagName                                  varchar(256)                                                not null,
description                              text,
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_TagDictionaryHistory                                     primary key    (oid)
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
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
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
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_Product                                                  primary key    (oid),
constraint                               u_productId_Product                                         unique         (productId),
constraint                               ck_productType_Product                                      check          (productType = 'SCHEME' or productType = 'TIME' or productType = 'SAVINGS' or productType = 'CURRENT'),
constraint                               ck_status_Product                                           check          (status = 'Active' or status = 'Inactive' or status = 'Closed'),
constraint                               ck_isApproverRemarks_Product                                check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_Product                                      check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Bank accounts are categorized as Products like Savings, Current, Time, Scheme etc.
oid                                      : Surrogate primary key
productId                                : Product Id
productName                              : Product Name
productType                              : Type of product - SCHEME, TIME, SAVINGS, CURRENT
productDefinition                        : In json define product rule
legacyGlCode                             : It is used for cbs
status                                   : Status of Product
rejectionCause                           : Why product rejected
makerId                                  : Who (which login) made the record
checkerId                                : Who (which login) check the record
approverId                               : Who (which login) approve the record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthProduct
(
oid                                      varchar(128)                                                not null,
productId                                varchar(128)                                                not null,
productName                              varchar(256),
productType                              varchar(32),
productDefinition                        text,
legacyGlCode                                                                                                        default ,
status                                   varchar(32)                                                 not null,
rejectionCause                                                                                                      default ,
makerId                                                                                                             default ,
checkerId                                                                                                           default ,
approverId                                                                                                          default ,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
editcommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthProduct                                            primary key    (oid),
constraint                               u_productId_UnauthProduct                                   unique         (productId),
constraint                               ck_productType_UnauthProduct                                check          (productType = 'SCHEME' or productType = 'TIME' or productType = 'SAVINGS' or productType = 'CURRENT'),
constraint                               ck_productType_UnauthProduct                                check          (productType = 'SCHEME' or productType = 'TIME' or productType = 'SAVINGS' or productType = 'CURRENT'),
constraint                               ck_status_UnauthProduct                                     check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_UnauthProduct                                     check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_UnauthProduct                                     check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_UnauthProduct                                     check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_UnauthProduct                                     check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthProduct                                 check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthProduct                          check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthProduct                                check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Bank accounts are categorized as Products like Savings, Current, Time, Scheme etc.
oid                                      : Surrogate primary key
productId                                : Product Id
productName                              : Product Name
productType                              : Type of product - SCHEME, TIME, SAVINGS, CURRENT
productDefinition                        : In json define product rule
legacyGlCode                             : It is used for cbs
status                                   : Status of Product
rejectionCause                           : Why product rejected
makerId                                  : Who (which login) made the record
checkerId                                : Who (which login) check the record
approverId                               : Who (which login) approve the record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             ProductHistory
(
oid                                      varchar(128)                                                not null,
productId                                varchar(128)                                                not null,
productName                              varchar(256),
productType                              varchar(32),
productDefinition                        text,
legacyGlCode                                                                                                        default ,
status                                   varchar(32)                                                 not null,
rejectionCause                                                                                                      default ,
makerId                                                                                                             default ,
checkerId                                                                                                           default ,
approverId                                                                                                          default ,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_ProductHistory                                           primary key    (oid),
constraint                               ck_productType_ProductHistory                               check          (productType = 'SCHEME' or productType = 'TIME' or productType = 'SAVINGS' or productType = 'CURRENT'),
constraint                               ck_productType_ProductHistory                               check          (productType = 'SCHEME' or productType = 'TIME' or productType = 'SAVINGS' or productType = 'CURRENT'),
constraint                               ck_status_ProductHistory                                    check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_ProductHistory                                    check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_ProductHistory                                    check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_ProductHistory                                    check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_status_ProductHistory                                    check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_ProductHistory                         check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_ProductHistory                               check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
MetaProperty is the table for storing all configuration data be it a value or a list. A property is identified by propertyId
oid                                      : Surrogate primary key
propertyId                               : Unikey key
valueJson                                : Defination of this property in Json
description                              : Description of property
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
*/
create table                             MetaProperty
(
oid                                      varchar(128)                                                not null,
propertyId                               varchar(128)                                                not null,
valueJson                                text                                                        not null,
description                              text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
constraint                               pk_MetaProperty                                             primary key    (oid),
constraint                               u_propertyId_MetaProperty                                   unique         (propertyId),
constraint                               ck_status_MetaProperty                                      check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_MetaProperty                           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_MetaProperty                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
MetaProperty is the table for storing all configuration data be it a value or a list. A property is identified by propertyId
oid                                      : Surrogate primary key
propertyId                               : Unikey key
valueJson                                : Defination of this property in Json
description                              : Description of property
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
traceId                                  : Trace Id of this record
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
*/
create table                             UnAuthMetaProperty
(
oid                                      varchar(128)                                                not null,
propertyId                               varchar(128)                                                not null,
valueJson                                text                                                        not null,
description                              text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
traceId                                  varchar(128),
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
constraint                               pk_UnAuthMetaProperty                                       primary key    (oid),
constraint                               u_propertyId_UnAuthMetaProperty                             unique         (propertyId),
constraint                               ck_editCommit_UnAuthMetaProperty                            check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_status_UnAuthMetaProperty                                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_UnAuthMetaProperty                     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnAuthMetaProperty                           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
MetaProperty is the table for storing all configuration data be it a value or a list. A property is identified by propertyId
oid                                      : Surrogate primary key
propertyId                               : Unikey key
valueJson                                : Defination of this property in Json
description                              : Description of property
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
*/
create table                             MetaPropertyHistory
(
oid                                      varchar(128)                                                not null,
propertyId                               varchar(128),
valueJson                                text                                                        not null,
description                              text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
constraint                               pk_MetaPropertyHistory                                      primary key    (oid),
constraint                               ck_status_MetaPropertyHistory                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_MetaPropertyHistory                    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_MetaPropertyHistory                          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
DdlMetaData is the table for storing all configuration data be it a value or a list. A property is identified by ddlMetaDataId
oid                                      : Surrogate primary key
ddlMetaDataId                            : DDL meta data id
ddlKey                                   : Key
valueJson                                : DDL key value in json
description                              : Description of ddl
traceId                                  : 
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthDdlMetaData
(
oid                                      varchar(128)                                                not null,
ddlMetaDataId                            varchar(128)                                                not null,
ddlKey                                   varchar(128)                                                not null,
valueJson                                text                                                        not null,
description                              text,
traceId                                  varchar(128),
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthDdlMetaData                                        primary key    (oid),
constraint                               ck_editCommit_UnauthDdlMetaData                             check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_status_UnauthDdlMetaData                                 check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_UnauthDdlMetaData                      check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthDdlMetaData                            check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
DdlMetaData is the table for storing all configuration data be it a value or a list. A property is identified by ddlMetaDataId
oid                                      : Surrogate primary key
ddlMetaDataId                            : DDL meta data id
ddlKey                                   : Key
valueJson                                : DDL key value in json
description                              : Description of ddl
traceId                                  : 
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             DdlMetaData
(
oid                                      varchar(128)                                                not null,
ddlMetaDataId                            varchar(128)                                                not null,
ddlKey                                   varchar(128)                                                not null,
valueJson                                text                                                        not null,
description                              text,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_DdlMetaData                                              primary key    (oid),
constraint                               ck_status_DdlMetaData                                       check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_DdlMetaData                            check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_DdlMetaData                                  check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
DdlMetaData is the table for storing all configuration data be it a value or a list. A property is identified by ddlMetaDataId
oid                                      : Surrogate primary key
ddlMetaDataId                            : DDL meta data id
ddlKey                                   : Key
valueJson                                : DDL key value in json
description                              : Description of ddl
traceId                                  : 
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             DdlMetaDataHistory
(
oid                                      varchar(128)                                                not null,
ddlMetaDataId                            varchar(128)                                                not null,
ddlKey                                   varchar(128)                                                not null,
valueJson                                text                                                        not null,
description                              text,
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_DdlMetaDataHistory                                       primary key    (oid),
constraint                               ck_status_DdlMetaDataHistory                                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_DdlMetaDataHistory                     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_DdlMetaDataHistory                           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
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


