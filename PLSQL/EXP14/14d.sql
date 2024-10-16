accept x number prompt 'Enter employee ID : ' 
DECLARE
	code emplo.eid%type;
	salary emplo.esalary%type;
BEGIN
	
	code := &x;
	salary := e_pack.retSal(code);
	
EXCEPTION
	when no_data_found then
		dbms_output.put_line('NO SUCH EMPLOYEE');
	
END;
/
