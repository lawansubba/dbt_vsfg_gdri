SELECT 
    CAST(response_id AS UNSIGNED) AS response_id,
    CAST(lost_parent AS CHAR(10)) AS lost_parent,
    CAST(parents_hit_each_other AS CHAR(10)) AS parents_hit_each_other,
    CAST(lived_with_prisoner AS CHAR(10)) AS lived_with_prisoner,
    CAST(parent_swear_at_you AS CHAR(10)) AS parent_swear_at_you,
    CAST(witnessed_stabbing_shooting AS CHAR(10)) AS witnessed_stabbing_shooting,
    CAST(home_destruction AS CHAR(10)) AS home_destruction,
    CAST(beaten_by_authorities AS CHAR(10)) AS beaten_by_authorities
FROM 
    {{ ref('nigeria_data_v2') }}