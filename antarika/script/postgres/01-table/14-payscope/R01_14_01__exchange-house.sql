/*
ExchangeHouse information to be stored here
oid                                      : Surrogate primary key
exHouseId                                : Key of the ExchangeHouse
exHouseName                              : Exchange House Name
branchGlAccountNo                        : Account number
centralGlAccountNo                       : Account number
doerAccount                              : Doer Account for CPVC Disbursement
accountJson                              : A json for storing account details for the Exchange House
status                                   : Status showing for lifecycle stages like Made, Approved, Active, Inactive
makerId                                  : Who (which login) made the record
checkerId                                : Who (which login) checked the record
approverId                               : Who (which login) approved the record
rejectionCause                           : Details of the cause for rejection
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ExchangeHouse
(
oid                                      varchar(128)                                                not null,
exHouseId                                varchar(128)                                                not null,
exHouseName                              varchar(256)                                                not null,
branchGlAccountNo                        varchar(64),
centralGlAccountNo                       varchar(64),
doerAccount                              varchar(64),
accountJson                              text,
status                                   varchar(32),
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ExchangeHouse                                            primary key    (oid),
constraint                               ck_status_ExchangeHouse                                     check          (status = 'Active' or status = 'Inactive')
);


