with final as (
select *
    from {{ source('student_course', 'student_unit_enrolment') }} 
	)

select * from final