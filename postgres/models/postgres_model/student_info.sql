-- models/students_overview.sql

with students_data as (
    select
        student_id,
        first_name,
        last_name,
        grade,
        date_of_birth
    from postgres_schema.students
)

select
    student_id,
    first_name,
    last_name,
    grade,
    date_of_birth,
    date_part('year', age(current_date, date_of_birth)) as age
from students_data
