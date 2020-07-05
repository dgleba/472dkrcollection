
works. 

-- Triggers for tables on "main" channel
insert into sym_trigger 
(trigger_id,source_table_name,channel_id,last_update_time,create_time)
values('alltbl','*','main0',current_timestamp,current_timestamp);

