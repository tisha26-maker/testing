-- Calendar
insert into Calendar (oid, calendarId, calendarYear, calendarName, description, calendarJson, status) values ('CL0003','CL0003','2018','AgraniABS Work Calendar 2018','AgraniABS Work Calendar 2018 Agent banking','{"weekends":[{"shortName":"Sun","fullName":"Sunday","inx":0,"enabled":false,"startTime":"09:00","endTime":"19:00"},{"shortName":"Mon","fullName":"Monday","inx":1,"enabled":false,"startTime":"09:00","endTime":"19:00"},{"shortName":"Tue","fullName":"Tuesday","inx":2,"enabled":false,"startTime":"09:00","endTime":"19:00"},{"shortName":"Wed","fullName":"Wednesday","inx":3,"enabled":false,"startTime":"09:30","endTime":"19:00"},{"shortName":"Thu","fullName":"Thursday","inx":4,"enabled":false,"startTime":"09:00","endTime":"19:00"},{"shortName":"Fri","fullName":"Friday","inx":5,"enabled":true,"startTime":"09:30","endTime":"17:30"},{"shortName":"Sat","fullName":"Saturday","inx":6,"enabled":true,"startTime":"09:30","endTime":"17:30"}],"holidays":[{"name":"International Mother Language Day","description":"International Mother Language Day","effectiveDate":"2016-02-21"},{"name":"Independence Day","description":"Independence Day","effectiveDate":"2016-03-26"},{"name":"Bangla Noboborsho","description":"Bangla Noboborsho","effectiveDate":"2016-04-14"},{"name":"International Labour Day","description":"International Labour Day","effectiveDate":"2016-05-01"},{"name":"Victory Day","description":"Victory Day","effectiveDate":"2016-12-16"},{"name":"Christmas Day","description":"Christmas Day","effectiveDate":"2016-12-25"}]}','Generated');
commit;

-- CalendarDetails
insert into CalendarDetails (oid, calendarDetailId, calendarOid, calendarYear, effectiveDate, dayName, description, status, dayNum, monthNum, startHour, startMinute, endHour, endMinute) values ('2017-01-05-CL0002-5','2017-01-05-CL0002-5','CL0003','2018','2018-01-08','Monday','Monday','WorkingDay','5','1','1','0','23','0');
commit;

