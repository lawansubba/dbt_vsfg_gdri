with stg_technology_and_accessibility as (
SELECT 
    response_id,
    satisfaction_with_transportation,
    access_to_computer,
    access_to_internet,
    hearing_tools_hearing_aids,
    hearing_tools_cochlear_implants,
    hearing_tools_other,
    age_got_hearing_aid,
    still_wear_hearing_aids,
    access_to_battery_replacements_repairs,
    age_got_cochlear_implant,
    frequency_use_cochlear_implant,
    access_to_communication_work,
    access_to_communication_school,
    access_to_communication_social_events,
    access_to_communication_healthcare,
    communicate_with_doctor,
    enough_interpreters,
    qualified_interpreters,
    trust_interpreters,
    complaint_form_helpful,
    crisis_communication_confidence,
    CASE 
	    WHEN crisis_communication_source IS NULL THEN 'Uncertain'
	
	    WHEN crisis_communication_source LIKE '%TV%' OR crisis_communication_source LIKE '%television%' OR 
            crisis_communication_source LIKE '%news%' OR crisis_communication_source LIKE '%media%' OR 
            crisis_communication_source LIKE '%newspaper%' OR crisis_communication_source LIKE '%internet%' OR 
            crisis_communication_source LIKE '%online%' 
        THEN 'Media'
	
        WHEN crisis_communication_source LIKE '%social media%' OR crisis_communication_source LIKE '%Facebook%' OR 
            crisis_communication_source LIKE '%WhatsApp%' OR crisis_communication_source LIKE '%Messenger%' OR 
            crisis_communication_source LIKE '%social platform%' OR crisis_communication_source LIKE '%internet%' OR 
            crisis_communication_source LIKE '%online%' 
        THEN 'Online Platforms'
        
        WHEN crisis_communication_source LIKE '%family%' OR crisis_communication_source LIKE '%son%' OR 
            crisis_communication_source LIKE '%gesturing%' OR crisis_communication_source LIKE '%friends%' OR 
            crisis_communication_source LIKE '%community%' OR crisis_communication_source LIKE '%neighbors%' OR 
            crisis_communication_source LIKE '%deaf gist%' 
        THEN 'Famil and Friends'
        
        WHEN 
            crisis_communication_source LIKE '%doctor%' OR crisis_communication_source LIKE '%hospital%' OR 
            crisis_communication_source LIKE '%health dept%' OR crisis_communication_source LIKE '%healthcare%' OR 
            crisis_communication_source LIKE '%interpreter%' 
        THEN 'Healthcare Providers'
        
        WHEN crisis_communication_source LIKE '%none%' OR crisis_communication_source LIKE '%no information%' OR 
            crisis_communication_source LIKE '%not at all%' OR crisis_communication_source LIKE '%nowhere%' OR 
            crisis_communication_source LIKE '%never%' OR crisis_communication_source LIKE '%no news%' 
        THEN 'Uncertain'
        
        WHEN crisis_communication_source LIKE '%don’t know%' OR crisis_communication_source LIKE '%don\'t know%' 
        THEN 'Uncertain'
        
	    ELSE 'Other reasons'
    END AS crisis_communication_source
FROM 
    {{ ref('stg_technology_and_accessibility') }}
)

select * from stg_technology_and_accessibility