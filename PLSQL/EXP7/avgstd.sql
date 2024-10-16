set serveroutput on
DECLARE
	average number(5);
	Rno number(5);
	nm Varchar2(10);
	f_date Varchar2(20);
	f_day Varchar2(20);
	error boolean := false;
	
BEGIN	
	Rno := &Rno;
	select ((mark1+mark2+mark3)/3) into average from student where rollno = Rno;
	select name into nm from student where rollno = Rno;
	dbms_output.put_line('Roll No : '||Rno);
	dbms_output.put_line('Name : '||nm);
	dbms_output.put_line('Average marks : '||average);
	if (average<40) then
		dbms_output.put_line('Need improvement');
	end if;
	Select To_char(Sysdate,'dd-mm-yyyy') into f_date from dual;
	Select To_char(Sysdate,'day') into f_day from dual;
	Dbms_output.put_line('Date : '||f_date);
	Dbms_output.put_line('Day : '||f_day);
END;
/


