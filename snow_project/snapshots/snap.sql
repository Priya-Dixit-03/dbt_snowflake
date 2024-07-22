{% snapshot my_snapshot %}

{{ config(target_schema='snapshots', unique_key='STUDENT_ID',  strategy='timestamp', updated_at='time_st') }}

SELECT
    STUDENT_ID,
    NAME,
    AGE,
    GRADE,
    time_st

FROM
    {{ source('Falcon', 'student') }}

{% endsnapshot %}
