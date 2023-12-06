with final as (
select *
    from {{ source('student_course', 'course') }} 
	)

select * from final