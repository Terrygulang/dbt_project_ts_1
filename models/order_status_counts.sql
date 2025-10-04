{%- set statuses = dbt_utils.get_column_values(
    table=ref('stg_orders'),
    column='status'
) -%}

select

{%- for s in statuses %}
sum(case when status = '{{ s }}' then 1 end)
  as {{ dbt_utils.slugify(s) }}_count,

{% endfor %}
from 
{{ref("stg_orders")}}
