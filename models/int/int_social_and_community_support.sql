with stg_social_and_community_support as (
    select
        response_id,
        CASE 
            WHEN locations_deaf_community_services IN ('church', 'deaf church', 'churches', 'church deaf association', 'church program', 
                                'christian mission deaf church', 'Christin Mission for the Deaf Church, Baptist high school', 
                                'cmdc deaf church', 'church and school for deaf', 'church and deaf school', 
                                'church, school gathering', 'Church deaf, stadium deaf', 'Association for the deaf, deaf church', 
                                'deaf church, deaf meeting venues, deaf schools, programmed venues, deaf friends homes, stadiums', 
                                'Deaf church in lagos', 'Redeemed Christian Church of God.') 
                THEN 'Church'
            WHEN locations_deaf_community_services IN ('school', 'central school', 'only in my school', 'schools, skill acquire workshop centre', 
                                'schooling', 'school, churches, association meeting', 'LCCW deaf center yola, special education', 
                                'school, hospital, and church', 'Special education school for the deaf, Kano state', 
                                'SPECIAL EDUCATION SCHOOL TUDUN MALIKI, KANO STATE EMERGENCY MANAGEMENT AGENCY, KANO STATE ASSOCIATION OF THE DEAF, ETC', 
                                'Special Education School Tudun Maliki, Rehabilitation center, CITAD.', 'college, deaf unit, local government', 
                                'School, church and association', 'at school and home with parents', 'upper sakpoba road and mmway', 
                                'Special Education School, Tudun Maliki', 'SPED', 'International Model School for the Deaf, AFKKPO , Ebonyi State, Nigeria', 
                                'Plateau disability commission School for the deaf, bassa Gidan bege (house of hope) NGOs Government', 
                                'Special Education center Gombe.', 'Abuja school for the Deaf kuje', 'Abuja school for the Deaf, kuje Church Hospital', 
                                'National Commission for Persons with Disabilities Central Business District Apostles Faith Church Jabi Government Secondary School Kuje The Redeem Evangelical Mission Utako', 
                                '1. Gathering meeting 2. Party 3. School (place of work)', 
                                '1. Deaf Muslims Association Center 2. Local Government Secretariat 3. School for the Deaf 4. Deaf meeting center') 
                THEN 'School'
            WHEN locations_deaf_community_services IN ('DALA Deaf association', 'deaf general meeting like this one, government like lasoda (contact us for full meaning)', 
                                'LASODA, Deaf church, South-West Deaf Festival, Wesley schools for the Deaf, Deaf associations', 
                                'Abuja Association of the Deaf. 2. Deaf teacher Association of Nigeria 3. Deaf Women Association of Nigeria. 4. Abuja School for the Deaf kuje. 5. Deaf Unit, Methodist Grammar School Bodija Old Students Association.', 
                                'LSAD Community service', 'local government for deaf gather meeting, cmdc deaf church, ihogbe college special school', 
                                'Association for the deaf, deaf church', '1. Deaf Muslims Association Center 2. Local Government Secretariat 3. School for the Deaf 4. Deaf meeting center') 
                THEN 'Association'
            WHEN locations_deaf_community_services IN ('school community or deaf chat', 'through school, deaf community, deaf gist', 
                                'through the awareness group - information through media', 'meeting, Islam and visiting deaf friends', 
                                'Special education school Ogoja Goodshepherd center for special education', 
                                'National stadium, Wesley school for the deaf, church at shomolu', 
                                'Local government for deaf gather meeting, cmdc deaf church, ihogbe college special school', 
                                'Plateau disability commission School for the deaf, bassa Gidan bege (house of hope) NGOs Government') 
                THEN 'Community'
            WHEN locations_deaf_community_services IN ('hospital', 'from the hospital', 'church, school, and centers', 
                                'churches, hospital in local government area of Lagos state', 
                                'School, Hospital and Church', 'Supermarket, School, Hospital', 
                                'Abuja school for the Deaf, kuje Church Hospital') 
                THEN 'Hospital'
            WHEN locations_deaf_community_services IN ('NGO and government', 'local government for deaf gather meeting, cmdc deaf church, ihogbe college special school', 
                                'LASODA, Deaf church, South-West Deaf Festival, Wesley schools for the Deaf, Deaf associations', 
                                'Plateau disability commission School for the deaf, bassa Gidan bege (house of hope) NGOs Government') 
                THEN 'Government'
            WHEN locations_deaf_community_services IN ('none', 'never', 'not know', 'no', 'non', 'none am aware of', 'there is no offer service in my area', 
                                'none within my location', 'non', 'never', 'yes i did', 'poor, social amenities and inclusion', 
                                'yes i wove du', 'Special education school and foods', 'Yalu sunnah masjid this place gathering for preaching', 
                                'T', 'Yes', 'Kaduna', 'Abuja', 'Nkanu, Obe ozalla Ugwa', 'Ifoh layout, Ugbopaul, ugboezeji and nwanyibuife', 
                                'Abakpa Nike, independence layout, COAL CAMP, Garriki and Emene', 'upper sakpoba road and mmway') 
                THEN 'Other'
            ELSE 'Unknown'
        END AS locations_deaf_community_services,
       CASE 
           WHEN significant_challenges_deaf IN ('communication', 'lack of interpreter, lack of assistance from government, hearing people have not help informat when nesccseayr or in case of nessary form government', 
                             'communication gap, likely accident, poor socialization', 'communication, awareness and acceptance', 
                             'communication difficulty', 'communication problem', 'access to information and communication', 
                             'communication barrier', 'No interpeter, No respect for deaf persons by normal people and discrimination', 
                             '1. Communicating with others 2. Difficulty associating with their peers 3. Low self-esteem', 
                             '1. Communication with others 2. Lack of basic needs', 'Sign language, interpreter and Access to Education', 
                             'good healthy, communication, information', '1. lack of information 2. Discrimination 3. Poor social with hearing counterpart') 
               THEN 'Communication'
           WHEN significant_challenges_deaf IN ('employment, education and empowerment', 'unemployment, poverty, lack access to education', 
                             'employment, school and free education', 'loss of education, misunderstand, loss of job', 
                             'no employment, government doesn\'t care deaf children, can\'t afford educational', 
                             'lack of education, lack of finianical assistance, unemployment', 'unemployed and under employed, inaccessibility to information, inaccessibility to quality education', 
                             'communication, trasnport and employment', 'unemployment, lack of good facilities in school, discrmination by society', 
                             'job opportunties, center for the deaf and health challenges', 'deaf employment, deaf not marry', 
                             'lack of inadequate care and love, no job', 'unemployment, poverty and illiteracy', 
                             'government access, employment access, security access', 'ability to interact with hearing people, ability to speak words, lack of employment opportunites', 
                             'employment, learn handwork, and spiritual living in gods word', 'jobless', 
                             'employment, equity in education, empowerment', 'education, job, and government don\'t care', 
                             'education, employment, and transportation', 'not employed, fananal prblem, health problem', 
                             'access to transportation, access to information and access to building', 'lack of work and lack of education', 
                             '1) lack of interpreter in hospital (emergency disability program) 2) Lack of welfare and 3) lack of food fund', 
                             'employment, empowerment, and education', 'employment, empowerment and access to social activities', 
                             'employment and access to social', 'empowerment and employment', 
                             'LACK OF ACCESS TO EMPOLYMENT OPPORTUNITY LACK OF ACCESS TO ADEQUATE HEALTH CRE SERVICE LACK OF ACCESS TO EQUAL OPPORTUNITY IN EVERY LIFE ENDEVOURS', 
                             'Discrimination, unemployment denied their rights.', 'access to sign language and other things such as empowerment', 
                             'lack of professional teachers that teach in sign language, no vocational training, poor planning for the deaf', 
                             'lack of good care from home and some parents don\'t know sign language than can help deaf children', 
                             'financial problem', 'suffer to make it in life/want to be like others', 
                             'not good education, not enough language community, no access to human development')
               THEN 'Employment and Economic Challenges'
           WHEN significant_challenges_deaf IN ('1. poor sign language 2. not good education in territory 3. not access to health care', 
                             'poor sign language', 'deaf only have face problem', 'schools, skill acquire workshop centre', 
                             'sugnii cat challenges the deaf people face to attend school and learn, some deaf can\'t', 
                             'education, employment, and transportation', 'interpreter, education, and hospital', 
                             'attending school and learning culture', 'lack of education, poor sign language, etc', 
                             'employment, education and empowerment', 'education, job, and government don\'t care', 
                             'education, employment, and transportation', 'lack of education, lack of finianical assistance, unemployment', 
                             'many deaf people dont know sign language, no deaf school in village, and government doesn\'t care about deaf ppl', 
                             'to communicate with education', '1. education 2. business', 'cancel')
               THEN 'Education'
           WHEN significant_challenges_deaf IN ('discrimination', 'violence, discrimination, and adousing', 'discrminate', 'discrmination, unifinical tribalism', 
                             'discrmiante', 'lose of respect, hearing challenge and negative feeling and discrminated', 
                             'discrimination/unfair/equality', 'no help, no respect, discrimination', 
                             'discrimination, lack of access, with agencies and treament', '1. Mocked on my answer 2. Ignore my question 3. Lack of attention')
               THEN 'Discrimination and Social Stigma'
           WHEN significant_challenges_deaf IN ('lack of adequate information', 'no access to communication in sign language, no center support for senior deaf, and no access to health care', 
                             'no access to communication, no central support, no access to health care', 
                             'access to transportation, access to information and access to building', 'hospital, interpreter, tacci')
               THEN 'Healthcare'
           WHEN significant_challenges_deaf IN ('empowerment problem, cost standard of living, and non-inclusion in government police', 
                             'communication, trasnport and employment', 'no access to transportation, no access to bank, no access to work', 
                             'discrimination, unemployment denied their rights.', 'suffer to make it in life/want to be like others', 
                             'no access to communication in sign language, no center support for senior deaf, and no access to health care', 
                             'lose of respect, hearing challenge and negative feeling and discrminated')
               THEN 'Social Inclusion and Support'
           WHEN significant_challenges_deaf IN ('at home', 'yes', 'many things', 'no', 'n/a', '1) lack of interpreter in hospital (emergency disability program) 2) Lack of welfare and 3) lack of food fund', 
                             'honesty, justice and belief', 'trouble', 'church, festival, school', 
                             'bully, laundry machine, blater (?)', 'they don\'t go to school, they are farmers, lack of ??', 
                             'ability to interact with hearing people, ability to speak words, lack of employment opportunites', 
                             'Sign language, interpreter and Access to Education', 'to communicate with education', 
                             'hospital, interpreter, tacci', 'Deaf area and government ngo', 'not good education, not enough language community, no access to human development', 
                             'I don\'t think there is challenges deaf people face in my area', 'suffer to make it in life/want to be like others')
               THEN 'General Challenges'
           ELSE 'Unknown' 
        END as significant_challenges_deaf,
        affordable_transportation,
        accessible_hearing_organizations,
        responsible_for_communication_cost,
        access_to_speech_auditory_therapy,
        CASE 
           WHEN support_for_hearing_loss_experience IN ('hearing aids', 'hearing aid', 'hearing help', 'audio aid / hearing aids', 
                             'yes hearing aids', 'ear aid', 'hearing aid and cochelar implant if it\'s safe', 
                             'hearing bin', 'aids hearing', 'Hearing aid to assist my little residual hearing and also support to further my studies and also run a business', 
                             'Ear aids', 'Hearing Aid but it is not working on me unless iam tested for the ability to hear first.', 
                             'Advanced hearing Aid or other', 'Advanced Hearing aid', 'Hearing aid maybe', 
                             'Hearing aid and text to speech phone') 
               THEN 'Hearing Aids'
           WHEN support_for_hearing_loss_experience IN ('interpreter', 'interpreters', 'sign language interpreter', 'video relay, sign language interpreter', 
                             'sign language interpreters', 'hearing aid and sign language interpreter', 
                             'Interpeter', 'pen and paper and sign language', 'interpret', 'Sign Language and lips reading', 
                             'Sign Language Interpreters and friends who understands sign language', 
                             'Complete access to information through captioning of voice messages and competent sign language interpreters.', 
                             'Sign Language Interpretation') 
               THEN 'Interpreter and Sign Language'
           WHEN support_for_hearing_loss_experience IN ('education', 'good education and quality education', 'education fiananices', 
                             'education, employment, empowerment', 'Signing deaf school') 
               THEN 'Education'
           WHEN support_for_hearing_loss_experience IN ('Money', 'financial stability', 'family, love and good quality education', 
                             'Interpreter and money', 'working tools for my Business') 
               THEN 'Financial Support'
           WHEN support_for_hearing_loss_experience IN ('family support', 'friends', 'Encouraged and love', 'Love and encouragement', 
                             'Sign Language Interpreters and friends who understands sign language') 
               THEN 'Family and Friends'
           WHEN support_for_hearing_loss_experience IN ('medical access', 'Medical treatment', 'sickness', 'accident', 
                             'narrative storytelling of how illness cause hearing loss', 
                             'I was a kid and 8 years old. I was hearing and when someone prisoned me after I became blood ears so hearing lose. I need to my support hearing lose and community.') 
               THEN 'Medical Support'
           WHEN support_for_hearing_loss_experience IN ('no', 'nothing', 'none', 'n/a', 'IDK', 'I don\'t know', 'I don\'t have', 'nothing at all', 
                             'yes', '5', 'i am okay with deaf, it normal', 'no need, am okay with my deaf', 
                             'I am okay with deaf since it is normal cause by stage sick', 'A GOOD JOB', 'Good job', 
                             'communication and hearing news', 'native', 'Hearing', 'Training in lipreading, encouragement', 
                             'Provide accessible to a good quality life', 'I am okay with my deafness.', 
                             'Hearing Aid/ Communication') 
               THEN 'No Support / Other'
           ELSE 'Unknown'
       END AS support_for_hearing_loss_experience
    FROM
    {{ ref("stg_social_and_community_support") }}
)

select * from stg_social_and_community_support