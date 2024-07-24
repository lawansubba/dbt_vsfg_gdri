SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(own_house AS CHAR(10)) AS own_house,
    CAST(yearly_rent_or_mortgage AS UNSIGNED) AS yearly_rent_or_mortgage,
    CAST(access_to_clean_water AS CHAR(10)) AS access_to_clean_water,
    CAST(access_to_wash_hands AS CHAR(10)) AS access_to_wash_hands,
    CAST(satisfaction_with_living_conditions AS CHAR(50)) AS satisfaction_with_living_conditions
FROM 
    {{ ref('nigeria_data_v2') }}
