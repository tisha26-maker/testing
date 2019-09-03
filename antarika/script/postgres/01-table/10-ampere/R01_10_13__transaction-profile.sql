/*
This table to be used to store associated Account Transaction Profile information with system.
oid                                      : Surrogate primary key
accountTpId                              : An transaction profile associated with System to be Identified by accountTpId
name                                     : Name of transaction profile
tpType                                   : Type of transaction profile - Default, Specific, NotDefined
description                              : Description of transaction profile
maxDpPerTrn                              : Maximum deposit per transaction
maxDpPerDay                              : Maximum deposit per day
maxDpPerWeek                             : Maximum deposit per week
maxDpPerMonth                            : Maximum deposit per month
maxNoDpPerDay                            : Maximum no of deposit per day
maxNoDpPerWeek                           : Maximum no of deposit per week
maxNoDpPerMonth                          : Maximum no of deposit per month
maxWdPerTrn                              : Maximum withdrawal per transaction
maxWdPerDay                              : Maximum withdrawal per day
maxWdPerWeek                             : Maximum withdrawal per week
maxWdPerMonth                            : Maximum withdrawal per month
maxNoWdPerDay                            : Maximum no of withdrawal per day
maxNoWdPerWeek                           : Maximum no of withdrawal per week
maxNoWdPerMonth                          : Maximum no of withdrawal per month
maxFdPerTrn                              : Maximum Fund transfer per transaction
maxFdPerDay                              : Maximum Fund transfer per day
maxFdPerWeek                             : Maximum Fund transfer per week
maxFdPerMonth                            : Maximum Fund transfer per month
maxNoFdPerDay                            : Maximum no of Fund transfer per day
maxNoFdPerWeek                           : Maximum no of Fund transfer per week
maxNoFdPerMonth                          : Maximum no of Fund transfer per month
maxNoCashTrnPerDay                       : Maximum no of cash transaction per day
maxNoCashTrnPerWeek                      : Maximum no of cash transaction per week
maxNoCashTrnPerMonth                     : Maximum no of cash transaction per month
maxCashTrnPerDay                         : Maximum cash transaction per day
maxCashTrnPerWeek                        : Maximum cash transaction per wddk
maxCashTrnPerMonth                       : Maximum cash transaction per month
enabledMaxNoCashTrnPerDay                : Is enabled maximum no cash transaction per day
enabledMaxNoCashTrnPerWeek               : Is enabled maximum no cash transaction per week
enabledMaxNoCashTrnPerMonth              : Is enabled maximum no cash transaction per month
enabledMaxCashTrnPerDay                  : Is enabled maximum cash transaction per day
enabledMaxCashTrnPerWeek                 : Is enabled maximum cash transaction per week
enabledMaxCashTrnPerMonth                : Is enabled maximum cash transaction per month
enabledMaxDpPerTrn                       : Is enabled maximum deposit per transaction
enabledMaxDpPerDay                       : Is enabled maximum deposit per day
enabledMaxDpPerWeek                      : Is enabled maximum deposit per week
enabledMaxDpPerMonth                     : Is enabled maximum deposit per month
enabledMaxNoDpPerDay                     : Is enabled maximum no deposit per day
enabledMaxNoDpPerWeek                    : Is enabled maximum no deposit per week
enabledMaxNoDpPerMonth                   : Is enabled maximum no deposit per month
enabledMaxWdPerTrn                       : Is enabled maximum deposit per transaction
enabledMaxWdPerDay                       : Is enabled maximum deposit per day
enabledMaxWdPerWeek                      :  Is enabled maximum deposit per week
enabledMaxWdPerMonth                     : Is enabled maximum deposit per month
enabledMaxNoWdPerDay                     : Is enabled maximum no deposit per day
enabledMaxNoWdPerWeek                    : Is enabled maximum no deposit per week
enabledMaxNoWdPerMonth                   : Is enabled maximum no deposit per month
enabledMaxFdPerTrn                       : Is enabled maximum fund transfer per transaction
enabledMaxFdPerDay                       : Is enabled maximum fund transfer per day
enabledMaxFdPerWeek                      : Is enabled maximum fund transfer per week
enabledMaxFdPerMonth                     : Is enabled maximum fund transfer per month
enabledMaxNoFdPerDay                     : Is enabled maximum no fund transfer per day
enabledMaxNoFdPerWeek                    : Is enabled maximum no fund transfer per week
enabledMaxNoFdPerMonth                   : Is enabled maximum no fund transfer per month
blockMaxDpPerTrn                         : Block maximum deposit per transaction
blockMaxDpPerDay                         : Block maximum deposit per day
blockMaxDpPerWeek                        : Block maximum deposit per week
blockMaxDpPerMonth                       : Block maximum deposit per month
blockMaxNoDpPerDay                       : Block maximum no deposit per day
blockMaxNoDpPerWeek                      : Block maximum no deposit per week
blockMaxNoDpPerMonth                     : Block maximum no deposit per month
blockMxWdPerTrn                          : Block maximum withdrawal per transaction
blockMaxWdPerDay                         : Block maximum withdrawal per day
blockMaxWdPerWeek                        : Block maximum withdrawal per week
blockMaxWdPerMonth                       : Block maximum withdrawal per month
blockMaxNoWdPerDay                       : Block maximum no withdrawal per day
blockMaxNoWdPerWeek                      : Block maximum no withdrawal per week
blockMaxNoWdPerMonth                     : Block maximum no withdrawal per month
blockMaxFdPerTrn                         : Block maximum fund transfer per transaction
blockMaxFdPerDay                         : Block maximum fund transfer per day
blockMaxFdPerWeek                        : Block maximum fund transfer per week
blockMaxFdPerMonth                       : Block maximum fund transfer per month
blockMaxNoFdPerDay                       : Block maximum no fund transfer per day
blockMaxNoFdPerWeek                      : Block maximum no fund transfer per week
blockMaxNoFdPerMonth                     : Block maximum no fund transfer per month
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
deletionRemark                           : Delition remarks
*/
create table                             AccountTransactionProfile
(
oid                                      varchar(128)                                                not null,
accountTpId                              varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
tpType                                   varchar(32),
description                              text,
maxDpPerTrn                              numeric(20,6)                                               not null       default 0,
maxDpPerDay                              numeric(20,6)                                               not null       default 0,
maxDpPerWeek                             numeric(20,6)                                               not null       default 0,
maxDpPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoDpPerDay                            numeric(8,0)                                                not null       default 0,
maxNoDpPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoDpPerMonth                          numeric(8,0)                                                not null       default 0,
maxWdPerTrn                              numeric(20,6)                                               not null       default 0,
maxWdPerDay                              numeric(20,6)                                               not null       default 0,
maxWdPerWeek                             numeric(20,6)                                               not null       default 0,
maxWdPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoWdPerDay                            numeric(8,0)                                                not null       default 0,
maxNoWdPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoWdPerMonth                          numeric(8,0)                                                not null       default 0,
maxFdPerTrn                              numeric(20,6)                                               not null       default 0,
maxFdPerDay                              numeric(20,6)                                               not null       default 0,
maxFdPerWeek                             numeric(20,6)                                               not null       default 0,
maxFdPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoFdPerDay                            numeric(8,0)                                                not null       default 0,
maxNoFdPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoFdPerMonth                          numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerDay                       numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerWeek                      numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerMonth                     numeric(8,0)                                                not null       default 0,
maxCashTrnPerDay                         numeric(20,6)                                               not null       default 0,
maxCashTrnPerWeek                        numeric(20,6)                                               not null       default 0,
maxCashTrnPerMonth                       numeric(20,6)                                               not null       default 0,
enabledMaxNoCashTrnPerDay                varchar(32),
enabledMaxNoCashTrnPerWeek               varchar(32),
enabledMaxNoCashTrnPerMonth              varchar(32),
enabledMaxCashTrnPerDay                  varchar(32),
enabledMaxCashTrnPerWeek                 varchar(32),
enabledMaxCashTrnPerMonth                varchar(32),
enabledMaxDpPerTrn                       varchar(32),
enabledMaxDpPerDay                       varchar(32),
enabledMaxDpPerWeek                      varchar(32),
enabledMaxDpPerMonth                     varchar(32),
enabledMaxNoDpPerDay                     varchar(32),
enabledMaxNoDpPerWeek                    varchar(32),
enabledMaxNoDpPerMonth                   varchar(32),
enabledMaxWdPerTrn                       varchar(32),
enabledMaxWdPerDay                       varchar(32),
enabledMaxWdPerWeek                      varchar(32),
enabledMaxWdPerMonth                     varchar(32),
enabledMaxNoWdPerDay                     varchar(32),
enabledMaxNoWdPerWeek                    varchar(32),
enabledMaxNoWdPerMonth                   varchar(32),
enabledMaxFdPerTrn                       varchar(32),
enabledMaxFdPerDay                       varchar(32),
enabledMaxFdPerWeek                      varchar(32),
enabledMaxFdPerMonth                     varchar(32),
enabledMaxNoFdPerDay                     varchar(32),
enabledMaxNoFdPerWeek                    varchar(32),
enabledMaxNoFdPerMonth                   varchar(32),
blockMaxDpPerTrn                         varchar(32),
blockMaxDpPerDay                         varchar(32),
blockMaxDpPerWeek                        varchar(32),
blockMaxDpPerMonth                       varchar(32),
blockMaxNoDpPerDay                       varchar(32),
blockMaxNoDpPerWeek                      varchar(32),
blockMaxNoDpPerMonth                     varchar(32),
blockMxWdPerTrn                          varchar(32),
blockMaxWdPerDay                         varchar(32),
blockMaxWdPerWeek                        varchar(32),
blockMaxWdPerMonth                       varchar(32),
blockMaxNoWdPerDay                       varchar(32),
blockMaxNoWdPerWeek                      varchar(32),
blockMaxNoWdPerMonth                     varchar(32),
blockMaxFdPerTrn                         varchar(32),
blockMaxFdPerDay                         varchar(32),
blockMaxFdPerWeek                        varchar(32),
blockMaxFdPerMonth                       varchar(32),
blockMaxNoFdPerDay                       varchar(32),
blockMaxNoFdPerWeek                      varchar(32),
blockMaxNoFdPerMonth                     varchar(32),
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
deletionRemark                           text,
constraint                               pk_AccountTransactionProfile                                primary key    (oid),
constraint                               u_accountTpId_AccountTransactionProfile                     unique         (accountTpId),
constraint                               ck_tpType_AccountTransactionProfile                         check          (tpType = 'Default' or tpType = 'Specific' or tpType = 'NotDefined'),
constraint                               ck_enabledMaxNoCashTrnPerDay_AccountTransactionProfile      check          (enabledMaxNoCashTrnPerDay = 'Yes' or enabledMaxNoCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerWeek_AccountTransactionProfile     check          (enabledMaxNoCashTrnPerWeek = 'Yes' or enabledMaxNoCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerMonth_AccountTransactionProfile    check          (enabledMaxNoCashTrnPerMonth = 'Yes' or enabledMaxNoCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxCashTrnPerDay_AccountTransactionProfile        check          (enabledMaxCashTrnPerDay = 'Yes' or enabledMaxCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxCashTrnPerWeek_AccountTransactionProfile       check          (enabledMaxCashTrnPerWeek = 'Yes' or enabledMaxCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxCashTrnPerMonth_AccountTransactionProfile      check          (enabledMaxCashTrnPerMonth = 'Yes' or enabledMaxCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxDpPerTrn_AccountTransactionProfile             check          (enabledMaxDpPerTrn = 'Yes' or enabledMaxDpPerTrn = 'No'),
constraint                               ck_enabledMaxDpPerDay_AccountTransactionProfile             check          (enabledMaxDpPerDay = 'Yes' or enabledMaxDpPerDay = 'No'),
constraint                               ck_enabledMaxDpPerWeek_AccountTransactionProfile            check          (enabledMaxDpPerWeek = 'Yes' or enabledMaxDpPerWeek = 'No'),
constraint                               ck_enabledMaxDpPerMonth_AccountTransactionProfile           check          (enabledMaxDpPerMonth = 'Yes' or enabledMaxDpPerMonth = 'No'),
constraint                               ck_enabledMaxNoDpPerDay_AccountTransactionProfile           check          (enabledMaxNoDpPerDay = 'Yes' or enabledMaxNoDpPerDay = 'No'),
constraint                               ck_enabledMaxNoDpPerWeek_AccountTransactionProfile          check          (enabledMaxNoDpPerWeek = 'Yes' or enabledMaxNoDpPerWeek = 'No'),
constraint                               ck_enabledMaxNoDpPerMonth_AccountTransactionProfile         check          (enabledMaxNoDpPerMonth = 'Yes' or enabledMaxNoDpPerMonth = 'No'),
constraint                               ck_enabledMaxWdPerTrn_AccountTransactionProfile             check          (enabledMaxWdPerTrn = 'Yes' or enabledMaxWdPerTrn = 'No'),
constraint                               ck_enabledMaxWdPerDay_AccountTransactionProfile             check          (enabledMaxWdPerDay = 'Yes' or enabledMaxWdPerDay = 'No'),
constraint                               ck_enabledMaxWdPerWeek_AccountTransactionProfile            check          (enabledMaxWdPerWeek = 'Yes' or enabledMaxWdPerWeek = 'No'),
constraint                               ck_enabledMaxWdPerMonth_AccountTransactionProfile           check          (enabledMaxWdPerMonth = 'Yes' or enabledMaxWdPerMonth = 'No'),
constraint                               ck_enabledMaxNoWdPerDay_AccountTransactionProfile           check          (enabledMaxNoWdPerDay = 'Yes' or enabledMaxNoWdPerDay = 'No'),
constraint                               ck_enabledMaxNoWdPerWeek_AccountTransactionProfile          check          (enabledMaxNoWdPerWeek = 'Yes' or enabledMaxNoWdPerWeek = 'No'),
constraint                               ck_enabledMaxNoWdPerMonth_AccountTransactionProfile         check          (enabledMaxNoWdPerMonth = 'Yes' or enabledMaxNoWdPerMonth = 'No'),
constraint                               ck_enabledMaxFdPerTrn_AccountTransactionProfile             check          (enabledMaxFdPerTrn = 'Yes' or enabledMaxFdPerTrn = 'No'),
constraint                               ck_enabledMaxFdPerDay_AccountTransactionProfile             check          (enabledMaxFdPerDay = 'Yes' or enabledMaxFdPerDay = 'No'),
constraint                               ck_enabledMaxFdPerWeek_AccountTransactionProfile            check          (enabledMaxFdPerWeek = 'Yes' or enabledMaxFdPerWeek = 'No'),
constraint                               ck_enabledMaxFdPerMonth_AccountTransactionProfile           check          (enabledMaxFdPerMonth = 'Yes' or enabledMaxFdPerMonth = 'No'),
constraint                               ck_enabledMaxNoFdPerDay_AccountTransactionProfile           check          (enabledMaxNoFdPerDay = 'Yes' or enabledMaxNoFdPerDay = 'No'),
constraint                               ck_enabledMaxNoFdPerWeek_AccountTransactionProfile          check          (enabledMaxNoFdPerWeek = 'Yes' or enabledMaxNoFdPerWeek = 'No'),
constraint                               ck_enabledMaxNoFdPerMonth_AccountTransactionProfile         check          (enabledMaxNoFdPerMonth = 'Yes' or enabledMaxNoFdPerMonth = 'No'),
constraint                               ck_status_AccountTransactionProfile                         check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_AccountTransactionProfile              check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_AccountTransactionProfile                    check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Account Transaction Profile information with system.
oid                                      : Surrogate primary key
accountTpId                              : An transaction profile associated with System to be Identified by accountTpId
name                                     : Name of transaction profile
tpType                                   : Type of transaction profile - Default, Specific, NotDefined
description                              : Description of transaction profile
maxDpPerTrn                              : Maximum deposit per transaction
maxDpPerDay                              : Maximum deposit per day
maxDpPerWeek                             : Maximum deposit per week
maxDpPerMonth                            : Maximum deposit per month
maxNoDpPerDay                            : Maximum no of deposit per day
maxNoDpPerWeek                           : Maximum no of deposit per week
maxNoDpPerMonth                          : Maximum no of deposit per month
maxWdPerTrn                              : Maximum withdrawal per transaction
maxWdPerDay                              : Maximum withdrawal per day
maxWdPerWeek                             : Maximum withdrawal per week
maxWdPerMonth                            : Maximum withdrawal per month
maxNoWdPerDay                            : Maximum no of withdrawal per day
maxNoWdPerWeek                           : Maximum no of withdrawal per week
maxNoWdPerMonth                          : Maximum no of withdrawal per month
maxFdPerTrn                              : Maximum Fund transfer per transaction
maxFdPerDay                              : Maximum Fund transfer per day
maxFdPerWeek                             : Maximum Fund transfer per week
maxFdPerMonth                            : Maximum Fund transfer per month
maxNoFdPerDay                            : Maximum no of Fund transfer per day
maxNoFdPerWeek                           : Maximum no of Fund transfer per week
maxNoFdPerMonth                          : Maximum no of Fund transfer per month
maxNoCashTrnPerDay                       : Maximum no of cash transaction per day
maxNoCashTrnPerWeek                      : Maximum no of cash transaction per week
maxNoCashTrnPerMonth                     : Maximum no of cash transaction per month
maxCashTrnPerDay                         : Maximum cash transaction per day
maxCashTrnPerWeek                        : Maximum cash transaction per wddk
maxCashTrnPerMonth                       : Maximum cash transaction per month
enabledMaxNoCashTrnPerDay                : Is enabled maximum no cash transaction per day
enabledMaxNoCashTrnPerWeek               : Is enabled maximum no cash transaction per week
enabledMaxNoCashTrnPerMonth              : Is enabled maximum no cash transaction per month
enabledMaxCashTrnPerDay                  : Is enabled maximum cash transaction per day
enabledMaxCashTrnPerWeek                 : Is enabled maximum cash transaction per week
enabledMaxCashTrnPerMonth                : Is enabled maximum cash transaction per month
enabledMaxDpPerTrn                       : Is enabled maximum deposit per transaction
enabledMaxDpPerDay                       : Is enabled maximum deposit per day
enabledMaxDpPerWeek                      : Is enabled maximum deposit per week
enabledMaxDpPerMonth                     : Is enabled maximum deposit per month
enabledMaxNoDpPerDay                     : Is enabled maximum no deposit per day
enabledMaxNoDpPerWeek                    : Is enabled maximum no deposit per week
enabledMaxNoDpPerMonth                   : Is enabled maximum no deposit per month
enabledMaxWdPerTrn                       : Is enabled maximum deposit per transaction
enabledMaxWdPerDay                       : Is enabled maximum deposit per day
enabledMaxWdPerWeek                      :  Is enabled maximum deposit per week
enabledMaxWdPerMonth                     : Is enabled maximum deposit per month
enabledMaxNoWdPerDay                     : Is enabled maximum no deposit per day
enabledMaxNoWdPerWeek                    : Is enabled maximum no deposit per week
enabledMaxNoWdPerMonth                   : Is enabled maximum no deposit per month
enabledMaxFdPerTrn                       : Is enabled maximum fund transfer per transaction
enabledMaxFdPerDay                       : Is enabled maximum fund transfer per day
enabledMaxFdPerWeek                      : Is enabled maximum fund transfer per week
enabledMaxFdPerMonth                     : Is enabled maximum fund transfer per month
enabledMaxNoFdPerDay                     : Is enabled maximum no fund transfer per day
enabledMaxNoFdPerWeek                    : Is enabled maximum no fund transfer per week
enabledMaxNoFdPerMonth                   : Is enabled maximum no fund transfer per month
blockMaxDpPerTrn                         : Block maximum deposit per transaction
blockMaxDpPerDay                         : Block maximum deposit per day
blockMaxDpPerWeek                        : Block maximum deposit per week
blockMaxDpPerMonth                       : Block maximum deposit per month
blockMaxNoDpPerDay                       : Block maximum no deposit per day
blockMaxNoDpPerWeek                      : Block maximum no deposit per week
blockMaxNoDpPerMonth                     : Block maximum no deposit per month
blockMxWdPerTrn                          : Block maximum withdrawal per transaction
blockMaxWdPerDay                         : Block maximum withdrawal per day
blockMaxWdPerWeek                        : Block maximum withdrawal per week
blockMaxWdPerMonth                       : Block maximum withdrawal per month
blockMaxNoWdPerDay                       : Block maximum no withdrawal per day
blockMaxNoWdPerWeek                      : Block maximum no withdrawal per week
blockMaxNoWdPerMonth                     : Block maximum no withdrawal per month
blockMaxFdPerTrn                         : Block maximum fund transfer per transaction
blockMaxFdPerDay                         : Block maximum fund transfer per day
blockMaxFdPerWeek                        : Block maximum fund transfer per week
blockMaxFdPerMonth                       : Block maximum fund transfer per month
blockMaxNoFdPerDay                       : Block maximum no fund transfer per day
blockMaxNoFdPerWeek                      : Block maximum no fund transfer per week
blockMaxNoFdPerMonth                     : Block maximum no fund transfer per month
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
deletionRemark                           : Delition remarks
*/
create table                             AccountTransactionProfileHistory
(
oid                                      varchar(128)                                                not null,
accountTpId                              varchar(128),
name                                     varchar(256)                                                not null,
tpType                                   varchar(32),
description                              text,
maxDpPerTrn                              numeric(20,6)                                               not null       default 0,
maxDpPerDay                              numeric(20,6)                                               not null       default 0,
maxDpPerWeek                             numeric(20,6)                                               not null       default 0,
maxDpPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoDpPerDay                            numeric(8,0)                                                not null       default 0,
maxNoDpPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoDpPerMonth                          numeric(8,0)                                                not null       default 0,
maxWdPerTrn                              numeric(20,6)                                               not null       default 0,
maxWdPerDay                              numeric(20,6)                                               not null       default 0,
maxWdPerWeek                             numeric(20,6)                                               not null       default 0,
maxWdPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoWdPerDay                            numeric(8,0)                                                not null       default 0,
maxNoWdPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoWdPerMonth                          numeric(8,0)                                                not null       default 0,
maxFdPerTrn                              numeric(20,6)                                               not null       default 0,
maxFdPerDay                              numeric(20,6)                                               not null       default 0,
maxFdPerWeek                             numeric(20,6)                                               not null       default 0,
maxFdPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoFdPerDay                            numeric(8,0)                                                not null       default 0,
maxNoFdPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoFdPerMonth                          numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerDay                       numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerWeek                      numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerMonth                     numeric(8,0)                                                not null       default 0,
maxCashTrnPerDay                         numeric(20,6)                                               not null       default 0,
maxCashTrnPerWeek                        numeric(20,6)                                               not null       default 0,
maxCashTrnPerMonth                       numeric(20,6)                                               not null       default 0,
enabledMaxNoCashTrnPerDay                varchar(32),
enabledMaxNoCashTrnPerWeek               varchar(32),
enabledMaxNoCashTrnPerMonth              varchar(32),
enabledMaxCashTrnPerDay                  varchar(32),
enabledMaxCashTrnPerWeek                 varchar(32),
enabledMaxCashTrnPerMonth                varchar(32),
enabledMaxDpPerTrn                       varchar(32),
enabledMaxDpPerDay                       varchar(32),
enabledMaxDpPerWeek                      varchar(32),
enabledMaxDpPerMonth                     varchar(32),
enabledMaxNoDpPerDay                     varchar(32),
enabledMaxNoDpPerWeek                    varchar(32),
enabledMaxNoDpPerMonth                   varchar(32),
enabledMaxWdPerTrn                       varchar(32),
enabledMaxWdPerDay                       varchar(32),
enabledMaxWdPerWeek                      varchar(32),
enabledMaxWdPerMonth                     varchar(32),
enabledMaxNoWdPerDay                     varchar(32),
enabledMaxNoWdPerWeek                    varchar(32),
enabledMaxNoWdPerMonth                   varchar(32),
enabledMaxFdPerTrn                       varchar(32),
enabledMaxFdPerDay                       varchar(32),
enabledMaxFdPerWeek                      varchar(32),
enabledMaxFdPerMonth                     varchar(32),
enabledMaxNoFdPerDay                     varchar(32),
enabledMaxNoFdPerWeek                    varchar(32),
enabledMaxNoFdPerMonth                   varchar(32),
blockMaxDpPerTrn                         varchar(32),
blockMaxDpPerDay                         varchar(32),
blockMaxDpPerWeek                        varchar(32),
blockMaxDpPerMonth                       varchar(32),
blockMaxNoDpPerDay                       varchar(32),
blockMaxNoDpPerWeek                      varchar(32),
blockMaxNoDpPerMonth                     varchar(32),
blockMxWdPerTrn                          varchar(32),
blockMaxWdPerDay                         varchar(32),
blockMaxWdPerWeek                        varchar(32),
blockMaxWdPerMonth                       varchar(32),
blockMaxNoWdPerDay                       varchar(32),
blockMaxNoWdPerWeek                      varchar(32),
blockMaxNoWdPerMonth                     varchar(32),
blockMaxFdPerTrn                         varchar(32),
blockMaxFdPerDay                         varchar(32),
blockMaxFdPerWeek                        varchar(32),
blockMaxFdPerMonth                       varchar(32),
blockMaxNoFdPerDay                       varchar(32),
blockMaxNoFdPerWeek                      varchar(32),
blockMaxNoFdPerMonth                     varchar(32),
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
deletionRemark                           text,
constraint                               pk_AccountTransactionProfileHistory                         primary key    (oid),
constraint                               ck_tpType_AccountTransactionProfileHistory                  check          (tpType = 'Default' or tpType = 'Specific' or tpType = 'NotDefined'),
constraint                               ck_enabledMaxNoCashTrnPerDay_AccountTransactionProfileHistorycheck          (enabledMaxNoCashTrnPerDay = 'Yes' or enabledMaxNoCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerWeek_AccountTransactionProfileHistorycheck          (enabledMaxNoCashTrnPerWeek = 'Yes' or enabledMaxNoCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerMonth_AccountTransactionProfileHistorycheck          (enabledMaxNoCashTrnPerMonth = 'Yes' or enabledMaxNoCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxCashTrnPerDay_AccountTransactionProfileHistory check          (enabledMaxCashTrnPerDay = 'Yes' or enabledMaxCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxCashTrnPerWeek_AccountTransactionProfileHistorycheck          (enabledMaxCashTrnPerWeek = 'Yes' or enabledMaxCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxCashTrnPerMonth_AccountTransactionProfileHistorycheck          (enabledMaxCashTrnPerMonth = 'Yes' or enabledMaxCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxDpPerTrn_AccountTransactionProfileHistory      check          (enabledMaxDpPerTrn = 'Yes' or enabledMaxDpPerTrn = 'No'),
constraint                               ck_enabledMaxDpPerDay_AccountTransactionProfileHistory      check          (enabledMaxDpPerDay = 'Yes' or enabledMaxDpPerDay = 'No'),
constraint                               ck_enabledMaxDpPerWeek_AccountTransactionProfileHistory     check          (enabledMaxDpPerWeek = 'Yes' or enabledMaxDpPerWeek = 'No'),
constraint                               ck_enabledMaxDpPerMonth_AccountTransactionProfileHistory    check          (enabledMaxDpPerMonth = 'Yes' or enabledMaxDpPerMonth = 'No'),
constraint                               ck_enabledMaxNoDpPerDay_AccountTransactionProfileHistory    check          (enabledMaxNoDpPerDay = 'Yes' or enabledMaxNoDpPerDay = 'No'),
constraint                               ck_enabledMaxNoDpPerWeek_AccountTransactionProfileHistory   check          (enabledMaxNoDpPerWeek = 'Yes' or enabledMaxNoDpPerWeek = 'No'),
constraint                               ck_enabledMaxNoDpPerMonth_AccountTransactionProfileHistory  check          (enabledMaxNoDpPerMonth = 'Yes' or enabledMaxNoDpPerMonth = 'No'),
constraint                               ck_enabledMaxWdPerTrn_AccountTransactionProfileHistory      check          (enabledMaxWdPerTrn = 'Yes' or enabledMaxWdPerTrn = 'No'),
constraint                               ck_enabledMaxWdPerDay_AccountTransactionProfileHistory      check          (enabledMaxWdPerDay = 'Yes' or enabledMaxWdPerDay = 'No'),
constraint                               ck_enabledMaxWdPerWeek_AccountTransactionProfileHistory     check          (enabledMaxWdPerWeek = 'Yes' or enabledMaxWdPerWeek = 'No'),
constraint                               ck_enabledMaxWdPerMonth_AccountTransactionProfileHistory    check          (enabledMaxWdPerMonth = 'Yes' or enabledMaxWdPerMonth = 'No'),
constraint                               ck_enabledMaxNoWdPerDay_AccountTransactionProfileHistory    check          (enabledMaxNoWdPerDay = 'Yes' or enabledMaxNoWdPerDay = 'No'),
constraint                               ck_enabledMaxNoWdPerWeek_AccountTransactionProfileHistory   check          (enabledMaxNoWdPerWeek = 'Yes' or enabledMaxNoWdPerWeek = 'No'),
constraint                               ck_enabledMaxNoWdPerMonth_AccountTransactionProfileHistory  check          (enabledMaxNoWdPerMonth = 'Yes' or enabledMaxNoWdPerMonth = 'No'),
constraint                               ck_enabledMaxFdPerTrn_AccountTransactionProfileHistory      check          (enabledMaxFdPerTrn = 'Yes' or enabledMaxFdPerTrn = 'No'),
constraint                               ck_enabledMaxFdPerDay_AccountTransactionProfileHistory      check          (enabledMaxFdPerDay = 'Yes' or enabledMaxFdPerDay = 'No'),
constraint                               ck_enabledMaxFdPerWeek_AccountTransactionProfileHistory     check          (enabledMaxFdPerWeek = 'Yes' or enabledMaxFdPerWeek = 'No'),
constraint                               ck_enabledMaxFdPerMonth_AccountTransactionProfileHistory    check          (enabledMaxFdPerMonth = 'Yes' or enabledMaxFdPerMonth = 'No'),
constraint                               ck_enabledMaxNoFdPerDay_AccountTransactionProfileHistory    check          (enabledMaxNoFdPerDay = 'Yes' or enabledMaxNoFdPerDay = 'No'),
constraint                               ck_enabledMaxNoFdPerWeek_AccountTransactionProfileHistory   check          (enabledMaxNoFdPerWeek = 'Yes' or enabledMaxNoFdPerWeek = 'No'),
constraint                               ck_enabledMaxNoFdPerMonth_AccountTransactionProfileHistory  check          (enabledMaxNoFdPerMonth = 'Yes' or enabledMaxNoFdPerMonth = 'No'),
constraint                               ck_status_AccountTransactionProfileHistory                  check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_AccountTransactionProfileHistory       check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_AccountTransactionProfileHistory             check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Account Transaction Profile information with system.
oid                                      : Surrogate primary key
accountTpId                              : An transaction profile associated with System to be Identified by accountTpId
name                                     : Name of transaction profile
tpType                                   : Type of transaction profile - Default, Specific, NotDefined
description                              : Description of transaction profile
maxDpPerTrn                              : Maximum deposit per transaction
maxDpPerDay                              : Maximum deposit per day
maxDpPerWeek                             : Maximum deposit per week
maxDpPerMonth                            : Maximum deposit per month
maxNoDpPerDay                            : Maximum no of deposit per day
maxNoDpPerWeek                           : Maximum no of deposit per week
maxNoDpPerMonth                          : Maximum no of deposit per month
maxWdPerTrn                              : Maximum withdrawal per transaction
maxWdPerDay                              : Maximum withdrawal per day
maxWdPerWeek                             : Maximum withdrawal per week
maxWdPerMonth                            : Maximum withdrawal per month
maxNoWdPerDay                            : Maximum no of withdrawal per day
maxNoWdPerWeek                           : Maximum no of withdrawal per week
maxNoWdPerMonth                          : Maximum no of withdrawal per month
maxFdPerTrn                              : Maximum Fund transfer per transaction
maxFdPerDay                              : Maximum Fund transfer per day
maxFdPerWeek                             : Maximum Fund transfer per week
maxFdPerMonth                            : Maximum Fund transfer per month
maxNoFdPerDay                            : Maximum no of Fund transfer per day
maxNoFdPerWeek                           : Maximum no of Fund transfer per week
maxNoFdPerMonth                          : Maximum no of Fund transfer per month
maxNoCashTrnPerDay                       : Maximum no of cash transaction per day
maxNoCashTrnPerWeek                      : Maximum no of cash transaction per week
maxNoCashTrnPerMonth                     : Maximum no of cash transaction per month
maxCashTrnPerDay                         : Maximum cash transaction per day
maxCashTrnPerWeek                        : Maximum cash transaction per wddk
maxCashTrnPerMonth                       : Maximum cash transaction per month
enabledMaxNoCashTrnPerDay                : Is enabled maximum no cash transaction per day
enabledMaxNoCashTrnPerWeek               : Is enabled maximum no cash transaction per week
enabledMaxNoCashTrnPerMonth              : Is enabled maximum no cash transaction per month
enabledMaxCashTrnPerDay                  : Is enabled maximum cash transaction per day
enabledMaxCashTrnPerWeek                 : Is enabled maximum cash transaction per week
enabledMaxCashTrnPerMonth                : Is enabled maximum cash transaction per month
enabledMaxDpPerTrn                       : Is enabled maximum deposit per transaction
enabledMaxDpPerDay                       : Is enabled maximum deposit per day
enabledMaxDpPerWeek                      : Is enabled maximum deposit per week
enabledMaxDpPerMonth                     : Is enabled maximum deposit per month
enabledMaxNoDpPerDay                     : Is enabled maximum no deposit per day
enabledMaxNoDpPerWeek                    : Is enabled maximum no deposit per week
enabledMaxNoDpPerMonth                   : Is enabled maximum no deposit per month
enabledMaxWdPerTrn                       : Is enabled maximum deposit per transaction
enabledMaxWdPerDay                       : Is enabled maximum deposit per day
enabledMaxWdPerWeek                      :  Is enabled maximum deposit per week
enabledMaxWdPerMonth                     : Is enabled maximum deposit per month
enabledMaxNoWdPerDay                     : Is enabled maximum no deposit per day
enabledMaxNoWdPerWeek                    : Is enabled maximum no deposit per week
enabledMaxNoWdPerMonth                   : Is enabled maximum no deposit per month
enabledMaxFdPerTrn                       : Is enabled maximum fund transfer per transaction
enabledMaxFdPerDay                       : Is enabled maximum fund transfer per day
enabledMaxFdPerWeek                      : Is enabled maximum fund transfer per week
enabledMaxFdPerMonth                     : Is enabled maximum fund transfer per month
enabledMaxNoFdPerDay                     : Is enabled maximum no fund transfer per day
enabledMaxNoFdPerWeek                    : Is enabled maximum no fund transfer per week
enabledMaxNoFdPerMonth                   : Is enabled maximum no fund transfer per month
blockMaxDpPerTrn                         : Block maximum deposit per transaction
blockMaxDpPerDay                         : Block maximum deposit per day
blockMaxDpPerWeek                        : Block maximum deposit per week
blockMaxDpPerMonth                       : Block maximum deposit per month
blockMaxNoDpPerDay                       : Block maximum no deposit per day
blockMaxNoDpPerWeek                      : Block maximum no deposit per week
blockMaxNoDpPerMonth                     : Block maximum no deposit per month
blockMxWdPerTrn                          : Block maximum withdrawal per transaction
blockMaxWdPerDay                         : Block maximum withdrawal per day
blockMaxWdPerWeek                        : Block maximum withdrawal per week
blockMaxWdPerMonth                       : Block maximum withdrawal per month
blockMaxNoWdPerDay                       : Block maximum no withdrawal per day
blockMaxNoWdPerWeek                      : Block maximum no withdrawal per week
blockMaxNoWdPerMonth                     : Block maximum no withdrawal per month
blockMaxFdPerTrn                         : Block maximum fund transfer per transaction
blockMaxFdPerDay                         : Block maximum fund transfer per day
blockMaxFdPerWeek                        : Block maximum fund transfer per week
blockMaxFdPerMonth                       : Block maximum fund transfer per month
blockMaxNoFdPerDay                       : Block maximum no fund transfer per day
blockMaxNoFdPerWeek                      : Block maximum no fund transfer per week
blockMaxNoFdPerMonth                     : Block maximum no fund transfer per month
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
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
create table                             UnAuthAccountTransactionProfile
(
oid                                      varchar(128)                                                not null,
accountTpId                              varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
tpType                                   varchar(32),
description                              text,
maxDpPerTrn                              numeric(20,6)                                               not null       default 0,
maxDpPerDay                              numeric(20,6)                                               not null       default 0,
maxDpPerWeek                             numeric(20,6)                                               not null       default 0,
maxDpPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoDpPerDay                            numeric(8,0)                                                not null       default 0,
maxNoDpPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoDpPerMonth                          numeric(8,0)                                                not null       default 0,
maxWdPerTrn                              numeric(20,6)                                               not null       default 0,
maxWdPerDay                              numeric(20,6)                                               not null       default 0,
maxWdPerWeek                             numeric(20,6)                                               not null       default 0,
maxWdPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoWdPerDay                            numeric(8,0)                                                not null       default 0,
maxNoWdPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoWdPerMonth                          numeric(8,0)                                                not null       default 0,
maxFdPerTrn                              numeric(20,6)                                               not null       default 0,
maxFdPerDay                              numeric(20,6)                                               not null       default 0,
maxFdPerWeek                             numeric(20,6)                                               not null       default 0,
maxFdPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoFdPerDay                            numeric(8,0)                                                not null       default 0,
maxNoFdPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoFdPerMonth                          numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerDay                       numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerWeek                      numeric(8,0)                                                not null       default 0,
maxNoCashTrnPerMonth                     numeric(8,0)                                                not null       default 0,
maxCashTrnPerDay                         numeric(20,6)                                               not null       default 0,
maxCashTrnPerWeek                        numeric(20,6)                                               not null       default 0,
maxCashTrnPerMonth                       numeric(20,6)                                               not null       default 0,
enabledMaxNoCashTrnPerDay                varchar(32),
enabledMaxNoCashTrnPerWeek               varchar(32),
enabledMaxNoCashTrnPerMonth              varchar(32),
enabledMaxCashTrnPerDay                  varchar(32),
enabledMaxCashTrnPerWeek                 varchar(32),
enabledMaxCashTrnPerMonth                varchar(32),
enabledMaxDpPerTrn                       varchar(32),
enabledMaxDpPerDay                       varchar(32),
enabledMaxDpPerWeek                      varchar(32),
enabledMaxDpPerMonth                     varchar(32),
enabledMaxNoDpPerDay                     varchar(32),
enabledMaxNoDpPerWeek                    varchar(32),
enabledMaxNoDpPerMonth                   varchar(32),
enabledMaxWdPerTrn                       varchar(32),
enabledMaxWdPerDay                       varchar(32),
enabledMaxWdPerWeek                      varchar(32),
enabledMaxWdPerMonth                     varchar(32),
enabledMaxNoWdPerDay                     varchar(32),
enabledMaxNoWdPerWeek                    varchar(32),
enabledMaxNoWdPerMonth                   varchar(32),
enabledMaxFdPerTrn                       varchar(32),
enabledMaxFdPerDay                       varchar(32),
enabledMaxFdPerWeek                      varchar(32),
enabledMaxFdPerMonth                     varchar(32),
enabledMaxNoFdPerDay                     varchar(32),
enabledMaxNoFdPerWeek                    varchar(32),
enabledMaxNoFdPerMonth                   varchar(32),
blockMaxDpPerTrn                         varchar(32),
blockMaxDpPerDay                         varchar(32),
blockMaxDpPerWeek                        varchar(32),
blockMaxDpPerMonth                       varchar(32),
blockMaxNoDpPerDay                       varchar(32),
blockMaxNoDpPerWeek                      varchar(32),
blockMaxNoDpPerMonth                     varchar(32),
blockMxWdPerTrn                          varchar(32),
blockMaxWdPerDay                         varchar(32),
blockMaxWdPerWeek                        varchar(32),
blockMaxWdPerMonth                       varchar(32),
blockMaxNoWdPerDay                       varchar(32),
blockMaxNoWdPerWeek                      varchar(32),
blockMaxNoWdPerMonth                     varchar(32),
blockMaxFdPerTrn                         varchar(32),
blockMaxFdPerDay                         varchar(32),
blockMaxFdPerWeek                        varchar(32),
blockMaxFdPerMonth                       varchar(32),
blockMaxNoFdPerDay                       varchar(32),
blockMaxNoFdPerWeek                      varchar(32),
blockMaxNoFdPerMonth                     varchar(32),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
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
constraint                               pk_UnAuthAccountTransactionProfile                          primary key    (oid),
constraint                               u_accountTpId_UnAuthAccountTransactionProfile               unique         (accountTpId),
constraint                               ck_tpType_UnAuthAccountTransactionProfile                   check          (tpType = 'Default' or tpType = 'Specific' or tpType = 'NotDefined'),
constraint                               ck_enabledMaxNoCashTrnPerDay_UnAuthAccountTransactionProfilecheck          (enabledMaxNoCashTrnPerDay = 'Yes' or enabledMaxNoCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerWeek_UnAuthAccountTransactionProfilecheck          (enabledMaxNoCashTrnPerWeek = 'Yes' or enabledMaxNoCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerMonth_UnAuthAccountTransactionProfilecheck          (enabledMaxNoCashTrnPerMonth = 'Yes' or enabledMaxNoCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxCashTrnPerDay_UnAuthAccountTransactionProfile  check          (enabledMaxCashTrnPerDay = 'Yes' or enabledMaxCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxCashTrnPerWeek_UnAuthAccountTransactionProfile check          (enabledMaxCashTrnPerWeek = 'Yes' or enabledMaxCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxCashTrnPerMonth_UnAuthAccountTransactionProfilecheck          (enabledMaxCashTrnPerMonth = 'Yes' or enabledMaxCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxDpPerTrn_UnAuthAccountTransactionProfile       check          (enabledMaxDpPerTrn = 'Yes' or enabledMaxDpPerTrn = 'No'),
constraint                               ck_enabledMaxDpPerDay_UnAuthAccountTransactionProfile       check          (enabledMaxDpPerDay = 'Yes' or enabledMaxDpPerDay = 'No'),
constraint                               ck_enabledMaxDpPerWeek_UnAuthAccountTransactionProfile      check          (enabledMaxDpPerWeek = 'Yes' or enabledMaxDpPerWeek = 'No'),
constraint                               ck_enabledMaxDpPerMonth_UnAuthAccountTransactionProfile     check          (enabledMaxDpPerMonth = 'Yes' or enabledMaxDpPerMonth = 'No'),
constraint                               ck_enabledMaxNoDpPerDay_UnAuthAccountTransactionProfile     check          (enabledMaxNoDpPerDay = 'Yes' or enabledMaxNoDpPerDay = 'No'),
constraint                               ck_enabledMaxNoDpPerWeek_UnAuthAccountTransactionProfile    check          (enabledMaxNoDpPerWeek = 'Yes' or enabledMaxNoDpPerWeek = 'No'),
constraint                               ck_enabledMaxNoDpPerMonth_UnAuthAccountTransactionProfile   check          (enabledMaxNoDpPerMonth = 'Yes' or enabledMaxNoDpPerMonth = 'No'),
constraint                               ck_enabledMaxWdPerTrn_UnAuthAccountTransactionProfile       check          (enabledMaxWdPerTrn = 'Yes' or enabledMaxWdPerTrn = 'No'),
constraint                               ck_enabledMaxWdPerDay_UnAuthAccountTransactionProfile       check          (enabledMaxWdPerDay = 'Yes' or enabledMaxWdPerDay = 'No'),
constraint                               ck_enabledMaxWdPerWeek_UnAuthAccountTransactionProfile      check          (enabledMaxWdPerWeek = 'Yes' or enabledMaxWdPerWeek = 'No'),
constraint                               ck_enabledMaxWdPerMonth_UnAuthAccountTransactionProfile     check          (enabledMaxWdPerMonth = 'Yes' or enabledMaxWdPerMonth = 'No'),
constraint                               ck_enabledMaxNoWdPerDay_UnAuthAccountTransactionProfile     check          (enabledMaxNoWdPerDay = 'Yes' or enabledMaxNoWdPerDay = 'No'),
constraint                               ck_enabledMaxNoWdPerWeek_UnAuthAccountTransactionProfile    check          (enabledMaxNoWdPerWeek = 'Yes' or enabledMaxNoWdPerWeek = 'No'),
constraint                               ck_enabledMaxNoWdPerMonth_UnAuthAccountTransactionProfile   check          (enabledMaxNoWdPerMonth = 'Yes' or enabledMaxNoWdPerMonth = 'No'),
constraint                               ck_enabledMaxFdPerTrn_UnAuthAccountTransactionProfile       check          (enabledMaxFdPerTrn = 'Yes' or enabledMaxFdPerTrn = 'No'),
constraint                               ck_enabledMaxFdPerDay_UnAuthAccountTransactionProfile       check          (enabledMaxFdPerDay = 'Yes' or enabledMaxFdPerDay = 'No'),
constraint                               ck_enabledMaxFdPerWeek_UnAuthAccountTransactionProfile      check          (enabledMaxFdPerWeek = 'Yes' or enabledMaxFdPerWeek = 'No'),
constraint                               ck_enabledMaxFdPerMonth_UnAuthAccountTransactionProfile     check          (enabledMaxFdPerMonth = 'Yes' or enabledMaxFdPerMonth = 'No'),
constraint                               ck_enabledMaxNoFdPerDay_UnAuthAccountTransactionProfile     check          (enabledMaxNoFdPerDay = 'Yes' or enabledMaxNoFdPerDay = 'No'),
constraint                               ck_enabledMaxNoFdPerWeek_UnAuthAccountTransactionProfile    check          (enabledMaxNoFdPerWeek = 'Yes' or enabledMaxNoFdPerWeek = 'No'),
constraint                               ck_enabledMaxNoFdPerMonth_UnAuthAccountTransactionProfile   check          (enabledMaxNoFdPerMonth = 'Yes' or enabledMaxNoFdPerMonth = 'No'),
constraint                               ck_status_UnAuthAccountTransactionProfile                   check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editCommit_UnAuthAccountTransactionProfile               check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_UnAuthAccountTransactionProfile        check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnAuthAccountTransactionProfile              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);


