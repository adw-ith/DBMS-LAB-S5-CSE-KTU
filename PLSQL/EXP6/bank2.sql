set serveroutput on
DECLARE
	actno int;
	xminbal number(3) := 500;
	xbal number(5);
BEGIN
	
	actno := &actno;
	select accbal into xbal from account where accno = actno;
	IF (xminbal<=(xbal-200))then
		update account set accbal = accbal - 200 where accno = actno;
		xbal := xbal-200;
		dbms_output.put_line('Current balance : '||xbal);
	ELSE 
		dbms_output.put_line('Unsuccessful');
		dbms_output.put_line('Current balance : '||xbal);
	END IF;
END;
/

