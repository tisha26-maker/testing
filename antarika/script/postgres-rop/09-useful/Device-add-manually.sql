INSERT INTO abstest.carddevice
("oid", carddeviceid, identifier, carddevicemodeloid, devicestatus, devicestatusupdatedon, description, comments, status, currentversion, isnewrecord, approvedby, approvedon, createdby, createdon, editedby, editedon)
VALUES(
(select 'CD'||LPAD(((substring(max("oid"), 3, 7)::int)+1)::text, 7, '0') from abstest.carddevice), 
(select 'CD'||LPAD(((substring(max("carddeviceid"), 3, 7)::int)+1)::text, 7, '0') from abstest.carddevice), 
'359475076064907/DATECS-DPP-250', 'EVOLUTE-IMPRESS', 'Assigned', '2017-10-14 21:14:36.411', NULL, NULL, 'Active', '1', NULL, NULL, NULL, 'golam.kibria', '2017-10-14 21:13:16.884', NULL, '2017-10-14 21:14:36.411');


INSERT INTO abstest.clientdevice
("oid", clientdeviceid, identifier, optionalidentifier, clientdevicemodeloid, devicestatus, devicestatusupdatedon, description, comments, status, currentversion, isnewrecord, approvedby, approvedon, createdby, createdon, editedby, editedon)
VALUES(
(select 'CLD'||LPAD(((substring(max("oid"), 4, 7)::int)+1)::text, 7, '0') from abstest.clientdevice), 
(select 'CLD'||LPAD(((substring(max("clientdeviceid"), 4, 7)::int)+1)::text, 7, '0') from abstest.clientdevice), 
'359475076064907', '359475076064907', 'SAMSUNG-GALAXY J MAX', 'Assigned', '2017-09-25 03:42:01.471', NULL, NULL, 'Active', '1', NULL, NULL, NULL, 'BIKARUN.NESA', '2016-05-31 17:27:58.468', 'TANIA.AKTHER', '2017-09-25 03:42:01.471');

INSERT INTO abstest.printerdevice
("oid", printerdeviceid, identifier, printerdevicemodeloid, devicestatus, devicestatusupdatedon, description, comments, status, currentversion, isnewrecord, approvedby, approvedon, createdby, createdon, editedby, editedon)
VALUES(
(select 'PD'||LPAD(((substring(max("oid"), 3, 7)::int)+1)::text, 7, '0') from abstest.printerdevice), 
(select 'PD'||LPAD(((substring(max("printerdeviceid"), 3, 7)::int)+1)::text, 7, '0') from abstest.printerdevice), 
'DC:0D:30:07:A7:92', 'EVOLUTE-IMPRESS', 'Assigned', '2017-12-17 14:24:33.708', NULL, NULL, 'Active', '1', NULL, NULL, NULL, 'RADIA.ZIA', '2017-11-29 13:02:20.459', 'TANIA.AKTHER', '2017-12-17 14:24:33.708');

INSERT INTO abstest.fpdevice
("oid", fpdeviceid, identifier, fpdevicemodeloid, devicestatus, devicestatusupdatedon, description, comments, status, currentversion, isnewrecord, approvedby, approvedon, createdby, createdon, editedby, editedon)
VALUES(
(select 'FD'||LPAD(((substring(max("oid"), 3, 7)::int)+1)::text, 7, '0') from abstest.fpdevice), 
(select 'FD'||LPAD(((substring(max("fpdeviceid"), 3, 7)::int)+1)::text, 7, '0') from abstest.fpdevice), 
'359475076064907', 'Morpho-MSO1300E2', 'Assigned', '2017-12-17 14:24:33.708', NULL, NULL, 'Active', '1', NULL, NULL, NULL, 'RADIA.ZIA', '2017-11-29 13:02:20.459', 'TANIA.AKTHER', '2017-12-17 14:24:33.708');

INSERT INTO abstest.serviceterminal
("oid", serviceterminalid, servicepointoid, fpdeviceoid, clientdeviceoid, printerdeviceoid, carddeviceoid, bankoid, branchoid, agentoid, status, description, comments, currentversion, isnewrecord, approverremarks, approvedby, approvedon, createdby, createdon, editedby, editedon)
VALUES(
(select 'ST'||LPAD(((substring(max("oid"), 3, 7)::int)+1)::text, 7, '0') from abstest.serviceterminal), 
(select 'ST'||LPAD(((substring(max("serviceterminalid"), 3, 7)::int)+1)::text, 7, '0') from abstest.serviceterminal), 
'193305', 
(select max("oid") from abstest.fpdevice), 
(select max("oid") from abstest.clientdevice), 
(select max("oid") from abstest.printerdevice), 
(select max("oid") from abstest.carddevice), 
'010', 'BD0016813', 'AG000144', 'Active', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'golam.kibria', '2017-09-19 11:44:57.208', 'TANIA.AKTHER', '2017-09-20 02:56:06.490');

