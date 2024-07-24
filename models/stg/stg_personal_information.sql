SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(STR_TO_DATE(date_of_birth, '%m/%d/%Y') AS DATE) AS date_of_birth,
    CAST(sex AS CHAR(10)) AS sex,
    CAST(tribal_affiliation AS CHAR(255)) AS tribal_affiliation,
    CAST(religion AS CHAR(255)) AS religion,
    CAST(identify_as_queer_gay_bisexual_lesbian_transgender_asexual AS CHAR(10)) AS identify_as_queer_gay_bisexual_lesbian_transgender_asexual,
    CAST(relationship_status AS CHAR(50)) AS relationship_status,
    CAST(is_partner_deaf AS CHAR(10)) AS is_partner_deaf,
    CAST(current_occupation_status AS CHAR(50)) AS current_occupation_status,
    CAST(job_type AS CHAR(255)) AS job_type,
    CAST(monthly_salary AS UNSIGNED) AS monthly_salary,
    CAST(enough_money_for_needs AS CHAR(50)) AS enough_money_for_needs,
    CAST(number_of_jobs AS UNSIGNED) AS number_of_jobs,
    CAST(work_days_per_week AS UNSIGNED) AS work_days_per_week
FROM 
    {{ ref('nigeria_data_v2') }}
