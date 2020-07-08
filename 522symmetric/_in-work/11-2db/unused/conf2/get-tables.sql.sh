

unneeded - use wildcard.







------------------------------------------------------------------------------
-- get list of all tables.
------------------------------------------------------------------------------


SELECT table_name FROM information_schema.tables
WHERE table_schema = 'itemdb' and table_name not like 'SYM_%';


-- =================================================


-- Create sql by pasting into bash prompt ..


array21=( 
item
qissues
test                             
) 
date
for patrn in "${array21[@]}"
do
    echo  "
      insert into sym_trigger 
            (trigger_id,  source_table_name,        channel_id,    last_update_time,  create_time)
      values('"${patrn}"',    '"${patrn}"',            'main0',    current_timestamp, current_timestamp);
      insert into sym_trigger_router 
            (trigger_id,router_id,     initial_load_order, last_update_time,  create_time)
      values('"${patrn}"',    'corp_2_store',   100,             current_timestamp, current_timestamp);
      ----------------"
done

