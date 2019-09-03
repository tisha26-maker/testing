/*
Calendar is the table for storing all about list of calendar name and description.
oid                                      : Surrogate primary key
calendarId                               : Key for the Calendar
calendarYear                             : Year of the calendar
calendarName                             : Name of the calendar
description                              : Description of the calendar
calendarJson                             : Calendar JSON will hold working time, weekend and fixed holiday information
{"workingTime":{"startHour":"10","startMinute":"30","endHour":"07","endMinute":"30"},"weekends":[{"shortName":"Sun","fullName":"Sunday","index":0,"enabled":false},{"shortName":"Mon","fullName":"Monday","index":1,"enabled":false},{"shortName":"Tue","fullName":"Tuesday","index":2,"enabled":false},{"shortName":"Wed","fullName":"Wednesday","index":3,"enabled":false},{"shortName":"Thu","fullName":"Thursday","index":4,"enabled":false},{"shortName":"Fri","fullName":"Friday","index":5,"enabled":true},{"shortName":"Sat","fullName":"Saturday","index":6,"enabled":true}],"holidays":[{"name":"Language Day","description":"International Mother Language Day","effectiveDate":"2016-02-21","calendarYear":"2016","monthNum":"01","dayNum":"21"},{"name":"Independent Day","description":"Independent Day","effectiveDate":"2016-03-26","calendarYear":"2016","monthNum":"02","dayNum":"26"}]}
status                                   : Status : (S) ubmitted, (G) enerated
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             Calendar
(
oid                                      varchar(128)                                                not null,
calendarId                               varchar(128)                                                not null,
calendarYear                             varchar(4)                                                  not null,
calendarName                             varchar(256)                                                not null,
description                              text,
calendarJson                             text,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_Calendar                                                 primary key    (oid),
constraint                               ck_status_Calendar                                          check          (status = 'Submitted' or status = 'Generated')
);

/*
CalendarDetails is the table for storing all about holiday, weekend or working day.
oid                                      : Surrogated primary key
calendarDetailId                         : Calendar detail associated with System to be Identified by calendarDetailId
calendarOid                              : Foreign key reference of Calender table oid
calendarYear                             : Year of the calendar
effectiveDate                            : On which date it is effective
dayName                                  : Name of the day
description                              : Description of the day
status                                   : Status of the day - Weekend (WE) , Holiday (HD) , WorkDay (WD) 
dayNum                                   : Number of the day within the month
monthNum                                 : Number of the month
startHour                                : If working day start hour of the day
startMinute                              : If working day start minute of the day
endHour                                  : If working day end hour of the day
endMinute                                : If working day end minute of the day
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             CalendarDetails
(
oid                                      varchar(128)                                                not null,
calendarDetailId                         varchar(128)                                                not null,
calendarOid                              varchar(128)                                                not null,
calendarYear                             varchar(4)                                                  not null,
effectiveDate                            date                                                        not null,
dayName                                  varchar(256)                                                not null,
description                              text,
status                                   varchar(32)                                                 not null,
dayNum                                   numeric(2,0)                                                not null,
monthNum                                 numeric(2,0)                                                not null,
startHour                                numeric(2,0),
startMinute                              numeric(2,0),
endHour                                  numeric(2,0),
endMinute                                numeric(2,0),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_CalendarDetails                                          primary key    (oid),
constraint                               fk_calendarOid_CalendarDetails                              foreign key    (calendarOid)
                                                                                                     references     Calendar(oid),
constraint                               ck_status_CalendarDetails                                   check          (status = 'Weekend' or status = 'Holiday' or status = 'WorkingDay')
);

/*
Holiday is the table for storing all Fixed Holiday
oid                                      : Surrogate primary key
holidayId                                : Key for the Holiday
name                                     : Name of the calendar
description                              : Description of the calendar
dayNum                                   : Number of the day within the month
monthNum                                 : Number of the month
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             Holiday
(
oid                                      varchar(128)                                                not null,
holidayId                                varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
description                              text,
dayNum                                   numeric(2,0)                                                not null,
monthNum                                 numeric(2,0)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_Holiday                                                  primary key    (oid)
);


