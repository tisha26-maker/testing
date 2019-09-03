
---------------------- customer ----------------------

-- check status
select * from (
(select count(public_customer.*) as public, public_customer.customerstatus as public_status, count(abstest_customer.*) as abstest, abstest_customer.status as abstest_status
from abstest.customer abstest_customer
inner join public.customer public_customer 
on abstest_customer.customerid = public_customer.customerid
group by abstest_status, public_status)
) data_result
order by abstest_status, public_status;

-- check count
(select 'total', count(abstest_customer.*)
from abstest.customer abstest_customer
inner join public.customer public_customer 
on abstest_customer.customerid = public_customer.customerid
)
union
(select 'public_total', count(public_customer.*)
from public.customer public_customer
)
union
(select 'abstest_total', count(abstest_customer.*)
from abstest.customer abstest_customer
);



---------------------- account ----------------------

-- check status
select * from (
(select count(public_account.*) as public, public_account.accountstatus as public_status, count(abstest_account.*) as abstest, abstest_account.status as abstest_status
from abstest.account abstest_account
inner join public.account public_account 
on abstest_account.accountid = public_account.accountid
group by abstest_status, public_status)
) data_result
order by abstest_status, public_status;

-- check count
(select 'total', count(abstest_account.*)
from abstest.account abstest_account
inner join public.account public_account 
on abstest_account.accountid = public_account.accountid
)
union
(select 'public_total', count(public_account.*)
from public.account public_account
)
union
(select 'abstest_total', count(abstest_account.*)
from abstest.account abstest_account
);



---------------------- customeraccount ----------------------

(select 'abstest_customer', count(abstest_customer.*)
from abstest.customer abstest_customer
inner join public.customer public_customer 
on abstest_customer.customerid = public_customer.customerid
)
union
(select 'abstest_account', count(abstest_account.*)
from abstest.account abstest_account
inner join public.account public_account 
on abstest_account.accountid = public_account.accountid
)
union
(select 'abstest_customeraccount', count(abstest_ccaa.*)
from ((abstest.customeraccount abstest_customeraccount
inner join public.customer public_customer
on public_customer.customerid = abstest_customeraccount.customeroid) abstest_cca
inner join public.account public_account
on public_account.accountid = abstest_cca.accountoid) abstest_ccaa
);


---------------------- person ----------------------

(select 'abstest_customer', count(abstest_customer.*)
from abstest.customer abstest_customer
inner join public.customer public_customer 
on abstest_customer.customerid = public_customer.customerid
)
union
(select 'abstest_customerperson', count(abstest_ccp.*)
from (abstest.customerperson abstest_customerperson
inner join public.customer public_customer
on public_customer.customerid = abstest_customerperson.customeroid) abstest_ccp
)
union
(select 'abstest_person', count(abstest_p.*)
from ((abstest.customerperson abstest_customerperson
inner join public.customer public_customer
on public_customer.customerid = abstest_customerperson.customeroid) abstest_ccp
inner join abstest.person abstest_person
on abstest_person.personid = abstest_ccp.personoid) abstest_p
);


---------------------- agent ----------------------

-- check status
select * from (
(select count(public_agent.*) as public, public_agent.status as public_status, count(abstest_agent.*) as abstest, abstest_agent.status as abstest_status
from abstest.agent abstest_agent
inner join public.agent public_agent 
on abstest_agent.agentid = public_agent.agentid
group by abstest_status, public_status)
) data_result
order by abstest_status, public_status;


select abstest_agent.*
from abstest.agent abstest_agent
inner join public.agent public_agent 
on abstest_agent.agentid = public_agent.agentid
where abstest_agent.status = 'Active' and public_agent.status = 'I';

-- check count
(select 'total', count(abstest_agent.*)
from abstest.agent abstest_agent
inner join public.agent public_agent 
on abstest_agent.agentid = public_agent.agentid
)
union
(select 'public_total', count(public_agent.*)
from public.agent public_agent
)
union
(select 'abstest_total', count(abstest_agent.*)
from abstest.agent abstest_agent
);



---------------------- agentaccount ----------------------

-- check accounttype
select * from (
(select count(public_agentaccount.*) as public, public_agentaccount.accounttype as public_accounttype, count(abstest_agentaccount.*) as abstest, abstest_agentaccount.accounttype as abstest_accounttype
from abstest.agentaccount abstest_agentaccount
inner join public.agentaccount public_agentaccount 
on abstest_agentaccount.agentaccountid = public_agentaccount.agentaccid
group by abstest_accounttype, public_accounttype)
) data_result
order by abstest_accounttype, public_accounttype;

-- check count
(select 'total', count(abstest_agentaccount.*)
from abstest.agentaccount abstest_agentaccount
inner join public.agentaccount public_agentaccount 
on abstest_agentaccount.agentaccountid = public_agentaccount.agentaccid
)
union
(select 'public_total', count(public_agentaccount.*)
from public.agentaccount public_agentaccount
)
union
(select 'abstest_total', count(abstest_agentaccount.*)
from abstest.agentaccount abstest_agentaccount
);



---------------------- servicepoint ----------------------

-- check status
select * from (
(select count(public_servicepoint.*) as public, public_servicepoint.servicepointstatus as public_status, count(abstest_servicepoint.*) as abstest, abstest_servicepoint.status as abstest_status
from abstest.servicepoint abstest_servicepoint
inner join public.servicepoint public_servicepoint 
on abstest_servicepoint.servicepointid = public_servicepoint.servicepointid
group by abstest_status, public_status)
) data_result
order by abstest_status, public_status;

-- check count
(select 'total', count(abstest_servicepoint.*)
from abstest.servicepoint abstest_servicepoint
inner join public.servicepoint public_servicepoint 
on abstest_servicepoint.servicepointid = public_servicepoint.servicepointid
)
union
(select 'public_total', count(public_servicepoint.*)
from public.servicepoint public_servicepoint
)
union
(select 'abstest_total', count(abstest_servicepoint.*)
from abstest.servicepoint abstest_servicepoint
);


(select abstest_servicepoint.*
from abstest.servicepoint abstest_servicepoint
)
except all
(select abstest_servicepoint.*
from abstest.servicepoint abstest_servicepoint
inner join public.servicepoint public_servicepoint 
on abstest_servicepoint.servicepointid = public_servicepoint.servicepointid
);



---------------------- serviceterminal ----------------------

-- check status
select * from (
(select count(public_serviceterminal.*) as public, public_serviceterminal.serviceterminalstatus as public_status, count(abstest_serviceterminal.*) as abstest, abstest_serviceterminal.status as abstest_status
from abstest.serviceterminal abstest_serviceterminal
inner join public.serviceterminal public_serviceterminal 
on abstest_serviceterminal.serviceterminalid = public_serviceterminal.serviceterminalid
group by abstest_status, public_status)
) data_result
order by abstest_status, public_status;


select abstest_serviceterminal.*
from abstest.serviceterminal abstest_serviceterminal
inner join public.serviceterminal public_serviceterminal 
on abstest_serviceterminal.serviceterminalid = public_serviceterminal.serviceterminalid
where abstest_serviceterminal.status = 'Active' and public_serviceterminal.serviceterminalstatus = 'I';


-- check count
(select 'total', count(abstest_serviceterminal.*)
from abstest.serviceterminal abstest_serviceterminal
inner join public.serviceterminal public_serviceterminal 
on abstest_serviceterminal.serviceterminalid = public_serviceterminal.serviceterminalid
)
union
(select 'public_total', count(public_serviceterminal.*)
from public.serviceterminal public_serviceterminal
)
union
(select 'abstest_total', count(abstest_serviceterminal.*)
from abstest.serviceterminal abstest_serviceterminal
);




---------------------- translog ----------------------

-- check status
select * from (
(select count(public_translog.*) as public, public_translog.transstatus as public_status, count(abstest_translog.*) as abstest, abstest_translog.transstatus as abstest_status
from abstest.translog abstest_translog
inner join public.translog public_translog 
on abstest_translog.requestid = public_translog.requestid
group by abstest_status, public_status)
) data_result
order by abstest_status, public_status;

-- check count
(select 'total', count(abstest_translog.*)
from abstest.translog abstest_translog
inner join public.translog public_translog 
on abstest_translog.requestid = public_translog.requestid
)
union
(select 'public_total', count(public_translog.*)
from public.translog public_translog
)
union
(select 'abstest_total', count(abstest_translog.*)
from abstest.translog abstest_translog
);



---------------------- remittance ----------------------

-- check status
select * from (
(select count(public_remittance.*) as public, public_remittance.status as public_status, count(abstest_remittance.*) as abstest, abstest_remittance.status as abstest_status
from abstest.remittance abstest_remittance
inner join public.remittance public_remittance 
on abstest_remittance.ifrid = public_remittance.ifrid
group by abstest_status, public_status)
) data_result
order by abstest_status, public_status;

-- check count
(select 'total', count(abstest_remittance.*)
from abstest.remittance abstest_remittance
inner join public.remittance public_remittance 
on abstest_remittance.ifrid = public_remittance.ifrid
)
union
(select 'public_total', count(public_remittance.*)
from public.remittance public_remittance
)
union
(select 'abstest_total', count(abstest_remittance.*)
from abstest.remittance abstest_remittance
);


select abstest_remittance.*
from abstest.remittance abstest_remittance
inner join public.remittance public_remittance 
on abstest_remittance.ifrid = public_remittance.ifrid
where abstest_remittance.status = 'Disbursed' and public_remittance.status = 'BA';







