with stg_housing_and_living_conditions as (
    select 
        response_id,
        own_house,
        CASE 
            WHEN yearly_rent_or_mortgage BETWEEN 0 AND 9999 THEN '0-9999'
            WHEN yearly_rent_or_mortgage BETWEEN 10000 AND 49999 THEN '10000-49999'
            WHEN yearly_rent_or_mortgage BETWEEN 50000 AND 99999 THEN '50000-99999'
            WHEN yearly_rent_or_mortgage BETWEEN 100000 AND 199999 THEN '100000-199999'
            WHEN yearly_rent_or_mortgage BETWEEN 200000 AND 399999 THEN '200000-399999'
            WHEN yearly_rent_or_mortgage BETWEEN 400000 AND 999999 THEN '400000-999999'
            WHEN yearly_rent_or_mortgage >= 1000000 THEN '1000000 and above'
            ELSE 'Not Available'
        END AS yearly_rent_or_mortgage,
        access_to_clean_water,
        access_to_wash_hands,
        satisfaction_with_living_conditions
    from
        {{ ref("stg_housing_and_living_conditions") }}
)

select * from stg_housing_and_living_conditions