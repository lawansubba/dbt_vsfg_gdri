SELECT 
    response_id,
    date_of_birth,
    sex,
    identify_as_queer_gay_bisexual_lesbian_transgender_asexual,
    relationship_status,
    is_partner_deaf,
    current_occupation_status,
    job_type,
    monthly_salary,
    number_of_jobs,
    work_days_per_week
FROM 
     {{ ref('stg_nigeria_data') }}