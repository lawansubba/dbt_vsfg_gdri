SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(age_began_hearing_loss AS UNSIGNED) AS age_began_hearing_loss,
    CAST(support_for_hearing_loss_experience AS CHAR(255)) AS support_for_hearing_loss_experience,
    CAST(age_learned_sign_language AS UNSIGNED) AS age_learned_sign_language
FROM 
    {{ ref('nigeria_data_v2') }}
