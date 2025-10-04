{% snapshot scd_raw_orders%}
{{
    config(
        target_schema = 'Analytics',
        unique_key = 'id',
        strategy= 'timestamp',
        updated_at = '_ETL_Loaded_at',
        invalidate_hard_deletes = True
    )
}}

select * from {{source("jaffle_shop","orders")}}
{% endsnapshot %}