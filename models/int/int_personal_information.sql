with stg_personal_information as (
SELECT
    response_id,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age,
    sex,
    CASE
        WHEN tribal_affiliation IN ('Hausa', 'Hausa and Fulani', 'Hausa/Fulani', 'Hausa language', 'Hausa /Fulani', 'Hausa tribe', 'Hausa trial', 'English hausa', 'Hausa / English', 'F/H', 'Hausa Fulani') THEN 'Hausa-Fulani'
        WHEN tribal_affiliation IN ('Yoruba', 'Yourba', 'Yooba', 'Yoruba language', 'Yoruba and Fulani', 'Yoruba / English', 'Yoruba tribal') THEN 'Yoruba'
        WHEN tribal_affiliation IN ('Igbo', 'Igbo south east', 'Ibo', 'Igloo, haghase, hongange', 'Hibo') THEN 'Igbo'
        WHEN tribal_affiliation = 'Ibibio' THEN 'Ibibio'
        WHEN tribal_affiliation = 'Tiv' THEN 'Tiv'
        WHEN tribal_affiliation IN ('Bini', 'Edo', 'Esan', 'Edol Essan', 'I am from edo state benin', 'Benin people of edo state', 'Benin city', 'Benin', 'I am a Bini female', 'Itsekiri and Benin', 'Edo state', 'Benin/Yoruba (half caste)') THEN 'Edo (Bini)'
        WHEN tribal_affiliation = 'Nupe' THEN 'Nupe'
        WHEN tribal_affiliation IN ('Gbagyi', 'Sanga/Gbagyi') THEN 'Gwari (Gbagyi)'
        WHEN tribal_affiliation = 'Igala' THEN 'Igala'
        WHEN tribal_affiliation = 'Urhobo' THEN 'Urhobo'
        WHEN tribal_affiliation = 'Idoma' THEN 'Idoma'
        WHEN tribal_affiliation = 'Itsekiri and Benin' THEN 'Itsekiri'
        WHEN tribal_affiliation IN ('Gbagyi', 'Sanga/Gbagyi', 'Bachama', 'Isoko', 'Higgi / Kamoe', 'Hoba, Kilba', 'Kunini', 'Margi', 'Chamba', 'Mbula', 'Marighi', 'Berom and Hausa', 'Higgig and Kammie', 'Maxabilla', 'Ron from bokkos local govt of plateau state', 'Waja', 'Obibi') THEN 'Other Tribes'
        ELSE 'Unclassified'
    END AS classified_tribe,
    CASE 
        WHEN 'Christianity' THEN 'Christian'  
        WHEN religion in ('Islamic', 'islam') THEN 'Christian'  
        ELSE  'Unclassified'
    END as religion,
    identify_as_queer_gay_bisexual_lesbian_transgender_asexual,
    REPLACE(relationship_status, 'Divorced', 'Separated') as relationship_status,
    is_partner_deaf,
    current_occupation_status,
     CASE
        WHEN job_type IN ('teacher', 'teaching', 'school teacher', 'Teacher (Civil servant)', 'Classroom teaching', 'Teacher Staff', 'Classroom teacher', 'Special Education teacher', 'I TEACH DEAF CHILDREN IN MY PRIVATE SCHOOL', 'Special Needs Educator (Teaching)', 'Lecturer', 'Lecturing', 'Teaching professoin', 'Guidance and Counseling', 'Deaf teacher') THEN 'Teaching'
        WHEN job_type IN ('civil servant', 'public servant', 'civil service', 'Civil public servie', 'civil servant/ farming', 'civil servant/ quantity surveyor', 'Civic servant', 'Government', 'Administrative and Human Resource Dept', 'ministry of women\'s affairs', 'Civil Engineer and Consultant', 'high technical officer architect') THEN 'Civil Service'
        WHEN job_type IN ('student', 'fara/student', 'still searching', 'Not yet employed') THEN 'Student'
        WHEN job_type IN ('fashion designer', 'Fashion design', 'hair fashion', 'Tailors', 'tailor', 'Wearfoot') THEN 'Fashion'
        WHEN job_type IN ('Farmer', 'farming such as poultry and catfish', 'Farm', 'agricult/farmers', 'farming/business', 'Poultry farm and catfish', 'civil servant/ farming') THEN 'Farming'
        WHEN job_type IN ('library', 'storekeeper') THEN 'Library/Storekeeping'
        WHEN job_type IN ('Furniture', 'welding company') THEN 'Furniture/Welding'
        WHEN job_type IN ('Trading', 'trade', 'trade bars', 'Trading business', 'Trading slippers, sandals, and shoes', 'Second hand materials business', 'Provisions business', 'snack business', 'Sell Okara and fried pieces of yam (Aliyu: street trade)', 'Petty', 'petty trader (buisness)', 'Bakery making provisions') THEN 'Trading'
        WHEN job_type IN ('Unemployed', 'I\'m jobless', 'No job', 'Nil', 'No', 'none', 'Unemployment', 'Currently none') THEN 'Unemployed'
        WHEN job_type IN ('businessman', 'self-reliant', 'seli-relient', 'self-relient', 'businessman as pos', 'private sector emmoye', 'Business and Admin', 'Buisness teacitle', 'merchant', 'Businessman') THEN 'Business'
        WHEN job_type IN ('laundry cleaning', 'Laundry and cleaning service', 'farm/laundry') THEN 'Laundry'
        WHEN job_type IN ('preacher', 'ministiry clergy assemble of god') THEN 'Clergy'
        WHEN job_type IN ('sport women', 'sport coachfor deaf athletes under the lagos state sports comission', 'coach table tennis', 'Sportswoman', 'sport is work (athlete, deaf sport)', 'sport administrations') THEN 'Sports'
        WHEN job_type IN ('shop', 'officer', 'university staff', 'deaf teacher', 'Deaf Interpreter', 'retired', 'driver', 'haircutter') THEN 'Other Jobs'
        ELSE 'Other Jobs'
    END as job_type,  
    CASE
        WHEN monthly_salary > 1000000 THEN 'Above 1,000,000'
        WHEN monthly_salary BETWEEN 500000 AND 1000000 THEN '500,000 - 1,000,000'        
        WHEN monthly_salary BETWEEN 1 AND 499999 THEN '1 - 499,999'
        ELSE '0' 
    END as monthly_salary,
    number_of_jobs,
    work_days_per_week,
    CASE 
        WHEN age_began_hearing_loss IS NULL THEN 'Unknown'
        WHEN age_began_hearing_loss BETWEEN 0 AND 9 THEN '0-9'
        WHEN age_began_hearing_loss BETWEEN 10 AND 19 THEN '10-19'
        WHEN age_began_hearing_loss BETWEEN 20 AND 29 THEN '20-29'
        WHEN age_began_hearing_loss BETWEEN 30 AND 39 THEN '30-39'
        WHEN age_began_hearing_loss BETWEEN 40 AND 49 THEN '40-49'
        WHEN age_began_hearing_loss BETWEEN 50 AND 59 THEN '50-59'
        WHEN age_began_hearing_loss BETWEEN 60 AND 69 THEN '60-69'
        WHEN age_began_hearing_loss BETWEEN 70 AND 79 THEN '70-79'
        WHEN age_began_hearing_loss BETWEEN 80 AND 89 THEN '80-89'
        WHEN age_began_hearing_loss BETWEEN 90 AND 99 THEN '90-99'
        ELSE '100+'
    END AS age_began_hearing_loss_range,
    CASE 
        WHEN age_learned_sign_language IS NULL THEN 'Unknown'
        WHEN age_learned_sign_language BETWEEN 0 AND 9 THEN '0-9'
        WHEN age_learned_sign_language BETWEEN 10 AND 19 THEN '10-19'
        WHEN age_learned_sign_language BETWEEN 20 AND 29 THEN '20-29'
        WHEN age_learned_sign_language BETWEEN 30 AND 39 THEN '30-39'
        WHEN age_learned_sign_language BETWEEN 40 AND 49 THEN '40-49'
        WHEN age_learned_sign_language BETWEEN 50 AND 59 THEN '50-59'
        WHEN age_learned_sign_language BETWEEN 60 AND 69 THEN '60-69'
        WHEN age_learned_sign_language BETWEEN 70 AND 79 THEN '70-79'
        WHEN age_learned_sign_language BETWEEN 80 AND 89 THEN '80-89'
        WHEN age_learned_sign_language BETWEEN 90 AND 99 THEN '90-99'
	    ELSE '100+'
    END AS age_learned_sign_language_range,
    age_learned_sign_language
FROM 
    {{ ref('stg_personal_information') }}
),
personal_information as (
    select 
        response_id,
        CASE 
            WHEN age >= 0 AND age <= 10 THEN '0-10'
            WHEN age >= 11 AND age <= 20 THEN '11-20'
            WHEN age >= 21 AND age <= 30 THEN '21-30'
            WHEN age >= 31 AND age <= 40 THEN '31-40'
            WHEN age >= 41 AND age <= 50 THEN '41-50'
            WHEN age >= 51 AND age <= 60 THEN '51-60'
            WHEN age >= 61 AND age <= 70 THEN '61-70'
            WHEN age >= 71 AND age <= 80 THEN '71-80'
            WHEN age >= 81 AND age <= 90 THEN '81-90'
            WHEN age >= 91 AND age <= 100 THEN '91-100'
            ELSE 'Over 100'
        END AS age_range,
        sex,
        classified_tribe,
        religion,
        identify_as_queer_gay_bisexual_lesbian_transgender_asexual,
        relationship_status,
        is_partner_deaf,
        current_occupation_status,
        job_type,
        monthly_salary,
        number_of_jobs,
        work_days_per_week,
        age_began_hearing_loss_range,
        age_learned_sign_language_range
    from 
        stg_personal_information
)

select * from personal_information