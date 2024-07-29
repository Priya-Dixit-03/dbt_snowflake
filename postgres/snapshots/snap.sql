{% snapshot my_snapshot %}

{{ config(target_schema='snapshots', unique_key='student_id',  strategy='timestamp', updated_at='date_of_birth') }}

SELECT
   student_id,
    first_name,
    last_name,
    grade,
    date_of_birth 
FROM
    {{ source('postgres_schema', 'students') }}

{% endsnapshot %}
