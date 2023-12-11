with
    unit as (select * from {{ ref("input__unit") }}),
    student_unit_enrolment as (
        select * from {{ ref("input__student_unit_enrolment") }}
    ),
    final as (
        select
            student_unit_enrolment.id as student_unit_enrolment_id,
            student_unit_enrolment.unit_id as unit_id,
            unit.unit_code,
            unit.unit_title,
            unit.unit_credit_point,
            student_unit_enrolment.student_course_admission_id,
            student_unit_enrolment.enrolment_date,
            student_unit_enrolment.enrolment_status,
            student_unit_enrolment.fee_amount,
            student_unit_enrolment.unit_mark

        from  student_unit_enrolment
        inner join
            unit
            on unit.id = student_unit_enrolment.unit_id
    )
select *
from final

