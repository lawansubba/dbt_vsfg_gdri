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
    relationship_status,
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
        WHEN job_type IN ('Unemployed', 'I\'m jobless', 'No job') THEN 'Unemployed'
        WHEN job_type IN ('businessman', 'self-reliant', 'seli-relient', 'self-relient', 'businessman as pos', 'private sector emmoye', 'Business and Admin', 'Buisness teacitle', 'merchant', 'Businessman') THEN 'Business'
        WHEN job_type IN ('laundry cleaning', 'Laundry and cleaning service', 'farm/laundry') THEN 'Laundry'
        WHEN job_type IN ('preacher', 'ministiry clergy assemble of god') THEN 'Clergy'
        WHEN job_type IN ('sport women', 'sport coachfor deaf athletes under the lagos state sports comission', 'coach table tennis', 'Sportswoman', 'sport is work (athlete, deaf sport)', 'sport administrations') THEN 'Sports'
        WHEN job_type IN ('shop', 'officer', 'university staff', 'deaf teacher', 'Deaf Interpreter', 'retired', 'driver', 'haircutter') THEN 'Other Jobs'
        ELSE 'Unclassified'
    END as job_type,  
    CASE
        WHEN monthly_salary > 1000000 THEN 'Above 1,000,000'
        WHEN monthly_salary BETWEEN 500000 AND 1000000 THEN '500,000 - 1,000,000'
        WHEN monthly_salary BETWEEN 200000 AND 499999 THEN '200,000 - 499,999'
        WHEN monthly_salary BETWEEN 100000 AND 199999 THEN '100,000 - 199,999'
        WHEN monthly_salary BETWEEN 50000 AND 99999 THEN '50,000 - 99,999'
        WHEN monthly_salary BETWEEN 40000 AND 49999 THEN '40,000 - 49,999'
        WHEN monthly_salary BETWEEN 30000 AND 39999 THEN '30,000 - 39,999'
        WHEN monthly_salary BETWEEN 20000 AND 29999 THEN '20,000 - 29,999'
        WHEN monthly_salary BETWEEN 10000 AND 19999 THEN '10,000 - 19,999'
        WHEN monthly_salary BETWEEN 5000 AND 9999 THEN '5,000 - 9,999'
        WHEN monthly_salary BETWEEN 1000 AND 4999 THEN '1,000 - 4,999'
        WHEN monthly_salary BETWEEN 1 AND 999 THEN '1 - 999'
        ELSE '0' 
    END as monthly_salary,
    number_of_jobs,
    work_days_per_week
FROM 
    {{ ref('stg_personal_information') }}
),
personal_information as (
    select 
        response_id,
        CASE 
            WHEN age BETWEEN 0 AND 4 THEN '0-4'
            WHEN age BETWEEN 5 AND 9 THEN '5-9'
            WHEN age BETWEEN 10 AND 14 THEN '10-14'
            WHEN age BETWEEN 15 AND 19 THEN '15-19'
            WHEN age BETWEEN 20 AND 24 THEN '20-24'
            WHEN age BETWEEN 25 AND 29 THEN '25-29'
            WHEN age BETWEEN 30 AND 34 THEN '30-34'
            WHEN age BETWEEN 35 AND 39 THEN '35-39'
            WHEN age BETWEEN 40 AND 44 THEN '40-44'
            WHEN age BETWEEN 45 AND 49 THEN '45-49'
            WHEN age BETWEEN 50 AND 54 THEN '50-54'
            WHEN age BETWEEN 55 AND 59 THEN '55-59'
            WHEN age BETWEEN 60 AND 64 THEN '60-64'
            WHEN age BETWEEN 65 AND 69 THEN '65-69'
            WHEN age BETWEEN 70 AND 74 THEN '70-74'
            WHEN age BETWEEN 75 AND 79 THEN '75-79'
            WHEN age BETWEEN 80 AND 84 THEN '80-84'
            WHEN age BETWEEN 85 AND 89 THEN '85-89'
            WHEN age BETWEEN 90 AND 94 THEN '90-94'
            WHEN age BETWEEN 95 AND 99 THEN '95-99'
            ELSE '100+'
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
        work_days_per_week
    from 
        stg_personal_information
)

select * from personal_information