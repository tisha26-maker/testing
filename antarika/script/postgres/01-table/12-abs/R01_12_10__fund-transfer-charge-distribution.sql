/*
Fund transfer changer model for each servicepoint
oid                                      : Surrogate primary key
modelId                                  : Unique model id
servicePointOid                          : Parent table servicepoint oid
chargeJson                               : Charge model details in json
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             FundTransferChargeModel
(
oid                                      varchar(128)                                                not null,
modelId                                  varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
chargeJson                               text                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_FundTransferChargeModel                                  primary key    (oid)
);


