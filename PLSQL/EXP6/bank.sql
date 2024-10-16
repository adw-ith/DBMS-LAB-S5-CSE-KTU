set serveroutput on
accept account_no PROMPT 'Enter account number: '
prompt '1.Debit   2.Credit   3.Check balance'
DECLARE
	choice varchar(1);
	amount number(5);
	account_no number(5) := &account_no;
	zero number := 0;
	bal number(10);
	ch number :=1;
BEGIN
	choice := &choice;
	amount :=&amount;
	select accbal into bal from account where accno = account_no;
	case
		when choice = '1' then
			if(zero<(bal - amount)) then
				update account set accbal = accbal - amount where accno = account_no;
				dbms_output.put_line('Debited');
			else
				dbms_output.put_line('Insufficient Balance');
			end if;
			select accbal into amount from account where accno = account_no;
			dbms_output.put_line('New Balance :'||amount);
		when choice = '2' then
			update account set accbal = accbal + amount where accno = account_no;
			dbms_output.put_line('Credited');
			select accbal into amount from account where accno = account_no;
			dbms_output.put_line('New Balance :'||amount);		
		when choice = '3' then
			select accbal into amount from account where accno = account_no;
			dbms_output.put_line('Balance '||amount);
	END CASE;
END;
/

