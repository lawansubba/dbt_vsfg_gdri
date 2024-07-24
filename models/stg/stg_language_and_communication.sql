SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(languages_comfortable AS CHAR(255)) AS languages_comfortable,
    CAST(best_contact_method AS CHAR(255)) AS best_contact_method,
    CAST(want_to_learn_sign_language AS CHAR(10)) AS want_to_learn_sign_language,
    CAST(fluency_in_sign_language AS CHAR(50)) AS fluency_in_sign_language,
    CAST(where_learned_sign_language AS CHAR(255)) AS where_learned_sign_language,
    CAST(communicate_with_family AS CHAR(50)) AS communicate_with_family
FROM 
    {{ ref('nigeria_data_v2') }}
