SELECT 
    response_id,
    quality_of_life_rating,
    satisfaction_with_capacity_for_work,
    satisfaction_with_daily_living_activities,
    enough_energy_for_everyday_life,
    satisfaction_with_sleep,
    enjoyment_of_life,
    meaningful_life_extent,
    acceptance_of_bodily_appearance,
    satisfaction_with_self,
    enough_money_for_needs,
    healthy_physical_environment,
    satisfaction_with_personal_relationships,
    satisfaction_with_sex_life,
    satisfaction_with_friends_support
FROM 
    {{ ref('stg_nigeria_data') }}