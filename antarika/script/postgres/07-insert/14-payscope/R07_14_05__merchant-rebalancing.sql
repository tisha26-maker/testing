-- DppLedgerGroup
insert into DppLedgerGroup (oid, dppLedgerGroupId, name, description) values ('100000','100000','Assets','All Current and Fixed Assets');
insert into DppLedgerGroup (oid, dppLedgerGroupId, name, description) values ('200000','200000','Liabilities','All Current and Fixed Liabilities');
commit;

-- DppLedgerCategory
insert into DppLedgerCategory (oid, dppLedgerCategoryId, name, description, dppLedgerGroupOid) values ('110000','110000','Current Assets','All Current Assets','100000');
insert into DppLedgerCategory (oid, dppLedgerCategoryId, name, description, dppLedgerGroupOid) values ('120000','120000','Fixed Assets','All Fixed Assets','100000');
insert into DppLedgerCategory (oid, dppLedgerCategoryId, name, description, dppLedgerGroupOid) values ('210000','210000','Current Liabilities','All Current Liabilities','200000');
insert into DppLedgerCategory (oid, dppLedgerCategoryId, name, description, dppLedgerGroupOid) values ('220000','220000','Long Term Liabilities','Long Term Liabilities','200000');
commit;

-- DppLedger
insert into DppLedger (oid, dppLedgerId, name, description, dppLedgerType, dppLedgerCategoryOid, status) values ('111000','111000','Marchent Cash','Marchent Cash In Hand','DR','110000','Active');
insert into DppLedger (oid, dppLedgerId, name, description, dppLedgerType, dppLedgerCategoryOid, status) values ('211000','211000','Marchant Payable','Doer to Marchant Payable','CR','210000','Active');
commit;


