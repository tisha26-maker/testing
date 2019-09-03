/*
This table to be used to store Source and Destination Name information
oid                                      : Surrogate primary key
locationId                               : Location id
sourceDestinationName                    : Parribahan source and destination name
localName                                : Source and destination name to be viewed
alternateName                            : For random used
createdBy                                : A audit specific column, a foreign key which refers to the primary key of agent table
createdOn                                : A audit specific column, a foreign key which refers to the primary key of agent table
updatedBy                                : A audit specific column, a foreign key which refers to the primary key of agent table
updatedOn                                : A audit specific column, a foreign key which refers to the primary key of agent table
*/
create table                             BusBdSourceDestination
(
oid                                      varchar(128)                                                not null,
locationId                               varchar(128)                                                not null,
sourceDestinationName                    varchar(256),
localName                                varchar(256)                                                not null,
alternateName                            varchar(256),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_BusBdSourceDestination                                   primary key    (oid),
constraint                               u_locationId_BusBdSourceDestination                         unique         (locationId)
);

/*
This table to be used to store Busbd Charge Model information
oid                                      : Surrogate primary key
companyName                              : Name of company
busType                                  : bustypes are classifications like ac, non-ac etc.
commision                                : Total commission
intouchCommision                         : Provider commission
doerCommision                            : Doer commission
paymentMethod                            : What is this columns indicate payment instrument or payment mood. 
createdBy                                : A audit specific column, a foreign key which refers to the primary key of agent table
createdOn                                : A audit specific column, a foreign key which refers to the primary key of agent table
updatedBy                                : A audit specific column, a foreign key which refers to the primary key of agent table
updatedOn                                : A audit specific column, a foreign key which refers to the primary key of agent table
*/
create table                             BusbdChargeModel
(
oid                                      varchar(128)                                                not null,
companyName                              varchar(256)                                                not null,
busType                                  varchar(32),
commision                                numeric(20,6)                                               not null,
intouchCommision                         numeric(20,6)                                               not null,
doerCommision                            numeric(20,6)                                               not null,
paymentMethod                            varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_BusbdChargeModel                                         primary key    (oid),
constraint                               ck_busType_BusbdChargeModel                                 check          (busType = 'A/C' or busType = 'Non-A/C')
);


