SELECT 
    response_id,
    age_began_hearing_loss,
    support_for_hearing_loss_experience,
    age_learned_sign_language
FROM 
    {{ ref('stg_nigeria_data') }}