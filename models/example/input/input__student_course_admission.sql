with final as (
select *
    from {{ source('student_course', 'student_course_admission') }} 
	)

select * from final