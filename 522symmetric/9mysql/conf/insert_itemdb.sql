--
-- Licensed to JumpMind Inc under one or more contributor ... GPL V3 ...
--

------------------------------------------------------------------------------
-- Sample Data - Corp
------------------------------------------------------------------------------

-- Items to sell and their prices
-- insert into item (item_id, name) values (1101, 'Yummy Gum');

------------------------------------------------------------------------------
-- Clear and load SymmetricDS Configuration
------------------------------------------------------------------------------

-- delete from sym_trigger_router;
-- delete from sym_trigger;
-- delete from sym_router;
-- -- delete from sym_channel where channel_id in ('sale_transaction', 'item');
-- delete from sym_node_group_link;
-- delete from sym_node_group;
-- delete from sym_node_host;
-- delete from sym_node_identity;
-- delete from sym_node_security;
-- delete from sym_node;

------------------------------------------------------------------------------
-- Channels
------------------------------------------------------------------------------

-- Channel "item" for tables related to items for purchase
insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('main0', 1, 10000, 1, 'main data set');


------------------------------------------------------------------------------
-- Node Groups
------------------------------------------------------------------------------

-- insert into sym_node_group (node_group_id, description) values ('corp', 'master node');
insert into sym_node_group (node_group_id, description) values ('store', 'a slave node');

------------------------------------------------------------------------------
-- Node Group Links
------------------------------------------------------------------------------

-- Corp sends changes to Store when Store pulls from Corp
insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('corp', 'store', 'W');

-- Store sends changes to Corp when Store pushes to Corp
insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('store', 'corp', 'P');


------------------------------------------------------------------------------
-- Routers
------------------------------------------------------------------------------


-- Default router sends all data from corp to store 
insert into sym_router 
      (router_id,      source_node_group_id, target_node_group_id,   router_type, create_time,      last_update_time)
values('corp_2_store', 'corp',               'store',               'default',    current_timestamp, current_timestamp);

insert into sym_router 
      (router_id,      source_node_group_id, target_node_group_id,   router_type, create_time,      last_update_time)
values('store_to_corp', 'store',               'corp',               'default',    current_timestamp, current_timestamp);



------------------------------------------------------------------------------
-- Triggers
------------------------------------------------------------------------------

-- Triggers for tables on "main" channel
insert into sym_trigger 
      (trigger_id, source_table_name,      channel_id,    last_update_time,   create_time,       sync_on_incoming_batch )
values('alltbl',     '*,!ates*' ,            'main0',     current_timestamp,  current_timestamp,          1            );

------------------------------------------------------------------------------
-- Trigger Routers
------------------------------------------------------------------------------

-- Send all items to all stores
insert into sym_trigger_router 
      (trigger_id, router_id,        initial_load_order,  last_update_time,  create_time)
values('alltbl',     'corp_2_store',    100,                current_timestamp, current_timestamp);

insert into sym_trigger_router 
      (trigger_id, router_id,        initial_load_order, last_update_time,  create_time)
values('alltbl',     'store_to_corp',  100,                current_timestamp, current_timestamp);

