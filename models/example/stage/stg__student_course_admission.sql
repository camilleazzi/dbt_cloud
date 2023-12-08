with
    student as (select * from {{ ref("input__student") }}),

    course as (select * from {{ ref("input__course") }}),

    student_course_admission as (
        select * from {{ ref("input__student_course_admission") }}
    ),

    final as (
        select
            student_course_admission.id,
            student_course_admission.student_id,
            student_course_admission.course_admission_status,
            student_course_admission.status_effective_date,
            student_course_admission.admission_year,
            student.first_name,
            student.last_name,
            course.id as course_id,
            course.course_code,
            course.course_title
        from student_course_admission
        inner join student on student.id = student_course_admission.student_id
        inner join course on course.id = student_course_admission.course_id

    )
select *
from final
