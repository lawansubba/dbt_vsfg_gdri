SELECT 
    response_id,
    languages_comfortable,
    best_contact_method,
    want_to_learn_sign_language,
    fluency_in_sign_language,
    where_learned_sign_language,
    discriminated_against_due_to_deafness,
    communicate_with_family
FROM 
    {{ ref('stg_nigeria_data') }}