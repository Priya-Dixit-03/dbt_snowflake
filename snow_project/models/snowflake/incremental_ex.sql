{{ config(
    materialized='incremental',
    unique_key='student_id'
) }}

-- This part runs for both full and incremental runs
SELECT
    student_id,
    name,
    age,
    grade,
    CURRENT_TIMESTAMP() AS time_st
FROM
    {{ source('Falcon', 'student') }}

{% if is_incremental() %}

-- This part runs only for incremental runs
WHERE time_st > (SELECT MAX(time_st) FROM {{ this }})

{% endif %}
