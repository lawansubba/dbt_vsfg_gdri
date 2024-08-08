SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(locations_deaf_community_services AS CHAR(255)) AS locations_deaf_community_services,
    CAST(significant_challenges_deaf AS CHAR(255)) AS significant_challenges_deaf,
    CAST(accessible_hearing_organizations AS CHAR(10)) AS accessible_hearing_organizations,
    CAST(responsible_for_communication_cost AS CHAR(255)) AS responsible_for_communication_cost,
    CAST(access_to_speech_auditory_therapy AS CHAR(10)) AS access_to_speech_auditory_therapy,
    CAST(support_for_hearing_loss_experience AS CHAR(255)) AS support_for_hearing_loss_experience
FROM 
    {{ ref('nigeria_data_v2') }}
