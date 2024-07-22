SELECT 
    response_id,
    yearly_rent_or_mortgage,
    own_house,
    access_to_clean_water,
    access_to_wash_hands,
    satisfaction_with_living_conditions,
    satisfaction_with_transportation
FROM 
    {{ ref('stg_nigeria_data') }}