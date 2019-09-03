/*
This table is used to store top menu list and detail information about the menu
oid                                      : Surrogate primary key
topMenuResourceId                        : Id of top menu
menuDefaultText                          : This text will be shown in menu. Menu Name eg. Account, Customer...
menuSequence                             : Ordering sequence of the item
createdBy                                : Who (which login) created the record
createdOn                                : When create
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When update
*/
create table                             TopMenu
(
oid                                      varchar(128)                                                not null,
topMenuResourceId                        varchar(128)                                                not null,
menuDefaultText                          varchar(128)                                                not null,
menuSequence                             varchar(4)                                                  not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_TopMenu                                                  primary key    (oid)
);

/*
This table is used to store left menu list and detail information about the menu
oid                                      :  
leftMenuResourceId                       : Id of Left Menu
topMenuOid                               : Top menu id
menuDefaultText                          : This text will be shown
menuSequence                             : Ordering sequence of the item
createdBy                                : Who (which login) created the record
createdOn                                : When create
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When update
*/
create table                             LeftMenu
(
oid                                      varchar(128)                                                not null,
leftMenuResourceId                       varchar(128)                                                not null,
topMenuOid                               varchar(128)                                                not null,
menuDefaultText                          varchar(256)                                                not null,
menuSequence                             numeric(4,0)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_LeftMenu                                                 primary key    (oid),
constraint                               fk_topMenuOid_LeftMenu                                      foreign key    (topMenuOid)
                                                                                                     references     TopMenu(oid)
);

/*
This table stores user role information along with a role's menu access definition
oid                                      : Surrogate primary key
roleId                                   : Id of role
domain                                   : User Domain like BANK, DOER, AGENT
roleDescription                          : Description of role
status                                   : Role status - A/I/BM/BC/BA
menuJson                                 : Which menus are accessable in portal
appMenuJson                              : Which menus are accessable in app
appReportJson                            : Which menus are accessable in cellostics-user
makerRole                                : Who can make the role. Role Id will be here.
checkerRole                              : Who can chek the role. Role Id will be here.
approverRole                             : Who can approv the role. Role Id will be here.
rejecterRole                             : Who can reject the role. Role Id will be here.
activatorRole                            : Who can activate the role. Role Id will be here.
deactivatorRole                          : Who can deactivate the role. Role Id will be here.
blockerRole                              : Who can block the role. Role Id will be here.
unblockerRole                            : Who can unblock the role. Role Id will be here.
makeEditableRole                         : Who can makeeditable the role. Role Id will be here.
closerRole                               : Who can close the role. Role Id will be here.
rejectionCause                           : Will put a note why reject it
createdBy                                : who (which login) created the record
createdOn                                : when the record was created
updatedBy                                : who (which login) last updated the record
updatedOn                                : when the record was last updated
*/
create table                             Role
(
oid                                      varchar(128)                                                not null,
roleId                                   varchar(128)                                                not null,
domain                                   varchar(32),
roleDescription                          text                                                        not null,
status                                   varchar(32),
menuJson                                 text,
appMenuJson                              text,
appReportJson                            text,
makerRole                                varchar(128),
checkerRole                              varchar(128),
approverRole                             varchar(128),
rejecterRole                             varchar(128),
activatorRole                            varchar(128),
deactivatorRole                          varchar(128),
blockerRole                              varchar(128),
unblockerRole                            varchar(128),
makeEditableRole                         varchar(128),
closerRole                               varchar(128),
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_Role                                                     primary key    (oid),
constraint                               ck_status_Role                                              check          (status = 'Active' or status = 'Inactive' or status = 'BankMade' or status = 'BankCancled' or status = 'BankApproved')
);


