with stg_housing_and_living_conditions as (
    select 
        response_id,
        own_house,
        CASE 
            WHEN yearly_rent_or_mortgage BETWEEN 0 AND 99999 THEN '0-99,999'
            WHEN yearly_rent_or_mortgage BETWEEN 100000 AND 999999 THEN '100,000-999,999'
            WHEN yearly_rent_or_mortgage >= 1000000 THEN '1000000 and above'
            ELSE 'Not Available'
        END AS yearly_rent_or_mortgage,
        access_to_clean_water,
        access_to_wash_hands,
        satisfaction_with_living_conditions,
        affordable_transportation
    from
        {{ ref("stg_housing_and_living_conditions") }}
)

select * from stg_housing_and_living_conditions