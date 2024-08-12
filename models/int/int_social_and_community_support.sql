with stg_social_and_community_support as (
    select
        response_id,
        CASE
            WHEN locations_deaf_community_services is NULL THEN  'Not Available'
	        WHEN 
                locations_deaf_community_services LIKE '%school%' OR 
                locations_deaf_community_services LIKE '%college%' OR 
                locations_deaf_community_services LIKE '%education%' OR 
                locations_deaf_community_services LIKE '%university%' 
            THEN 'Educational Institutions'
            
            WHEN 
                locations_deaf_community_services LIKE '%church%' OR 
                locations_deaf_community_services LIKE '%mosque%' OR 
                locations_deaf_community_services LIKE '%religious%' 
            THEN 'Religious Organizations'

            WHEN 
                locations_deaf_community_services LIKE '%association%' OR 
                locations_deaf_community_services LIKE '%community%' OR 
                locations_deaf_community_services LIKE '%meeting%' OR 
                locations_deaf_community_services LIKE '%club%' 
            THEN 'Community and Social Centers'

            WHEN 
                locations_deaf_community_services LIKE '%ngo%' OR 
                locations_deaf_community_services LIKE '%government%' OR 
                locations_deaf_community_services LIKE '%agency%' OR 
                locations_deaf_community_services LIKE '%commission%' 
            THEN 'Government and NGO Services'

            WHEN 
                locations_deaf_community_services LIKE '%hospital%' OR 
                locations_deaf_community_services LIKE '%health%' 
            THEN 'Healthcare Facilities'

	        ELSE 'Miscellaneous'
        END AS locations_deaf_community_services,
        CASE
            WHEN significant_challenges_deaf is null then 'Not Available'
	        -- Communication and Social Interaction
	        WHEN significant_challenges_deaf LIKE '%communication%' OR
                significant_challenges_deaf LIKE '%interpreter%' OR
                significant_challenges_deaf LIKE '%sign language%' OR
                significant_challenges_deaf LIKE '%social interaction%' OR
                significant_challenges_deaf LIKE '%socialization%' OR
                significant_challenges_deaf LIKE '%access to communication%' THEN 'Communication and Social Interaction'

            -- Discrimination and Stigma
            WHEN significant_challenges_deaf LIKE '%discriminat%' OR 
                significant_challenges_deaf LIKE '%stigma%' OR
                significant_challenges_deaf LIKE '%unfair%' OR
                significant_challenges_deaf LIKE '%ridicule%' OR
                significant_challenges_deaf LIKE '%no respect%' THEN 'Discrimination and Stigma'

            -- Employment and Economic significant_challenges_deafs
            WHEN significant_challenges_deaf LIKE '%employment%' OR 
                significant_challenges_deaf LIKE '%unemploy%' OR
                significant_challenges_deaf LIKE '%job%' OR
                significant_challenges_deaf LIKE '%financial%' OR
                significant_challenges_deaf LIKE '%poverty%' OR
                significant_challenges_deaf LIKE '%economic%' OR
                significant_challenges_deaf LIKE '%empowerment%' THEN 'Employment and Economic'

            -- Education and Training
            WHEN significant_challenges_deaf LIKE '%education%' OR 
                significant_challenges_deaf LIKE '%school%' OR
                significant_challenges_deaf LIKE '%training%' OR
                significant_challenges_deaf LIKE '%teachers%' OR
                significant_challenges_deaf LIKE '%vocational%' THEN 'Education and Training'

            -- Healthcare and Accessibility
            WHEN significant_challenges_deaf LIKE '%health care%' OR 
                significant_challenges_deaf LIKE '%hospital%' OR
                significant_challenges_deaf LIKE '%accessibility%' OR
                significant_challenges_deaf LIKE '%accessible%' OR
                significant_challenges_deaf LIKE '%health services%' THEN 'Healthcare and Accessibility'

            -- Support and Welfare
            WHEN significant_challenges_deaf LIKE '%support%' OR 
                significant_challenges_deaf LIKE '%welfare%' OR
                significant_challenges_deaf LIKE '%care%' OR
                significant_challenges_deaf LIKE '%help%' OR
                significant_challenges_deaf LIKE '%aid%' THEN 'Support and Welfare'

            -- Miscellaneous significant_challenges_deafs
            ELSE 'Other Reasons'
        END AS significant_challenges_deaf,
        accessible_hearing_organizations,
        responsible_for_communication_cost,
        access_to_speech_auditory_therapy,
        CASE
            WHEN support_for_hearing_loss_experience is null then 'No Answer'
            WHEN 
                support_for_hearing_loss_experience LIKE '%hearing aid%' OR 
                support_for_hearing_loss_experience LIKE '%cochlear%' OR 
                support_for_hearing_loss_experience LIKE '%audio%' 
            THEN 'Hearing Aids and Audio Assistance'

            WHEN 
                support_for_hearing_loss_experience LIKE '%interpreter%' OR 
                support_for_hearing_loss_experience LIKE '%sign language%' OR 
                support_for_hearing_loss_experience LIKE '%captioning%' 
            THEN 'Interpretation and Communication Tools'

            WHEN 
                support_for_hearing_loss_experience LIKE '%education%' OR 
                support_for_hearing_loss_experience LIKE '%school%' 
            THEN 'Educational support_for_hearing_loss_experience'

            WHEN 
                support_for_hearing_loss_experience LIKE '%financial%' OR 
                support_for_hearing_loss_experience LIKE '%Money%' 
            THEN 'Financial support_for_hearing_loss_experience'

            WHEN 
                support_for_hearing_loss_experience LIKE '%medical%' OR 
                support_for_hearing_loss_experience LIKE '%treatment%' OR 
                support_for_hearing_loss_experience LIKE '%therapy%' 
            THEN 'Medical and Therapeutic support_for_hearing_loss_experience'

            WHEN 
                support_for_hearing_loss_experience LIKE '%family%' OR 
                support_for_hearing_loss_experience LIKE '%friends%' OR 
                support_for_hearing_loss_experience LIKE '%love%' 
            THEN 'Social and Emotional support_for_hearing_loss_experience'
        ELSE 'Other'
        END AS support_for_hearing_loss_experience
    FROM
    {{ ref("stg_social_and_community_support") }}
)

select * from stg_social_and_community_support