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
        WHEN crisis_communication_source IN ('social media', 'internet and social media and broadcasting tv stations, newspaper and medias',
                            'social network, telecommunication', 'through social media', 'whatsapp', 
                            'social platforms, newspaper, internet', 'THROUGH USING SOCIAL MEDIA MOSTLY WHATSAPP AND FACEBOOK',
                            'social net work', '1. Watching TV 2. Social Media', 'through whatsapp', 'Facebook', 
                            'from interpreters, WhatsApp, messenger and Facebook', 'tv news, online and social media, and deaf group') 
            THEN 'Social Media'
        WHEN crisis_communication_source IN ('internet', 'in the internet', 'internet (news)', 'through the internet', 'Google search and hospital') 
            THEN 'Internet'
        WHEN crisis_communication_source IN ('newspaper', 'i read newspaper, internet, and tv', 'by newspaper or on social media phone',
                            'news casters, news paper', 'tv, newspaper and internet', 'Through newspapers and other social medias') 
            THEN 'Newspaper'
        WHEN crisis_communication_source IN ('family', 'through my family via gesturing', 'family gesturing', 'my family (using gesturing)', 
                            'social media, family and friends', 'through my son', 'my neighbors', 
                            'I get it through my nursery neighbor', 'Through a friend') 
            THEN 'Family/Friends'
        WHEN crisis_communication_source IN ('tv', 'online, newspaper, tv', 'reading newspaper and tv', 'on phone and tv', 'news', 
                            'through news, television, and whatsapp', 'tv and the internet', 'phone/ tv news', 'Tv news', 
                            'tv but no interpreter/no communication') 
            THEN 'TV'
        WHEN crisis_communication_source IN ('hospital', 'a doctor', 'send text to doctor', 'information doctor', 'writing the doctor about my health',
                            'hospital and health care', 'to get money to get to hospital', 'need money to go to hospitals',
                            'Health dept', 'from the hospital', 'Doctor', 'from health websites', 'From healthcare website') 
            THEN 'Health Care'
        WHEN crisis_communication_source IN ('with the help of interpreter', 'I had paid myself for interpreter', 'Interpreter') 
            THEN 'Interpreter'
        WHEN crisis_communication_source IN ('school community or deaf chat', 'through school, deaf community, deaf gist',
                            'through the awareness group - information through media', 'media and news', 
                            'through hearing from news, eg whatsapp, deaf gist') 
            THEN 'Community'
        WHEN crisis_communication_source IN ('message writing or sending sms', 'by texting') 
            THEN 'Written Communication'
        WHEN crisis_communication_source IN ('not at all', 'none', 'No', 'no information', 'no information for us at all', 
                            'don\'t know', 'never', 'nowhere and no information at all', 'no news for sometime', 
                            'no interpretation', 'None. Only if I have pre knowledge of what happened', 'nobody', 
                            'public announcement', 'mass media', 'I see information', 'consulation', 'malaria') 
            THEN 'Other'
        WHEN crisis_communication_source IN ('Phone', 'from my phone', 'through phone') 
            THEN 'Phone'
        ELSE 'Unknown'
    END AS crisis_communication_source
FROM 
    {{ ref('stg_technology_and_accessibility') }}
)

select * from stg_technology_and_accessibility