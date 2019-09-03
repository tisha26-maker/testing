/*
Associated Bank information to be stored here
oid                                      : Surrogate primary key
bankId                                   : Bank Id as per Bangladesh Bank coding
bankName                                 : Name of the bank
status                                   : Status of the bank - BankMade, BankApproved, Active, Inactive, BankRejected
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             Bank
(
oid                                      varchar(128)                                                not null,
bankId                                   varchar(128)                                                not null,
bankName                                 varchar(128)                                                not null,
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_Bank                                                     primary key    (oid),
constraint                               ck_status_Bank                                              check          (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable')
);

/*
Branch information of associated banks
oid                                      : Surrogate primary key
branchId                                 : A associated bank branch with system to be identified by branchId
bankOid                                  : BankId indicated respective Bank which associated branch
branchName                               : A bank name associated with system
mnemonic                                 : Branch mnemonic
address                                  : Associated branch address
telephoneNo                              : Branch telephone number
telephoneNo2                             : Branch telephone number 2
email                                    : Branch email address
nameOfManager                            : Branch manager name
telephoneNoOfManager                     : Branch manager telephone number
geoLocationLat                           : Branch location latitude
geoLocationLong                          : Branch location longitude
accountNoForChargeModel                  : Defined account number for charge model
status                                   : Status of brnch - BankMade, BankApproved, Active, Inactive, BankRejected
rejectionCause                           : Will put a note why reject it
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             Branch
(
oid                                      varchar(128)                                                not null,
branchId                                 varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchName                               varchar(128)                                                not null,
mnemonic                                 varchar(64),
address                                  text,
telephoneNo                              varchar(64),
telephoneNo2                             varchar(64),
email                                    varchar(128),
nameOfManager                            varchar(256),
telephoneNoOfManager                     varchar(64),
geoLocationLat                           numeric(20,8),
geoLocationLong                          numeric(20,8),
accountNoForChargeModel                  varchar(128),
status                                   varchar(32),
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_Branch                                                   primary key    (oid),
constraint                               fk_bankOid_Branch                                           foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               ck_status_Branch                                            check          (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable')
);


