create or replace function proc_generate_calendar ()
RETURNS TRIGGER AS $proc_generate_calendar$
	DECLARE
		i 													integer;	
		p_calendarJson 										json;
		weekendRecords                                     	json;
    	holidayRecords                                     	json;
    	weekendRecord                                    	json;
        holidayRecord                                    	json;
        calendarDateStr                                    	varchar(64);
        calendarDate                                    	date;
        daysOfYear                                        	integer;
        cid                                               	varchar(64);
        cYear                                            	varchar(64);
        daysOfWeek											int;
       	iHoliday											json;
       	statusHoliday										varchar(64);
      	statusWorkDay										varchar(64);
     	statusWeekend										varchar(64);
		statusGenerate										varchar(64);
		calendarDay											varchar(64);
		calendarMonth										varchar(64);
		startTime											varchar(64);
		endTime												varchar(64);
		startHour											varchar(64);
		startMinute											varchar(64);
		endHour												varchar(64);
		endMinute											varchar(64);
		fullName											varchar(256);
		shortName											varchar(32);
		oid													varchar(64);
		status												varchar(64);
		calendarDetailRow									calendardetails%rowtype;
		enabled												varchar(64);

	BEGIN		
				
		IF (NEW.isNewRecord = 'Yes') THEN
			statusHoliday := 'Holiday'; statusWorkDay := 'WorkingDay'; statusWeekend := 'Weekend';
			p_calendarJson := cast(NEW.calendarjson AS json);
     		weekendRecords :=  p_calendarJson ->> 'weeksName';
    		holidayRecords :=  p_calendarJson ->> 'holidaysName';
		
	  		cid := NEW.oid;
    		cYear := NEW.calendarYear;
    		calendarDateStr := CONCAT(NEW.calendarYear, '-01-01');
    		calendarDate := to_date(calendarDateStr, 'YYYY-MM-DD');
    		daysOfYear := 365;

			IF extract(year from (to_date(calendarDateStr, 'YYYY-MM-DD') + integer '365'))='2020' or extract(year from (to_date(calendarDateStr, 'YYYY-MM-DD') + integer '365'))='2024' then
				daysOfYear := 366;
			END IF;

			i := 0;
			LOOP
				i := i+1;
				IF i > daysOfYear then
			        EXIT;
			    END IF;			   
			       	
    			daysOfWeek := extract(DOW from (calendarDate)); 			  
	     		weekendRecord := weekendRecords -> daysOfWeek;
	     		calendarDateStr := to_char(calendarDate, 'YYYY-MM-DD');
	     		calendarDay := extract(DAY from date(calendarDate));
			    calendarMonth := extract(MONTH from date(calendarDate));
			   	fullName := weekendRecord ->> 'fullName';
	     		shortName := weekendRecord ->> 'shortName';			   
			   	startHour := substring(weekendRecord ->> 'startTime' from 1 for 2);
			    startMinute := substring(weekendRecord ->> 'startTime' from 4 for 2);
			    endHour := substring(weekendRecord ->> 'endTime' from 1 for 2);
			    endMinute := substring(weekendRecord ->> 'endTime' from 4 for 2);
			   	oid := concat(calendarDateStr, '-', new.oid, '-', i);  

			    IF weekendRecord ->> 'enabled' THEN
			    	status := statusWeekend;
			    ELSE
			    	status := statusWorkDay;
			    END IF;

				INSERT INTO UnauthCalendarDetails
				(oid, calendardetailid, calendarOid, calendaryear, effectivedate, dayName, description, status, daynum, monthnum, starthour,
				startminute, endhour, endminute, createdBy, createdon)
				values(oid, oid, cid, cYear, calendarDate, fullName, fullName, status, calendarDay, calendarMonth,
				startHour, startMinute, endHour, endMinute, new.createdBy, now());

				calendarDate := (calendarDate + integer '1');
			END LOOP;
		
			i := 0;
			 /*FOR holidayRecord IN SELECT * FROM json_array_elements(holidayRecords) LOOP
			    calendarDay := extract(DAY from date(holidayRecord ->> 'effectiveDate'));
			    calendarMonth := extract(MONTH from date(holidayRecord ->> 'effectiveDate'));
				i := i+1;
				
				for calendarDetailRow in select * from UnauthCalendarDetails where effectiveDate = holidayRecord ->> 'effectiveDate' and calendarOid = new.oid loop
			      if calendarDetailRow.status = statusWorkDay then
			       		update UnauthCalendarDetails set dayName = holidayRecord ->> 'name', description = holidayRecord ->> 'description',
			       		status = statusHoliday, editedBy = new.createdBy, editedOn = now()
			       		where calendarDetailID = calendarDetailRow.calendarDetailID;
			       else
			       		insert into UnauthCalendarDetails
						(oid, calendardetailid, calendarOid, calendaryear, effectivedate, dayName, description, status, daynum, monthnum,
						createdBy, createdOn)
						values(CONCAT(calendarDetailRow.calendarDetailID, '-', i),
						CONCAT(calendarDetailRow.calendarDetailID, '-', i), new.oid, calendarDetailRow.calendarYear, holidayRecord ->> 'effectiveDate',
						holidayRecord ->> 'name', holidayRecord ->> 'description', statusHoliday, calendarDay, calendarMonth, new.createdBy, now());
			       end if;
			    end loop;
       		end loop;*/
		end if;
		return null;
	END;

$proc_generate_calendar$ language plpgsql;

