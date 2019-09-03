-- Check Logged in User --
select containerName, requestsource, requestsourceservice, requestReceivedOn, responseTimeInMs, (requestJson::json->>'body')::json->>'userId' as userId from antarikaRequestLog where requestReceivedOn::date = '2018-02-10' and containerName in ('cecurity-service-0', 'cecurity-service-1') and requestsource in ('teller-app') and requestSourceService in ('authenticate-user') order by requestReceivedOn desc, responseTimeInMs desc limit 35;

-- Check in Login count --
select count(containerName), (requestJson::json->>'body')::json->>'userId' as userId, username from antarikaRequestLog, login where login.loginId = (requestJson::json->>'body')::json->>'userId' and requestReceivedOn::date = '2018-02-10' and containerName in ('cecurity-service-0', 'cecurity-service-1') and requestsource in ('teller-app') and requestSourceService in ('authenticate-user') group by userId, username order by count desc;
