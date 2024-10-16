set serveroutput on
create sequence train_seq;
create or replace trigger train_ins
before 
insert on train for each row
begin
	select train_seq.nextval into :new.tno from dual;
end;
/
