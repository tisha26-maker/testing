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


