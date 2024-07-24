with stg_language_and_communication as (
    SELECT 
    response_id,
    CASE 
        WHEN languages_comfortable IN ('English', 'English language', 'English (ASL)', 'English language, sign language', 'English language (sign language)') THEN 'English'
        WHEN languages_comfortable IN ('sign language', 'NSL', 'Nigeria Sign Language', 'ASL', 'English sign language', 'English sign language for the deaf', 'Sign language/English', 'Nigerian Sign Language (NSL) written in English Language', 'America Sign Language', 'Nigerian sign language/SEE', 'Sign language communication', 'Nigerian Sign Language.') THEN 'Sign Language'
        WHEN languages_comfortable = 'Hausa' THEN 'Hausa'
        WHEN languages_comfortable = 'Yoruba' THEN 'Yoruba'
        WHEN languages_comfortable = 'Fulani' THEN 'Fulani'
        WHEN languages_comfortable = 'Arabic' THEN 'Arabic'
        WHEN languages_comfortable IN ('Nigeria language', 'Adara', 'Berom', 'Ibo') THEN 'Other Nigerian Languages'
        WHEN languages_comfortable IN (
            'English and Hausa', 'English / Hausa', 'Hausa and English', 'English and Yoruba', 'Hausa and English language', 'Hausa, Fulani, and English', 'Hausa/English', 'Hausa / English Language', 'English/ Hausa', 
            'Hausa, English, and Arabic', 'English language and sign language and Hausa', 'Hausa, English', 'English, Hausa, Fulani', 'Hausa, English and Asl', 'English, Hausa, Fulani', 'English and Hausa Language', 
            'NSL and English language', 'English (ASL)', 'English, sign language', 'English language, sign language', 'English, Hausa, Fulani Sign language', 'English and Igbo languages', 'English Tiv Sign Language', 
            'NSL and English', 'Hausa English Sign Language', 'English Yoruba Nigerian Sign Language (NSL)', 'English, Yoruba', 'ASL/NSL', 'ASL, Nigeria language', 'English Language (sign language)', 'A.S.L and N.S.L', 
            'Sign language and English', 'English/hausa and sign language', 'English, Hausa and sign language', 'Sign language/English', 'ASL and English and sign language', 'English language (sign language)', 
            'English Sign Languages', 'Sign Language-English', 'Hausa English Sign Language', 'Hausa/English and sign language', 'English Yoruba Nigerian Sign Language (NSL)', 'English or Arabic', 
            'Hausa, Fulani, and English', 'Hausa, English and Arabic', 'Hausa, English and Asl', 'Hausa, English and Fulani', 'Hausa, English, Fulani', 'Hausa, English, Arabic', 'Hausa/English, Fulani', 
            'Hausa, English, Fulani, Arabic', 'Hausa/English, Arabic', 'Hausa, English, Arabic, Fulani', 'English/Nigeria'
        ) THEN 'Multiple Languages'
        ELSE 'Unclassified'
    END AS languages_comfortable,
     CASE 
        WHEN best_contact_method IN ('sign language', 'NSL', 'sign language method', 'sign languages', 'NSL: NIGERIAN sign language', 'eye can see sign language', 'video call, text message, whatsapp, eyes to contact the sign language for understanding', 'sign', 'signing language, verbal communication', 'sign language and writing', 'sign language and gesturing', 'sign language, WhatsApp, Facebook messenger, and writing', 'sign language and SMS (whatsapp)', 'lip reading, sign language', 'Sign language both Hausa and ASL', 'SIGN LANGUAGE BOTH ASL AND HAUSA SIGN LANGUAGE', 'sign language, written communication and a little bit of speaking', 'Sign language and oral reading', 'sign language through deaf people, writing', 'Sign language, oral reading, writing', 'Sing language', 'Through sign language', 'Sign Language/email', 'Sign Language Writing Lip reading', 'Sign language through communication', 'Sign Language Interpreter', 'Language, english in signing', 'english language and sign language', 'Hausa language, english language, and lip reading', 'Yoruba and English language', 'English, sign language, Hausa', 'Language', 'Hausa', 'Text messages', 'Through sign language', 'SIGN LANGUAGE BOTH ASL AND HAUSA SIGN LANGUAGE') THEN 'Sign Language'
        WHEN best_contact_method IN ('whatsapp', 'text message', 'text', 'message text', 'whatsapp messaging', 'text sms', 'text message and whatsapp', 'whatsapp/phone', 'WhatsApp Messenger', 'whatsapp chats') THEN 'Messaging Apps'
        WHEN best_contact_method IN ('facebook', 'Whatsapp and Facebook', 'facebook and whatsapp', 'text message, whatsapp, and facebook', 'Social media and email', 'whatsapp, facebook, message and telegram', 'facebook, whatsapp, telegram, etc', 'Facebook, email, whatsapp', 'video call, text message, whatsapp, sign language', 'video call, text message, whatsapp, eyes to contact the sign language for understanding', 'message, sign language, whatsapp, facebook', 'email, sms, whatsapp, fb', 'Social Media, whatsapp', 'whatsapp and text message', 'facebook/whatsapp', 'Facebook, email, whatsapp, and telegram', 'text sms, whatsapp and email', 'whatsapp, message, facebook, 2go', 'whatsapp, facebook, telegram', 'Whatsapp, Facebook, Messenger, and Telegram', 'Whatsapp, Email, FB Messenger', 'text, whatsapp, and sms', 'whatapp and Facebook', 'Message/Facebook', 'Facebook and email', 'WhatsApp Messenger', 'WhatsApp, Telegram and Facebook', 'WhatsApp, Email, FB Messenger', 'Text, WhatsApp and Email', 'WhatsApp, E-mail', 'WhatsApp Email Facebook Text messages', 'WhatsApp, Email', 'WhatsApp Email', 'WhatsApp and email', 'Facebook, email, whatsapp', 'Whatsapp, Email, FB Messenger', 'Text, WhatsApp and Email', 'email', 'messenger/ my email', 'Social media and email', 'email, sms, whatsapp, fb', 'whatsapp and email', 'Facebook and email', 'E-mail/whatsapp', 'WhatsApp, Email, FB Messenger', 'Email, Facebook, Whatsapp, Telegram', 'E-mail') THEN 'Social Media & Email'
        WHEN best_contact_method IN ('video call', 'video communication', 'video conference', 'video call, text message, whatsapp, eyes to contact the sign language for understanding', 'writing, video chatting, text and whatsapp', 'Video Call Text Message WhatsApp Sign Language') THEN 'Video Communication'
        WHEN best_contact_method IN ('telecommunication and message phone', 'Message phone', 'phone', 'telephone called') THEN 'Phone Communication'
        WHEN best_contact_method IN ('sign language and writing', 'lip reading, sign language', 'sign language, written communication and a little bit of speaking', 'writing, video chatting, text and whatsapp', 'sign language, WhatsApp, Facebook messenger, and writing', 'Sms', 'modest grammar school Body Ibaday') THEN 'Other'
        ELSE 'Unspecified/General'
    END AS best_contact_method,
    want_to_learn_sign_language,
    fluency_in_sign_language,
    CASE 
        WHEN where_learned_sign_language IN ('deaf school', 'at school', 'primary school', 'in school', 'teacher', 
                            'special education school', 'in deaf school', 'in the school', 
                            'In primary school', 'through teacher', 'school for the deaf', 
                            'from school', 'wesley school for the deaf', 'in school model', 
                            'kadnna state (school)', 'school center jada', 
                            'I learned sign language at special education centre jada', 'jada', 
                            'at school of special', 'muynm-biym', 
                            'in special education centre Jada, deaf school', 'student book sign language', 
                            'special education centre jada', 'special education', 
                            'at federal college of education (special)', 'ibadan', 
                            'federal college of education (special)', 'badan school for the deaf', 
                            'in nigeria right from primary to secondary school', 
                            'from school with teacher sign language', 'special education deaf school', 
                            'special school', 'at special school', 'I learn sign language from school', 
                            'in school (interpreter and deaf classmate)', 'secondary school', 
                            'special education for the deaf', 'primary school for the deaf organizatino, nigeria', 
                            'LCCN Deaf Centre academy', 'I learned my deaf primary school charilove group of special schools', 
                            'I learned sign at the first day center school', 'at S.E.S tmeliki', 
                            'at school when I was a kid', 'special education tudun maiki', 'at the university', 
                            'At jos', 'at a school for the hearing impaired', 'At primary school', 
                            'Schools for the deaf', 'school and community', 'at special education school', 
                            'deaf schools', 'from teacher', 'Benin School for the Deaf', 
                            'I learned sign language at project of charitable group at special school for the deaf', 
                            'University of Ibadan', 'I learn sign language from school in Abeokutei and by a Joy of Sign language give me by a book', 
                            'At the primary school in Lagos', 'kwara state for the deaf', 'through deaf school', 
                            'In deaf special school', 'I did learn sign language in Ibadan school for the deaf in 1967', 
                            'In my State at Special School Gombe, Nigeria', 'At Deaf school', 'University', 
                            'Through primary school', 'Owo Ondo state', 'Special institution', 
                            'Katsina state deaf school', 'College', 
                            'At school Federal college of education special Oyo state and University of Calabar, cross River state', 
                            'Are school', 'At special education center Gombe school for the deaf', 
                            'Ibadan school for the deaf, Ijokodo Polytechnic Road, Ibadan', 
                            'Through school for the deaf kuje', 'Logos deaf school', 
                            'I am Deaf myself. I learnt it in Deaf school') 
            THEN 'School'
        WHEN where_learned_sign_language IN ('home', 'at home and school') 
            THEN 'Home'
        WHEN where_learned_sign_language IN ('with Deaf community in Lagos', 'deaf friend', 'school and church', 
                            'both primary school and church', 'communication fingers', 'through deaf people', 
                            'projecet charitole group of the deaf', 
                            'I learned sign language from friends, church and finally in school', 
                            'from my deaf friend', 'Friends') 
            THEN 'Community/Friends'
        ELSE 'Other'
    END as where_learned_sign_language,
        CASE 
            WHEN communicate_with_family IN ('sign language', 'through sign language', 'sign language and writing', 'sign language hausa', 
                                'sign, speech and text etc', 'through writing, texting and signing and speaking', 
                                'writing, talking, sign language', 'sign language and sms and whatsapp', 
                                'using sign language and writing', 'communicate with family member through sign langua', 
                                'signing and writing', 'sign language and speaking in local language and w', 'speak/sign/write', 
                                'speaking, gestures, writing, and signing', 'hand/sign language', 'sign language and speaks', 
                                'Sign, by pen and paper, and char online what app', 'sign language, sometimes use our culture\'s languag', 
                                'Language sign language', 'by sign language and write', 'Through sign language because they know basic', 
                                'Communicate through spoke and sign language', 'Sign language and speak', 'gesturing, writing, and signing') 
                THEN 'Sign Language'
            WHEN communicate_with_family IN ('writing', 'hand writing on paper or sometimes signing hands', 'use body language or writing', 
                                'handwriting', 'write, speak the language they can understand and', 'write or chatting', 
                                'writing and text message', 'through text message and whatsapp', 'writing or local sign language', 
                                'Text message and writing', 'write and texting', 'social media, orally, written word', 
                                'Lips-reading/written in English Language') 
                THEN 'Writing'
            WHEN communicate_with_family IN ('speaking', 'oral communication', 'Oral reading', 'speaking and writing', 'speech reading', 
                                'speak and write', 'speaking, watching their mouth', 'through speaking', 'oral and english and igbo', 
                                'speaking, writing, and gesture', 'I used to speak and writing to them', 'speaking and gesturing', 
                                'speak', 'I communicate with them throughout speaker', 'oral communication and writing', 
                                'communicate my family members local', 'Oral') 
                THEN 'Speaking'
            WHEN communicate_with_family IN ('lipreading and writing exchange of notes', 'hausa sign language or read lip', 
                                'writing and lip reading communication', 'oral lip reading', 'speech and lip read', 
                                'sometimes sign language, but most time lip reading', 'Lip reading', 'Lip-reading', 
                                'THROUGH SPEAKING USING LIP READING AND WRITING SOM', 'By gesturing and lip-reading', 
                                'Lip reading, writing and sign language interpreter') 
                THEN 'Lip Reading'
            WHEN communicate_with_family IN ('gesturing', 'gesturing, writing and culture language') 
                THEN 'Gesturing'
            ELSE 'Other'
    END as communicate_with_family  
    FROM 
        {{ ref('stg_language_and_communication') }}
)

select * from stg_language_and_communication