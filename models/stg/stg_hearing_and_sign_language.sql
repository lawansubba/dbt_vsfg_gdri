SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(age_began_hearing_loss AS UNSIGNED) AS age_began_hearing_loss,
    CAST(age_learned_sign_language AS UNSIGNED) AS age_learned_sign_language
FROM 
    {{ ref('nigeria_data_v2') }}
