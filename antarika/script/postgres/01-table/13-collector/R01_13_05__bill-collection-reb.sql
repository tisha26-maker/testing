/*
Reb charge model to be stored
oid                                      : Surrogate primary key
rebChargeModelId                         : Reb charge model unique id
servicePointOid                          : Parent table servicepoint oid
rebChargeJson                            : Charge logic in JSON schema
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             RebChargeModel
(
oid                                      varchar(128)                                                not null,
rebChargeModelId                         varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
rebChargeJson                            text                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_RebChargeModel                                           primary key    (oid),
constraint                               fk_servicePointOid_RebChargeModel                           foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid)
);


