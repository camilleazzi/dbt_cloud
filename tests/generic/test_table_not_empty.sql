{% test table_not_empty(model) %}

with validation_errors as (
    select count(*) as row_count
    from {{ model }}
)

select row_count
from validation_errors
where row_count = 0

{% endtest %}