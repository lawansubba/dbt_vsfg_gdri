select 
    response_id,
    can_afford_healthcare,
    need_medical_treatment,
    satisfaction_with_health,
    enough_to_eat,
    food_supports_health_needs,
    frequency_of_eating_fresh_fruit_vegetables,
    healthy_food_expensive,
    reason_not_eating_healthy_transportation,
    reason_not_eating_healthy_time,
    reason_not_eating_healthy_cooking_knowledge,
    reason_not_eating_healthy_supplies_equipment,
    reason_not_eating_healthy_household,
    reason_not_eating_healthy_not_ready,
    reason_not_eating_healthy_other,
    health_disorder_typhoid,
    health_disorder_malaria,
    health_disorder_hiv_aids,
    health_disorder_cancer,
    health_disorder_diabetes,
    health_disorder_high_blood_pressure,
    health_disorder_liver_disease,
    health_disorder_ulcers,
    health_disorder_other,
    protect_from_malaria,
    independently_decide_health_needs
FROM 
    {{ ref('nigeria_data_v2') }}
