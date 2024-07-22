-- models/my_ephemeral_model.sql

{{ config(materialized='ephemeral') }}

SELECT
   student_id,
   name,
   age
FROM
    student


-- Ephemeral materialization in dbt is used for creating transient models that do not persist as tables or views in the database.
--  Instead, these models are used as Common Table Expressions (CTEs) within other models. This can be useful for intermediate
--   transformations or temporary data processing that does not need to be stored