/*
Person social media information stored here. facebook, imo, etc
oid                                      : surrogate primary key
socialMediaId                            : Key for the Remittance
personOid                                : associated person oid
socialMediaJson                          : Media type like facebook
otherValue                               : value set here like facebookId
*/
create table                             SocialMedia
(
oid                                      varchar(128)                                                not null,
socialMediaId                            varchar(128)                                                not null,
personOid                                varchar(128)                                                not null,
socialMediaJson                          varchar(1024)                                               not null,
otherValue                               varchar(1024)                                               not null
);


