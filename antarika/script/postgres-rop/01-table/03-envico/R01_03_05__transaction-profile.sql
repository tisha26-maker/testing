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
rejectionCause                           : Cause of rejeciton
status                                   : Status of this record - Active, Inactive
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
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
rejectionCause                           text,
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_AccountTransactionProfile                                primary key    (oid),
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
constraint                               ck_status_AccountTransactionProfile                         check          (status = 'Active' or status = 'Inactive' or status = 'Made' or status = 'Approved')
);

/*
This table to be used to store associated Outlet Transaction Profile information with system.
oid                                      : Surrogate primary key
outletTpId                               : An transaction profile associated with System to be Identified by outletTpId
name                                     : Name of transaction profile
tpType                                   : TpType of transaction profile
description                              : Description of transaction profile
maxDpPerTrn                              : Maximum deposit per transaction
maxDpPerDay                              : Maximum deposit per day
maxDpPerWeek                             : Maximum deposit per week
maxDpPerMonth                            : Maximum deposit per month
maxWdPerTrn                              : Maximum withdrawal per transaction
maxWdPerDay                              : Maximum withdrawal per day
maxWdPerWeek                             : Maximum withdrawal per week
maxWdPerMonth                            : Maximum withdrawal per month
maxFdPerTrn                              : Maximum fund transfer per transaction
maxFdPerDay                              : Maximum fund transfer per day
maxFdPerWeek                             : Maximum fund transfer per week
maxFdPerMonth                            : Maximum fund transfer per month
maxNoFdPerDay                            : Maximum no fund transfer per day
maxNoFdPerWeek                           : Maximum no fund transfer per week
maxNoFdPerMonth                          : Maximum no fund transfer per month
minBalance                               : Minimum banalce alert
maxBalance                               : Maximum balance alert
maxNoCashTrnPerDay                       : Maximum no cash transaciton per day
maxNoCashTrnPerWeek                      : Maximum no cash transaciton per week
maxNoCashTrnPerMonth                     : Maximum no cash transaciton per month
maxCashTrnPerDay                         : Maximum cash transaciton per day
maxCashTrnPerWeek                        : Maximum cash transaciton per weeek
maxCashTrnPerMonth                       : Maximum cash transaciton per month
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
enabledMaxWdPerTrn                       : Is enabled maximum withdrawal per transaction
enabledMaxWdPerDay                       : Is enabled maximum withdrawal per day
enabledMaxWdPerWeek                      : Is enabled maximum withdrawal per week
enabledMaxWdPerMonth                     : Is enabled maximum withdrawal per month
enabledMaxFdPerTrn                       : Is enabled maximum fund transfer per transaction
enabledMaxFdPerDay                       : Is enabled maximum fund transfer per day
enabledMaxFdPerWeek                      : Is enabled maximum fund transfer per week
enabledMaxFdPerMonth                     : Is enabled maximum fund transfer per month
enabledMaxNoFdPerDay                     : Is enabled maximum no fund transfer per day
enabledMaxNoFdPerWeek                    : Is enabled maximum no fund transfer per week
enabledMaxNoFdPerMonth                   : Is enabled maximum no fund transfer per month
enabledMinBalance                        : Is enabled min balance alert
enabledMaxBalance                        : Is enabled max balance alert
blockMaxDpPerTrn                         : Block maximum deposit per transaciton
blockMaxDpPerDay                         : Block maximum deposit per day
blockMaxDpPerWeek                        : Block maximum deposit per week
blockMaxDpPerMonth                       : Block maximum deposit per month
blockMxWdPerTrn                          : Block maximum withdrwal per transaciton
blockMaxWdPerDay                         : Block maximum withdrwal per day
blockMaxWdPerWeek                        : Block maximum withdrwal per week
blockMaxWdPerMonth                       : Block maximum withdrwal per month
blockMaxFdPerTrn                         : Block maximum fund transfer per transaction
blockMaxFdPerDay                         : Block maximum fund transfer per day
blockMaxFdPerWeek                        : Block maximum fund transfer per week
blockMaxFdPerMonth                       : Block maximum fund transfer per month
blockMaxNoFdPerDay                       : Block maximum no fund transfer per day
blockMaxNoFdPerWeek                      : Block maximum no fund transfer per week
blockMaxNoFdPerMonth                     : Block maximum no fund transfer per month
blockMinBalance                          : Block min blance
blockMaxBalance                          : Block max balance
rejectionCause                           : Cause of rejection
status                                   : Will store the state or status
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             OutletTransactionProfile
(
oid                                      varchar(128)                                                not null,
outletTpId                               varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
tpType                                   varchar(32),
description                              text,
maxDpPerTrn                              numeric(20,6)                                               not null       default 0,
maxDpPerDay                              numeric(20,6)                                               not null       default 0,
maxDpPerWeek                             numeric(20,6)                                               not null       default 0,
maxDpPerMonth                            numeric(20,6)                                               not null       default 0,
maxWdPerTrn                              numeric(20,6)                                               not null       default 0,
maxWdPerDay                              numeric(20,6)                                               not null       default 0,
maxWdPerWeek                             numeric(20,6)                                               not null       default 0,
maxWdPerMonth                            numeric(20,6)                                               not null       default 0,
maxFdPerTrn                              numeric(20,6)                                               not null       default 0,
maxFdPerDay                              numeric(20,6)                                               not null       default 0,
maxFdPerWeek                             numeric(20,6)                                               not null       default 0,
maxFdPerMonth                            numeric(20,6)                                               not null       default 0,
maxNoFdPerDay                            numeric(8,0)                                                not null       default 0,
maxNoFdPerWeek                           numeric(8,0)                                                not null       default 0,
maxNoFdPerMonth                          numeric(8,0)                                                not null       default 0,
minBalance                               numeric(20,6)                                               not null       default 0,
maxBalance                               numeric(20,6)                                               not null       default 0,
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
enabledMaxWdPerTrn                       varchar(32),
enabledMaxWdPerDay                       varchar(32),
enabledMaxWdPerWeek                      varchar(32),
enabledMaxWdPerMonth                     varchar(32),
enabledMaxFdPerTrn                       varchar(32),
enabledMaxFdPerDay                       varchar(32),
enabledMaxFdPerWeek                      varchar(32),
enabledMaxFdPerMonth                     varchar(32),
enabledMaxNoFdPerDay                     varchar(32),
enabledMaxNoFdPerWeek                    varchar(32),
enabledMaxNoFdPerMonth                   varchar(32),
enabledMinBalance                        varchar(32),
enabledMaxBalance                        varchar(32),
blockMaxDpPerTrn                         varchar(32),
blockMaxDpPerDay                         varchar(32),
blockMaxDpPerWeek                        varchar(32),
blockMaxDpPerMonth                       varchar(32),
blockMxWdPerTrn                          varchar(32),
blockMaxWdPerDay                         varchar(32),
blockMaxWdPerWeek                        varchar(32),
blockMaxWdPerMonth                       varchar(32),
blockMaxFdPerTrn                         varchar(32),
blockMaxFdPerDay                         varchar(32),
blockMaxFdPerWeek                        varchar(32),
blockMaxFdPerMonth                       varchar(32),
blockMaxNoFdPerDay                       varchar(32),
blockMaxNoFdPerWeek                      varchar(32),
blockMaxNoFdPerMonth                     varchar(32),
blockMinBalance                          varchar(32),
blockMaxBalance                          varchar(32),
rejectionCause                           text,
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_OutletTransactionProfile                                 primary key    (oid),
constraint                               ck_tpType_OutletTransactionProfile                          check          (tpType = 'Default' or tpType = 'Specific' or tpType = 'NotDefined'),
constraint                               ck_enabledMaxNoCashTrnPerDay_OutletTransactionProfile       check          (enabledMaxNoCashTrnPerDay = 'Yes' or enabledMaxNoCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerWeek_OutletTransactionProfile      check          (enabledMaxNoCashTrnPerWeek = 'Yes' or enabledMaxNoCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxNoCashTrnPerMonth_OutletTransactionProfile     check          (enabledMaxNoCashTrnPerMonth = 'Yes' or enabledMaxNoCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxCashTrnPerDay_OutletTransactionProfile         check          (enabledMaxCashTrnPerDay = 'Yes' or enabledMaxCashTrnPerDay = 'No'),
constraint                               ck_enabledMaxCashTrnPerWeek_OutletTransactionProfile        check          (enabledMaxCashTrnPerWeek = 'Yes' or enabledMaxCashTrnPerWeek = 'No'),
constraint                               ck_enabledMaxCashTrnPerMonth_OutletTransactionProfile       check          (enabledMaxCashTrnPerMonth = 'Yes' or enabledMaxCashTrnPerMonth = 'No'),
constraint                               ck_enabledMaxDpPerTrn_OutletTransactionProfile              check          (enabledMaxDpPerTrn = 'Yes' or enabledMaxDpPerTrn = 'No'),
constraint                               ck_enabledMaxDpPerDay_OutletTransactionProfile              check          (enabledMaxDpPerDay = 'Yes' or enabledMaxDpPerDay = 'No'),
constraint                               ck_enabledMaxDpPerWeek_OutletTransactionProfile             check          (enabledMaxDpPerWeek = 'Yes' or enabledMaxDpPerWeek = 'No'),
constraint                               ck_enabledMaxDpPerMonth_OutletTransactionProfile            check          (enabledMaxDpPerMonth = 'Yes' or enabledMaxDpPerMonth = 'No'),
constraint                               ck_enabledMaxWdPerTrn_OutletTransactionProfile              check          (enabledMaxWdPerTrn = 'Yes' or enabledMaxWdPerTrn = 'No'),
constraint                               ck_enabledMaxWdPerDay_OutletTransactionProfile              check          (enabledMaxWdPerDay = 'Yes' or enabledMaxWdPerDay = 'No'),
constraint                               ck_enabledMaxWdPerWeek_OutletTransactionProfile             check          (enabledMaxWdPerWeek = 'Yes' or enabledMaxWdPerWeek = 'No'),
constraint                               ck_enabledMaxWdPerMonth_OutletTransactionProfile            check          (enabledMaxWdPerMonth = 'Yes' or enabledMaxWdPerMonth = 'No'),
constraint                               ck_enabledMaxFdPerTrn_OutletTransactionProfile              check          (enabledMaxFdPerTrn = 'Yes' or enabledMaxFdPerTrn = 'No'),
constraint                               ck_enabledMaxFdPerDay_OutletTransactionProfile              check          (enabledMaxFdPerDay = 'Yes' or enabledMaxFdPerDay = 'No'),
constraint                               ck_enabledMaxFdPerWeek_OutletTransactionProfile             check          (enabledMaxFdPerWeek = 'Yes' or enabledMaxFdPerWeek = 'No'),
constraint                               ck_enabledMaxFdPerMonth_OutletTransactionProfile            check          (enabledMaxFdPerMonth = 'Yes' or enabledMaxFdPerMonth = 'No'),
constraint                               ck_enabledMaxNoFdPerDay_OutletTransactionProfile            check          (enabledMaxNoFdPerDay = 'Yes' or enabledMaxNoFdPerDay = 'No'),
constraint                               ck_enabledMaxNoFdPerWeek_OutletTransactionProfile           check          (enabledMaxNoFdPerWeek = 'Yes' or enabledMaxNoFdPerWeek = 'No'),
constraint                               ck_enabledMaxNoFdPerMonth_OutletTransactionProfile          check          (enabledMaxNoFdPerMonth = 'Yes' or enabledMaxNoFdPerMonth = 'No'),
constraint                               ck_enabledMinBalance_OutletTransactionProfile               check          (enabledMinBalance = 'Yes' or enabledMinBalance = 'No'),
constraint                               ck_enabledMaxBalance_OutletTransactionProfile               check          (enabledMaxBalance = 'Yes' or enabledMaxBalance = 'No'),
constraint                               ck_status_OutletTransactionProfile                          check          (status = 'Active' or status = 'Inactive' or status = 'Made' or status = 'Approved')
);

/*
Here ProductAccTransProfile detail to be stored of end client
oid                                      : Surrogate primary key
productAccTpId                           : An Product AccountTransaction profile associated with System to be Identified by productAccTpId
accountTpOid                             : To handle a AccountTransaction profile with multiple product is a foreign key refers to primary key of AccountTransactionProfile table
productOid                               : To handle a AccountTransaction profile with multiple product is a foreign key refers to primary key of Product table
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ProductAccTransProfile
(
oid                                      varchar(128)                                                not null,
productAccTpId                           varchar(128)                                                not null,
accountTpOid                             varchar(128)                                                not null,
productOid                               varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ProductAccTransProfile                                   primary key    (oid),
constraint                               fk_accountTpOid_ProductAccTransProfile                      foreign key    (accountTpOid)
                                                                                                     references     AccountTransactionProfile(oid),
constraint                               fk_productOid_ProductAccTransProfile                        foreign key    (productOid)
                                                                                                     references     Product(oid)
);


