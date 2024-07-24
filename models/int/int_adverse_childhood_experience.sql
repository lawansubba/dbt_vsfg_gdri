SELECT 
    response_id,
    lost_parent,
    parents_hit_each_other,
    lived_with_prisoner,
    parent_swear_at_you,
    witnessed_stabbing_shooting,
    home_destruction,
    beaten_by_authorities
FROM 
    {{ ref("stg_adverse_childhood_experiences") }}