with
    student_course_admission as (select * from {{ ref("stg__student_course_admission") }}),
    student_unit_enrolment as (
        select * from {{ ref("stg__student_unit_enrolment") }}
    ),
    final as (
        select
            student_unit_enrolment.student_unit_enrolment_id,
            student_unit_enrolment.student_course_admission_id,
            student_course_admission.student_id,
            student_course_admission.course_admission_status,
            student_course_admission.status_effective_date,
            student_course_admission.admission_year,
            student_course_admission.first_name,
            student_course_admission.last_name,
            student_course_admission.course_id,
            student_course_admission.course_code,
            student_course_admission.course_title,
            student_unit_enrolment.unit_code,
            student_unit_enrolment.unit_title,
            student_unit_enrolment.unit_credit_point,
            student_unit_enrolment.unit_id,
            student_unit_enrolment.enrolment_date,
            student_unit_enrolment.enrolment_status,
            student_unit_enrolment.fee_amount,
            student_unit_enrolment.unit_mark
        from student_course_admission
        inner join
            student_unit_enrolment
            on student_course_admission.id = student_unit_enrolment.student_course_admission_id
    )
select *
from final