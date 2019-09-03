-- DROP FUNCTION IF EXISTS increment(INT);
CREATE OR REPLACE FUNCTION increment(i INT)
	RETURNS INT AS
$$
    BEGIN
      RETURN i + 1;
    END;
$$
LANGUAGE plpgsql;

 -- An example how to use the function (Returns: 11)
-- SELECT increment(10);


create type weekendType as (shortName varchar(64), fullName varchar(64), inx numeric(8,0), enabled boolean, startTime varchar(64), endTime varchar(64));
create type holidayType as (name varchar(64), description text, effectiveDate date);

create or replace function proc_generate_calendar (calID varchar(64), chngby varchar(64), weekendRec weekendType[], holidayRec holidayType[]) 
returns void as $proc_generate_calendar$
	declare
		calendarCoursor CURSOR FOR select * from UnauthCalendar where calendarID = calID;
		i 												integer;
		daysOfYear										integer;
		weekendRecords 									weekendType[];
		holidayRecords 									holidayType[];
		weekendRecord									weekendType;
		holidayRecord									holidayType;
		weekDetailIDs			 						integer[];
		status											varchar(8);
		statusHoliday									varchar(8);
		statusWorkDay									varchar(8);
		statusWeekend									varchar(8);
		statusGenerate									varchar(8);
		calendarDay										varchar(8);
		calendarMonth									varchar(8);
		startHour										varchar(8);
		startMunite										varchar(8);
		endHour											varchar(8);
		endMunite										varchar(8);
		oid												varchar(64);
		cid												varchar(64);
		cYear											varchar(64);
		calendarDateStr									varchar(16);
		calendarDate									date;
		calendarDetailRow								calendardetails%rowtype;

	begin
		statusHoliday := 'Holiday'; statusWorkDay := 'WorkingDay'; statusWeekend := 'Weekend';
		weekendRecords := weekendRec;
		holidayRecords := holidayRec;

		for cal in calendarCoursor loop
			cid := calID;
			cYear := cal.calendarYear;
			calendarDateStr := CONCAT(cal.calendarYear, '-01-01');
			calendarDate := to_date(calendarDateStr, 'YYYY-MM-DD');
			daysOfYear := 365;

			IF extract(year from (to_date(calendarDateStr, 'YYYY-MM-DD') + integer '365'))='2020' or extract(year from (to_date(calendarDateStr, 'YYYY-MM-DD') + integer '365'))='2024' then
				daysOfYear := 366;
			end IF;

			i := 0;
			loop
				i := i+1;
				IF i > daysOfYear then
			        EXIT;
			    end IF;

				weekendRecord := weekendRecords[extract(DOW from (calendarDate)) + 1];
			    calendarDateStr := to_char(calendarDate, 'YYYY-MM-DD');
			    calendarDay := extract(DAY from date(calendarDate));
			    calendarMonth := extract(MONTH from date(calendarDate));
			    startHour := substring(weekendRecord.startTime from 1 for 2);
			    startMunite := substring(weekendRecord.startTime from 4 for 2);
			    endHour := substring(weekendRecord.endTime from 1 for 2);
			    endMunite := substring(weekendRecord.endTime from 4 for 2);
			    oid := concat(calendarDateStr, '-', calID, '-', i);

			    IF weekendRecord.enabled then
			    	status := statusWeekend;
			    else
			    	status := statusWorkDay;
			    end IF;

				insert into UnauthCalendarDetails
				(calendardetailid, calendarID, calendaryear, effectivedate, name, description, status, daynum, monthnum, starthour,
				startminute, endhour, endminute, createdBy, createdon)
				values(oid, cid, cYear, calendarDate, weekendRecord.fullName, weekendRecord.fullName, status, calendarDay, calendarMonth,
				startHour, startMunite, endHour, endMunite, chngby, now());

				calendarDate := (calendarDate + integer '1');
			end loop;

			i := 0;
			foreach holidayRecord in array holidayRecords loop
			    calendarDay := extract(DAY from date(holidayRecord.effectiveDate));
			    calendarMonth := extract(MONTH from date(holidayRecord.effectiveDate));
				i := i+1;

				for calendarDetailRow in select * from UnauthCalendarDetails where effectiveDate = holidayRecord.effectiveDate and calendarID = calID loop
			       if calendarDetailRow.status = statusWorkDay then
			       		update calendardetails set name = holidayRecord.name, description = holidayRecord.description,
			       		status = statusHoliday, updatedBy = chngby, updatedOn = now()
			       		where calendarDetailID = calendarDetailRow.calendarDetailID;
			       else
			       		insert into UnauthCalendarDetails
						(calendardetailid, calendarID, calendaryear, effectivedate, name, description, status, daynum, monthnum,
						createdBy, createdon)
						values(
						CONCAT(calendarDetailRow.calendarDetailID, '-', i), calID, calendarDetailRow.calendarYear, holidayRecord.effectiveDate,
						holidayRecord.name, holidayRecord.description, statusHoliday, calendarDay, calendarMonth, chngby, now());
			       end if;
			    end loop;
       		end loop;
		end loop;
	end;

$proc_generate_calendar$ language plpgsql;
