/*
Log for every request to (and response from) Antarika
oid                                      : Surrogate primary key
containerName                            : Name of container
status                                   : Request status
requestReceivedOn                        : When request received
responseSentOn                           : When response sent
responseTimeInMs                         : Response return time
requestSource                            : Which product sent request
requestSourceService                     : Which service sent request
requestJson                              : Request JSON
responseJson                             : Response JSON
startSequence                            : Sequence start
endSequence                              : Sequence end
traceId                                  : Request trace id
*/
create table                             AntarikaRequestLog
(
oid                                      varchar(128)                                                not null,
containerName                            varchar(256)                                                not null,
status                                   varchar(32)                                                 not null,
requestReceivedOn                        timestamp                                                   not null,
responseSentOn                           timestamp,
responseTimeInMs                         numeric(10,0)                                               not null       default 0,
requestSource                            varchar(256)                                                not null,
requestSourceService                     varchar(256)                                                not null,
requestJson                              text                                                        not null,
responseJson                             text,
startSequence                            numeric(10,0)                                               not null       default 0,
endSequence                              numeric(10,0)                                               not null       default 0,
traceId                                  varchar(16)                                                 not null,
constraint                               ck_status_AntarikaRequestLog                                check          (status = 'RequestReceived' or status = 'SentForProcessing' or status = 'ReceivedAfterProcessing' or status = 'ResponseSent')
) partition by range (requestReceivedOn);

/*
Audit Log for tracing every change in every table
oid                                      : Surrogate primary key
sectionName                              : Name of section
tableName                                : Name of table
rowKey                                   : Row unique key
timeOfAction                             : When action occured
actionType                               : Type of action
actionSource                             : Which product send this request
actionUser                               : Who (which login id) insert ro update or delete
rowImageBefore                           : Before change this data
rowImageAfter                            : After change this data
*/
create table                             AuditLog
(
oid                                      varchar(128)                                                not null,
sectionName                              varchar(256),
tableName                                varchar(256)                                                not null,
rowKey                                   varchar(128)                                                not null,
timeOfAction                             timestamp                                                   not null,
actionType                               varchar(32)                                                 not null,
actionSource                             varchar(32)                                                 not null,
actionUser                               varchar(128)                                                not null,
rowImageBefore                           text,
rowImageAfter                            text,
constraint                               ck_actionType_AuditLog                                      check          (actionType = 'Insert' or actionType = 'Update' or actionType = 'Delete'),
constraint                               ck_actionSource_AuditLog                                    check          (actionSource = 'User' or actionSource = 'System' or actionSource = 'Admin')
) partition by range (timeOfAction);


