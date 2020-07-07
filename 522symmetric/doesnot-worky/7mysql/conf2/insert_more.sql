


see get-tables.sql.sh to generate this code by scripting..



------------------------------------------------------------------------------
-- Add more tables to the sync..
------------------------------------------------------------------------------

-- add a table to the sync.. I ran it on corp.

-- Triggers for tables on "main" channel
insert into sym_trigger 
     (trigger_id, source_table_name, channel_id, last_update_time,  create_time)
values('qissues',    'qissues',            'main0',    current_timestamp, current_timestamp);

-- Send all items to all stores
insert into sym_trigger_router 
      (trigger_id,router_id,     initial_load_order, last_update_time,  create_time)
values('qissues',    'corp_2_store',   100,             current_timestamp, current_timestamp);


-- =================================================

-- Triggers for tables on "main" channel
insert into sym_trigger 
     (trigger_id, source_table_name, channel_id, last_update_time,  create_time)
values('test',    'test',            'main0',    current_timestamp, current_timestamp);

-- Send all items to all stores
insert into sym_trigger_router 
      (trigger_id,router_id,     initial_load_order, last_update_time,  create_time)
values('test',    'corp_2_store',   100,             current_timestamp, current_timestamp);



