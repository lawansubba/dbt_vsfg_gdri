SELECT 
    response_id,
    locations_deaf_community_services,
    significant_challenges_deaf,
    affordable_transportation,
    accessible_hearing_organizations,
    responsible_for_communication_cost
FROM 
    {{ ref('stg_nigeria_data') }}
