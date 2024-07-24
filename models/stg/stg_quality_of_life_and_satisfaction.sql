SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(quality_of_life_rating AS CHAR(50)) AS quality_of_life_rating,
    CAST(enjoyment_of_life AS CHAR(50)) AS enjoyment_of_life,
    CAST(meaningful_life_extent AS CHAR(50)) AS meaningful_life_extent,
    CAST(negative_feelings_frequency AS CHAR(50)) AS negative_feelings_frequency,
    CAST(satisfaction_with_health_services AS CHAR(50)) AS satisfaction_with_health_services,
    CAST(safety_feeling AS CHAR(50)) AS safety_feeling,
    CAST(discriminated_against_due_to_deafness AS CHAR(50)) AS discriminated_against_due_to_deafness,
    CAST(acceptance_of_bodily_appearance AS CHAR(50)) AS acceptance_of_bodily_appearance,
    CAST(satisfaction_with_self AS CHAR(50)) AS satisfaction_with_self,
    CAST(satisfaction_with_capacity_for_work AS CHAR(50)) AS satisfaction_with_capacity_for_work,
    CAST(satisfaction_with_daily_living_activities AS CHAR(50)) AS satisfaction_with_daily_living_activities,
    CAST(enough_energy_for_everyday_life AS CHAR(50)) AS enough_energy_for_everyday_life,
    CAST(satisfaction_with_sleep AS CHAR(50)) AS satisfaction_with_sleep,
    CAST(healthy_physical_environment AS CHAR(50)) AS healthy_physical_environment,
    CAST(satisfaction_with_personal_relationships AS CHAR(50)) AS satisfaction_with_personal_relationships,
    CAST(satisfaction_with_sex_life AS CHAR(50)) AS satisfaction_with_sex_life,
    CAST(satisfaction_with_friends_support AS CHAR(50)) AS satisfaction_with_friends_support
FROM 
    {{ ref('nigeria_data_v2') }}
