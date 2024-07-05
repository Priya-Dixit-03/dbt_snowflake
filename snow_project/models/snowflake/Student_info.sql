{{ config(materialized='table') }}
with Student_info as(
    select STUDENT_ID, STUDENT_NAME FROM PHONEIX.STUDENT
)
SELECT * FROM Student_info