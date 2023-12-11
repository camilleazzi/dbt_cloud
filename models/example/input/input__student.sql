with final as (
select *
    from {{ source('student_course', 'student') }} 
	)

select * from final