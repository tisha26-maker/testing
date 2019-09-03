/*

oid                                      : pattern : accountno-yyyymmdd
bankAccountNo                            : 
servicePointOid                          : 
branchOid                                : 
productOid                               : 
ownership                                : 
calculationDate                          : 
depositAmount                            : 
floatAmount                              : 
createdBy                                : 
createdOn                                : 
updatedBy                                : 
updatedOn                                : 
*/
create table                             DailyDeposit
(
oid                                      varchar(128)                                                not null,
bankAccountNo                            varchar(64)                                                 not null,
servicePointOid                          varchar(128),
branchOid                                varchar(128),
productOid                               varchar(32),
ownership                                varchar(32)                                                 not null       default 'Customer',
calculationDate                          date                                                        not null,
depositAmount                            numeric(20,2)                                               not null,
floatAmount                              numeric(20,4)                                               not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_DailyDeposit                                             primary key    (oid)
);

/*

oid                                      : 
calculationDate                          : 
branchOid                                : 
branchName                               : 
agentOid                                 : 
agentName                                : 
servicePointOid                          : 
servicePointName                         : 
productOid                               : 
productName                              : 
ownership                                : 
accountCount                             : Account Count
totalDeposit                             : 
totalFloat                               : 
createdBy                                : 
createdOn                                : 
updatedBy                                : 
updatedOn                                : 
*/
create table                             DailyDepositSummary
(
oid                                      varchar(128)                                                not null,
calculationDate                          date,
branchOid                                varchar(128)                                                not null,
branchName                               varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
agentName                                varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
servicePointName                         varchar(128)                                                not null,
productOid                               varchar(32)                                                 not null,
productName                              varchar(128)                                                not null,
ownership                                varchar(32)                                                 not null       default 'Customer',
accountCount                             numeric(8)                                                  not null,
totalDeposit                             numeric(20,2)                                               not null,
totalFloat                               numeric(20,4)                                               not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_DailyDepositSummary                                      primary key    (oid)
);

/*

oid                                      : 
calculationdate                          : 
branchOid                                : 
branchName                               : 
agentOid                                 : 
agentName                                : 
servicePointOid                          : 
servicePointName                         : 
productOid                               : 
productName                              : 
bankAccountNo                            : 
accountTitle                             : 
depositAmount                            : 
createdBy                                : 
createdOn                                : 
updatedBy                                : 
updatedOn                                : 
*/
create table                             AgentDailyDeposit
(
oid                                      varchar(128)                                                not null,
calculationdate                          date,
branchOid                                varchar(128)                                                not null,
branchName                               varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
agentName                                varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
servicePointName                         varchar(128)                                                not null,
productOid                               varchar(32)                                                 not null,
productName                              varchar(128)                                                not null,
bankAccountNo                            numeric(8)                                                  not null,
accountTitle                             varchar(128)                                                not null,
depositAmount                            numeric(20,6)                                               not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_AgentDailyDeposit                                        primary key    (oid)
);

/*

oid                                      : 
calculationdate                          : 
branchOid                                : 
branchName                               : 
bankAccountNo                            : 
accountTitle                             : 
depositAmount                            : 
createdBy                                : 
createdOn                                : 
updatedBy                                : 
updatedOn                                : 
*/
create table                             BDTDailyDeposit
(
oid                                      varchar(128)                                                not null,
calculationdate                          date,
branchOid                                varchar(128)                                                not null,
branchName                               varchar(128)                                                not null,
bankAccountNo                            numeric(8)                                                  not null,
accountTitle                             varchar(128)                                                not null,
depositAmount                            numeric(20,6)                                               not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_BDTDailyDeposit                                          primary key    (oid)
);


