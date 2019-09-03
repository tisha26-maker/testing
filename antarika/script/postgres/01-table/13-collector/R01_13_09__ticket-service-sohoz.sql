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
create table                             SohozSourceDestination
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
constraint                               pk_SohozSourceDestination                                   primary key    (oid),
constraint                               u_locationId_SohozSourceDestination                         unique         (locationId)
);


