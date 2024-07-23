SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(locations_deaf_community_services AS CHAR(255)) AS locations_deaf_community_services,
    CAST(significant_challenges_deaf AS CHAR(255)) AS significant_challenges_deaf,
    CAST(affordable_transportation AS CHAR(10)) AS affordable_transportation,
    CAST(accessible_hearing_organizations AS CHAR(10)) AS accessible_hearing_organizations,
    CAST(responsible_for_communication_cost AS CHAR(255)) AS responsible_for_communication_cost
FROM 
    {{ ref('nigeria_data_v2') }}
