SELECT 
    response_id,
    tribal_affiliation,
    religion
FROM 
    {{ ref('stg_nigeria_data') }}