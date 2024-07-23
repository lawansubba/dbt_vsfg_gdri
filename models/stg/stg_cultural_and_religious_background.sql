SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(tribal_affiliation AS CHAR(255)) AS tribal_affiliation,
    CAST(religion AS CHAR(255)) AS religion
FROM 
    {{ ref('nigeria_data_v2') }}