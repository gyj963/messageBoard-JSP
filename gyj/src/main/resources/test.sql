-- insert into messageboard_message values(seq_message.nextval,"gyj","",)
-- select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual;
select * from messageboard_message;
update messageboard_message set del=1 where id=38