-- This MySQL script creates or replaces the view `user_table_size` in the
-- current database. When queried this view displays information such as data
-- and index length in bytes and their human-readable equivalents (sizes) about
-- custom (user-defined) tables. The view lists the tables from largest to
-- smallest. The order may be overridden or the number of rows limited when
-- querying the view.

create or replace view user_table_size as (
  with
    user_table_length as (
      select
        table_schema as table_schema,
        table_name as table_name,
        data_length as data_length,
        index_length as index_length,
        (data_length + index_length) as total_length
      from
        information_schema.tables
      where
        table_schema not in ('information_schema','mysql','performance_schema','sys')
        and table_type = 'BASE TABLE'
    ),
    user_table_size as (
      select
        table_schema, table_name,
        data_length, format_bytes(data_length) as data_size,
        index_length, format_bytes(index_length) as index_size,
        total_length, format_bytes(total_length) as total_size
      from
        user_table_length
  )
  select * from user_table_size order by total_length desc
);
