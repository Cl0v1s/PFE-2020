ALTER TABLE adcog_user
ADD linkedIn VARCHAR(255) COLLATE utf8_unicode_ci,
ADD options int(11)	COLLATE utf8_unicode_ci,
ADD abroad tinyint (1) COLLATE utf8_unicode_ci,
ADD user_description VARCHAR(255) COLLATE utf8_unicode_ci;

-- options : ROBOTIQUE = 1 ; IA = 2 ; SC = 3 ; AA = 4 ; ANCIEN PARCOURS COGNITIQUE = 5 
