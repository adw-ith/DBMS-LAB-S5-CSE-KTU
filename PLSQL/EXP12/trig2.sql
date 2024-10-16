set serveroutput on
create or replace trigger y
before
insert on students2 for each row
begin
	case
		when inserting then
			update students2 set tot=m1+m2+m3;
			update students2 set avge=(m1+m2+m3)/3;
			commit;
	end case;
end;
/
