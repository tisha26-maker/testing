-- UtilityCompany
insert into UtilityCompany (oid, companyName, companyCode, billTypeOid, centralizeBilling, companyStatus) values ('UTC000003','Rangpur Palli Bidyut Samity-2','RPBS-2','BILL-101-101','No','Active');
insert into UtilityCompany (oid, companyName, companyCode, billTypeOid, centralizeBilling, companyStatus) values ('UTC000004','Bogra Palli Bidyut Samity-1','BPBS-1','BILL-101-101','No','Active');
insert into UtilityCompany (oid, companyName, companyCode, billTypeOid, centralizeBilling, companyStatus) values ('UTC000005','Bogra Palli Bidyut Samity-2','BPBS-2','BILL-101-101','No','Active');
insert into UtilityCompany (oid, companyName, companyCode, billTypeOid, centralizeBilling, companyStatus) values ('UTC000001','Thakurgaon Palli Bidyut Samity','TPBS','BILL-101-101','No','Active');
insert into UtilityCompany (oid, companyName, companyCode, billTypeOid, centralizeBilling, companyStatus) values ('UTC000008','Gaibanda Polli Bidyut Samity','GPBS','BILL-101-101','No','Active');
commit;

-- CompanyZone
insert into CompanyZone (oid, zoneName, zoneCode, companyOid, companyZoneStatus) values ('CZ000015','Dupchachia Zone','DZ-01','UTC000004','Active');
insert into CompanyZone (oid, zoneName, zoneCode, companyOid, companyZoneStatus) values ('CZ000013','Gongchora Zone','GZ-01','UTC000003','Active');
insert into CompanyZone (oid, zoneName, zoneCode, companyOid, companyZoneStatus) values ('CZ000006','Thakurgaon Zone','TZ-01','UTC000001','Active');
insert into CompanyZone (oid, zoneName, zoneCode, companyOid, companyZoneStatus) values ('CZ000016','Gabtoli Zone','GZ-001','UTC000005','Active');
insert into CompanyZone (oid, zoneName, zoneCode, companyOid, companyZoneStatus) values ('CZ000018','Ranigonj Zone','RZ-01','UTC000009','Active');
commit;


