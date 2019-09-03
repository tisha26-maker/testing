/*
AgentTill Table is used to trace everyday Till record of agent outlet
oid                                      : Surrogate primary key
servicePointOid                          : Parent table ServicePoint oid
agentOid                                 : Parent table Agent oid
bankAccountNo                            : Bank A/c number tagged with this outlet
accountBalance                           : Current balance of the agent account
acBalanceAtBoD                           : Account balance at BOD
tillAtBoD                                : Till balance at BOD
currentTillBalance                       : Till balance at any time of the day
totalCashIn                              : Total cash entered into till
totalCashOut                             : Total cash withdrawn from till
cashDeposit                              : Total cash Deposited into customer account through the outlet
cashWithdrawal                           : Total cash Withdrawn into customer account from the outlet
branchOid                                : Parent table Branch oid
bankOid                                  : Parent table Bank oid
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             AgentTill
(
oid                                      varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
bankAccountNo                            varchar(64)                                                 not null,
accountBalance                           numeric(20,6)                                               not null,
acBalanceAtBoD                           numeric(20,6)                                               not null,
tillAtBoD                                numeric(20,6)                                               not null,
currentTillBalance                       numeric(20,6)                                               not null,
totalCashIn                              numeric(20,6),
totalCashOut                             numeric(20,6),
cashDeposit                              numeric(20,6),
cashWithdrawal                           numeric(20,6),
branchOid                                varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_AgentTill                                                primary key    (oid),
constraint                               fk_servicePointOid_AgentTill                                foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_agentOid_AgentTill                                       foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_branchOid_AgentTill                                      foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_bankOid_AgentTill                                        foreign key    (bankOid)
                                                                                                     references     Bank(oid)
);

/*
TillLog table is used to record data every time agent enters cash into Till or withdraws cash from Till
oid                                      : Surrogate primary key
agentTillOid                             : Parent table AgentTill oid
servicePointOid                          : Parent table ServicePoint oid
agentOid                                 : Parent table Agent oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
transType                                : Transaction type
transAmount                              : Transaction amount
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
*/
create table                             TillLog
(
oid                                      varchar(128)                                                not null,
agentTillOid                             varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
transType                                varchar(32)                                                 not null,
transAmount                              numeric(20,6)                                               not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
constraint                               ck_transType_TillLog                                        check          (transType = 'CashIn' or transType = 'CashOut')
);


