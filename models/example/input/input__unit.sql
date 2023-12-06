with final as (
select *
    from {{ source('student_course', 'unit') }} 
	)

select * from final