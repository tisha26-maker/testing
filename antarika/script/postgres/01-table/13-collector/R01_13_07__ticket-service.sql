/*
This table to be used to store Ticket Service information
oid                                      : Surrogate primary key
csbRequestId                             : Csb request id
serviceProviderName                      : Name of service point
transportId                              : Transport id
transportName                            : Name of Transport
sourceId                                 : Source id
sourceName                               : Source name
destinationId                            : Id of destination
destinationName                          : Name of destination
departureId                              : Id of departure
departureDate                            : Departure date
departureTime                            : Departure time
busId                                    : Id of bus
coachType                                : Type of coach - values to be sent by third party
totalSeat                                : Total number of seat
seatNumber                               : Seat number
totalFare                                : Total fare
boardingPointId                          : Boarding point id
paymentType                              : Payment instrument or payment mode 
passengerInformation                     : Informantion of passenger
transAmount                              : Transaction amount
commisionAmount                          : Commission amount
chargeAmount                             : Charge Amount
vatAmount                                : Vat Amount
crediteAccount                           : To which account amount will transfer
debitAccount                             : From which account amount will transfer
ticketNo                                 : Number of ticker
cbsReferenceNo                           : Cbs transtion Tracking number
traceId                                  : Tracking number
status                                   : Status cancel use for  cancel of reponse, status pending use for  pending of reponse, status ok use for  ok of reponse, 
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent table ServiceTerminal oid
agentStaffOid                            : This is the userId, Who used the android app
createdBy                                : A audit specific column, a foreign key which refers to the primary key of agent table
createdOn                                : A audit specific column, a foreign key which refers to the primary key of agent table
updatedBy                                : A audit specific column, a foreign key which refers to the primary key of agent table
updatedOn                                : A audit specific column, a foreign key which refers to the primary key of agent table
*/
create table                             TicketService
(
oid                                      varchar(128)                                                not null,
csbRequestId                             varchar(128),
serviceProviderName                      varchar(256)                                                not null,
transportId                              varchar(128)                                                not null,
transportName                            varchar(256)                                                not null,
sourceId                                 varchar(128)                                                not null,
sourceName                               varchar(256)                                                not null,
destinationId                            varchar(128)                                                not null,
destinationName                          varchar(256)                                                not null,
departureId                              varchar(128)                                                not null,
departureDate                            date                                                        not null,
departureTime                            timestamp                                                   not null,
busId                                    varchar(128)                                                not null,
coachType                                varchar(64)                                                 not null,
totalSeat                                varchar(256)                                                not null,
seatNumber                               varchar(64)                                                 not null,
totalFare                                numeric(20,6)                                               not null,
boardingPointId                          varchar(128)                                                not null,
paymentType                              varchar(32)                                                 not null,
passengerInformation                     text                                                        not null,
transAmount                              numeric(20,6),
commisionAmount                          numeric(20,6),
chargeAmount                             numeric(20,6),
vatAmount                                numeric(20,6),
crediteAccount                           varchar(64),
debitAccount                             varchar(64),
ticketNo                                 varchar(128),
cbsReferenceNo                           varchar(128),
traceId                                  varchar(128),
status                                   varchar(32)                                                 not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
agentStaffOid                            varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_TicketService                                            primary key    (oid),
constraint                               ck_paymentType_TicketService                                check          (paymentType = 'Cash' or paymentType = 'Account'),
constraint                               ck_status_TicketService                                     check          (status = 'Success' or status = 'Failed' or status = 'Pending' or status = 'Approved'),
constraint                               fk_bankOid_TicketService                                    foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_TicketService                                  foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentOid_TicketService                                   foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_TicketService                            foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_serviceTerminalOid_TicketService                         foreign key    (serviceTerminalOid)
                                                                                                     references     ServiceTerminal(oid),
constraint                               fk_agentStaffOid_TicketService                              foreign key    (agentStaffOid)
                                                                                                     references     AgentStaff(oid)
);


