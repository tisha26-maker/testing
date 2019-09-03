/*
Merchant Information stored here
oid                                      : surrogate primary key
accountTitle                             : Account Title of Merchant Account
bankAccountNo                            : Bank Account No of merchant
owner                                    : Merchant Type: Doer or Entrepreneur
branchOid                                : Branch oid
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
create table                             MerchantAccount
(
oid                                      varchar(128)                                                not null,
accountTitle                             varchar(128)                                                not null,
bankAccountNo                            varchar(64)                                                 not null,
owner                                    varchar(64)                                                 not null,
branchOid                                varchar(128),
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
constraint                               pk_MerchantAccount                                          primary key    (oid),
constraint                               ck_owner_MerchantAccount                                    check          (owner = 'DOER' or owner = 'Entrepreneur'),
constraint                               ck_status_MerchantAccount                                   check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_MerchantAccount                               check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_MerchantAccount                        check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_MerchantAccount                              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Merchant Account and Service Point Mapping
oid                                      : surrogate primary key
merchantAccountOid                       : Merchant Account oid
servicePointOid                          : Service Point oid
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             MerchantAccountServicePoint
(
oid                                      varchar(128)                                                not null,
merchantAccountOid                       varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_MerchantAccountServicePoint                              primary key    (oid),
constraint                               fk_merchantAccountOid_MerchantAccountServicePoint           foreign key    (merchantAccountOid)
                                                                                                     references     MerchantAccount(oid),
constraint                               fk_servicePointOid_MerchantAccountServicePoint              foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid)
);


