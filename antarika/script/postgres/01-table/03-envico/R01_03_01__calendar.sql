/*
Calendar is the table for storing all about list of calendar name and description.
oid                                      : Surrogate primary key
calendarId                               : Key for the Calendar
calendarYear                             : Year of the calendar
calendarName                             : Name of the calendar
description                              : Description of the calendar
calendarJson                             : Calendar JSON will hold working time, weekend and fixed holiday information
{"workingTime":{"startHour":"10","startMinute":"30","endHour":"07","endMinute":"30"},"weekends":[{"shortName":"Sun","fullName":"Sunday","index":0,"enabled":false},{"shortName":"Mon","fullName":"Monday","index":1,"enabled":false},{"shortName":"Tue","fullName":"Tuesday","index":2,"enabled":false},{"shortName":"Wed","fullName":"Wednesday","index":3,"enabled":false},{"shortName":"Thu","fullName":"Thursday","index":4,"enabled":false},{"shortName":"Fri","fullName":"Friday","index":5,"enabled":true},{"shortName":"Sat","fullName":"Saturday","index":6,"enabled":true}],"holidays":[{"name":"Language Day","description":"International Mother Language Day","effectiveDate":"2016-02-21","calendarYear":"2016","monthNum":"01","dayNum":"21"},{"name":"Independent Day","description":"Independent Day","effectiveDate":"2016-03-26","calendarYear":"2016","monthNum":"02","dayNum":"26"}]}
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of calendar
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthCalendar
(
oid                                      varchar(128)                                                not null,
calendarId                               varchar(128)                                                not null,
calendarYear                             varchar(4)                                                  not null,
calendarName                             varchar(256)                                                not null,
description                              text,
calendarJson                             text,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
editcommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthCalendar                                           primary key    (oid),
constraint                               ck_status_UnauthCalendar                                    check          (status = 'Submitted' or status = 'Generated'),
constraint                               ck_editcommit_UnauthCalendar                                check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthCalendar                         check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthCalendar                               check          (isNewRecord = 'Yes' or isNewRecord = 'No')
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
create table                             UnauthCalendarDetails
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
constraint                               pk_UnauthCalendarDetails                                    primary key    (oid),
constraint                               fk_calendarOid_UnauthCalendarDetails                        foreign key    (calendarOid)
                                                                                                     references     UnauthCalendar(oid),
constraint                               ck_status_UnauthCalendarDetails                             check          (status = 'Weekend' or status = 'Holiday' or status = 'WorkingDay')
);


