with stg_health_and_wellbeing as (
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
        CASE
            WHEN protect_from_malaria IS NULL then 'No Response'
	        WHEN protect_from_malaria LIKE '%net%' OR protect_from_malaria LIKE '%mosquito net%' OR protect_from_malaria LIKE '%bed net%' OR protect_from_malaria LIKE '%mosquitos net%' THEN 'Mosquito Nets'
	        WHEN protect_from_malaria LIKE '%drug%' OR protect_from_malaria LIKE '%medicine%' OR protect_from_malaria LIKE '%anti-malaria drug%' OR protect_from_malaria LIKE '%malaria drugs%' OR protect_from_malaria LIKE '%prescribed drugs%' OR protect_from_malaria LIKE '%self-medication%' OR protect_from_malaria LIKE '%medical%' OR protect_from_malaria LIKE '%pharmacy%' OR protect_from_malaria LIKE '%injection%' OR protect_from_malaria LIKE '%doctor%' THEN 'Drugs and Medication'
	        WHEN protect_from_malaria LIKE '%clean%' OR protect_from_malaria LIKE '%washing toilet%' OR protect_from_malaria LIKE '%clear source of water%' OR protect_from_malaria LIKE '%keep the house in order%' OR protect_from_malaria LIKE '%mosquito killer%' OR protect_from_malaria LIKE '%insecticide%' OR protect_from_malaria LIKE '%spraying%' THEN 'Environmental and Health Practices'
	        WHEN (protect_from_malaria LIKE '%net%' OR protect_from_malaria LIKE '%mosquito net%' OR protect_from_malaria LIKE '%bed net%' OR protect_from_malaria LIKE '%mosquitos net%') AND (protect_from_malaria LIKE '%drug%' OR protect_from_malaria LIKE '%medicine%' OR protect_from_malaria LIKE '%anti-malaria drug%' OR protect_from_malaria LIKE '%malaria drugs%' OR protect_from_malaria LIKE '%prescribed drugs%' OR protect_from_malaria LIKE '%self-medication%' OR protect_from_malaria LIKE '%medical%' OR protect_from_malaria LIKE '%pharmacy%' OR protect_from_malaria LIKE '%injection%' OR protect_from_malaria LIKE '%doctor%') THEN 'Mosquito Nets and Drugs'
	        WHEN protect_from_malaria LIKE '%clinic%' OR protect_from_malaria LIKE '%doctor%' OR protect_from_malaria LIKE '%medical check-up%' OR protect_from_malaria LIKE '%consult%' THEN 'Consulting Healthcare Providers'
	        WHEN protect_from_malaria LIKE '%fruits%' OR protect_from_malaria LIKE '%herbal mixtures%' OR protect_from_malaria LIKE '%preventives%' THEN 'Other Methods'
	        ELSE 'Uncategorized'
        END AS protect_from_malaria,        
        independently_decide_health_needs
    FROM 
        {{ ref('nigeria_data_v2') }}
)

select * from stg_health_and_wellbeing


