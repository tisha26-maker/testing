/*
OutletDayProcess table is used to track if BOD and EOD is done at the agent outlet
oid                                      : Surrogate primary key
agentTillOid                             : Is a foreign key which refers to primary key of table AgentTill
servicePointOid                          : Parent table ServicePoint oid
agentOid                                 : Parent table Agent oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Brnach oid
isBodDone                                : Is BOD of that agent outlet complete? "Y" if yes, "N" if no
bodUserId                                : User id who executes BOD
bodUserName                              : User name who executes BOD
bodOn                                    : Corresponding date
isEodDone                                : Is EOD of that agent outlet complete? "Y" if yes, "N" if no
eodUserId                                : User id who executes EOD
eodUserName                              : User name who executes EOD
eodOn                                    : Corresponding date
*/
create table                             OutletDayProcess
(
oid                                      varchar(128)                                                not null,
agentTillOid                             varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
isBodDone                                varchar(32)                                                 not null,
bodUserId                                varchar(128),
bodUserName                              varchar(256),
bodOn                                    timestamp                                                   not null,
isEodDone                                varchar(32),
eodUserId                                varchar(128),
eodUserName                              varchar(256),
eodOn                                    timestamp,
constraint                               pk_OutletDayProcess                                         primary key    (oid),
constraint                               fk_agentTillOid_OutletDayProcess                            foreign key    (agentTillOid)
                                                                                                     references     AgentTill(oid),
constraint                               fk_servicePointOid_OutletDayProcess                         foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_agentOid_OutletDayProcess                                foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_bankOid_OutletDayProcess                                 foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_OutletDayProcess                               foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               ck_isBodDone_OutletDayProcess                               check          (isBodDone = 'Yes' or isBodDone = 'No'),
constraint                               ck_isEodDone_OutletDayProcess                               check          (isEodDone = 'Yes' or isEodDone = 'No')
);


