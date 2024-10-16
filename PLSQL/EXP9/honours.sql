set serveroutput on
declare
	cursor std is select * from students where grade1+grade2>12 order by rollno;
	great float;
	msg varchar2(15);
begin
	dbms_output.put_line('Rno'||' ' ||'name'||'         '||'semester'||'   '||'mark');
	for i in std loop
		if (i.grade1>i.grade2) then
			great := i.grade1;
			msg := 'semester 1 ';
			dbms_output.put_line(i.rollno||'   ' ||i.name||'    '||msg||'  '||great);
		else
			great := i.grade2;
			msg := 'semester 2 ';
			dbms_output.put_line(i.rollno||'   ' ||i.name||'    '||msg||'  '||great);
		end if;	
	end loop;
end;
/
