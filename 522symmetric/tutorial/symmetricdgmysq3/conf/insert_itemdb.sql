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
-- -- delete from sym_channel where channel_id in ('sale_transaction', 'main0');
-- delete from sym_node_group_link;
-- delete from sym_node_group;
-- delete from sym_node_host;
-- delete from sym_node_identity;
-- delete from sym_node_security;
-- delete from sym_node;

------------------------------------------------------------------------------
-- Channels
------------------------------------------------------------------------------

-- Channel now main0 was.. "item" for tables related to items for purchase
insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('main0', 1, 10000, 1, 'main channel name');


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
      (router_id,      source_node_group_id, target_node_group_id, router_type, create_time,       last_update_time)
values('corp_2_store', 'corp',               'store',              'default',   current_timestamp, current_timestamp);


------------------------------------------------------------------------------
-- Triggers
------------------------------------------------------------------------------

-- Triggers for tables on "main0" channel
insert into sym_trigger 
      (trigger_id,source_table_name, channel_id, last_update_time,   create_time)
values('item',    'item',            'main0',    current_timestamp, current_timestamp);


------------------------------------------------------------------------------
-- Trigger Routers
------------------------------------------------------------------------------

-- Send all items to all stores
insert into sym_trigger_router 
      (trigger_id, router_id,      initial_load_order, last_update_time,   create_time)
values('item',     'corp_2_store', 100,                current_timestamp,  current_timestamp);


