/*
This table associated to hold area information
oid                                      : areaCode + subAreaCode
areaCode                                 : Bill area identification code
subAreaCode                              : Bill sub-area identification code
areaName                                 : Bill area name
subAreaName                              : Bill sub-area name
bgdclSchemaName                          : From which schema this data pick
*/
create table                             BgdclAreaInfo
(
oid                                      varchar(128)                                                not null,
areaCode                                 varchar(16),
subAreaCode                            	 varchar(16),
areaName                                 varchar(50),
subAreaName                              varchar(50),
bgdclSchemaName                          varchar(128),
constraint                               pk_BgdclAreaInfo                                            primary key    (oid)
);

/*
This table associated to hold customer type
customerTypeCode                         : Customer identification type  code
customerTypeDescription                  : Customer type description
gasRatePerMcf                            : -
gasRatePerCm                             : -
surchargeRate                            : Surgical charge (due to late)
minBillStatus                            : -
status                                   : Csutomer status
bgStatus                                 : Customer bgStatus
daysForDefaulter                         : -
surchargePropagation                     : -
bgdclSchemaName                          : From which schema this data pick
*/
create table                             BgdclCustomerType
(
customerTypeCode                         char                                                        not null,
customerTypeDescription                  varchar(50),
gasRatePerMcf                            numeric(10,2),
gasRatePerCm                             numeric(10,2),
surchargeRate                            numeric(10,2),
minBillStatus                            char,
status                                   char,
bgStatus                                 int,
daysForDefaulter                         int,
surchargePropagation                     int,
bgdclSchemaName                          varchar(128),
constraint                               pk_BgdclCustomerType                                        primary key    (customerTypeCode)
);

/*
This table associated to hold appliance type inforamtion
applianceTypeCode                        : Applicance type identification code
applianceName                            : Appliance name
applianceRate                            : Appliance rate
surchargeRateUpto6months                 : Surcharge rate up to 6 months
surchargeRateAfter6months                : Surcharge rate after 6 months
status                                   : Appliance type status
bgdclSchemaName                          : From which schema this data pick
*/
create table                             BgdclApplianceInfo
(
applianceTypeCode                        char                                                        not null,
applianceName                            varchar(30),
applianceRate                            numeric(7,2),
surchargeRateUpto6months                 numeric(5,2),
surchargeRateAfter6months                numeric(5,2),
status                                   char,
bgdclSchemaName                          varchar(128),
constraint                               pk_BgdclApplianceInfo                                       primary key    (applianceTypeCode)
);

/*
This table associated to hold appliance type inforamtion history
oid                                      : Appliance history primary key
day                                      : Appliance updating day
month                                    : Appliance updating month
year                                     : Appliance updating year
applianceTypeCode                        : Appliance type identification code
applianceName                            : Appliance name
applianceRate                            : Appliance rate
surchargeRateUpto6months                 : Surcharge rate up to 6 months
surchargeRateAfter6months                : Surcharge rate after 6 months
status                                   : Appliance type status
bgdclSchemaName                          : From which schema this data pick
*/
create table                             BgdclApplianceInfoHistory
(
oid                                      varchar(128)                                                not null,
day                                      int,
month                                    int,
year                                     int,
applianceTypeCode                        varchar(2),
applianceName                            varchar(30),
applianceRate                            numeric(7,2),
surchargeRateUpto6months                 numeric(5,2),
surchargeRateAfter6months                numeric(5,2),
status                                   char,
bgdclSchemaName                          varchar(128),
constraint                               pk_BgdclApplianceInfoHistory                                primary key    (oid)
);

/*
This table associated to hold abs charge infromantion
oid                                      : Charge model primary key
chargemodelid                            : Charge Model oid
servicepointoid                          : Service Point oid
gaschargejson                            : Gas charge model specification
createdaccount                           : Creadit account
createdby                                : Who (which login) created the record
createdon                                : When the record was created
updatedby                                : Who (which login) last updated the record
updatedon                                : When the record was last updated
*/
create table                             BgdclBakhrabadChargeModel
(
oid                                      varchar(128)                                                not null,
chargemodelid                            varchar(128),
servicepointoid                          varchar(128),
gaschargejson                            text,
createdaccount                           varchar(128),
createdby                                varchar(128),
createdon                                timestamp,
updatedby                                varchar(128),
updatedon                                timestamp,
constraint                               pk_BgdclBakhrabadChargeModel                                primary key    (oid)
);


