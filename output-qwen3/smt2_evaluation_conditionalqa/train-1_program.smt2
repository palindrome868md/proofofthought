; Gender Recognition Certificate Eligibility Verification
; Based on UK Government Guidelines

; ==================== SORTS ====================
(declare-sort Person 0)
(declare-sort Country 0)
(declare-sort Certificate 0)

; ==================== FUNCTIONS ====================
; Age and residence
(declare-fun age (Person) Int)
(declare-fun born-in (Person) Country)
(declare-fun lives-in (Person) Country)
(declare-fun years-in-uk (Person) Int)

; Gender certificate status
(declare-fun has-gender-certificate (Person) Bool)
(declare-fun certificate-country (Person) Country)
(declare-fun is-approved-country (Country) Bool)
(declare-fun has-proof-documents (Person) Bool)

; Medical requirements
(declare-fun has-gender-dysphoria-diagnosis (Person) Bool)
(declare-fun has-surgery (Person) Bool)
(declare-fun years-lived-acquired-gender (Person) Int)
(declare-fun intends-permanent-acquired-gender (Person) Bool)

; Partnership requirements (for alternative route)
(declare-fun has-protected-partnership-before-2014 (Person) Bool)
(declare-fun lives-in-uk-mostly (Person) Bool)

; Eligibility predicates
(declare-fun eligible-overseas-route (Person) Bool)
(declare-fun eligible-standard-route (Person) Bool)
(declare-fun eligible-alternative-route (Person) Bool)
(declare-fun eligible-any-route (Person) Bool)

; ==================== CONSTANTS ====================
(declare-const applicant Person)
(declare-const australia Country)
(declare-const uk Country)

; ==================== KNOWLEDGE BASE ====================

; Overseas route: eligible if gender legally recognized in approved country with documents, age 18+
(assert (forall ((p Person) (c Country))
  (=> (and (has-gender-certificate p)
           (= (certificate-country p) c)
           (is-approved-country c)
           (has-proof-documents p)
           (>= (age p) 18))
      (eligible-overseas-route p))))

; Standard route: age 18+, diagnosis, 2 years lived, intends permanent
(assert (forall ((p Person))
  (=> (and (>= (age p) 18)
           (has-gender-dysphoria-diagnosis p)
           (>= (years-lived-acquired-gender p) 2)
           (intends-permanent-acquired-gender p))
      (eligible-standard-route p))))

; Alternative route: age 18+, diagnosis or surgery, UK resident, protected partnership before 2014, 6 years before 2014
(assert (forall ((p Person))
  (=> (and (>= (age p) 18)
           (or (has-gender-dysphoria-diagnosis p) (has-surgery p))
           (lives-in-uk-mostly p)
           (intends-permanent-acquired-gender p)
           (has-protected-partnership-before-2014 p)
           (>= (years-lived-acquired-gender p) 6))
      (eligible-alternative-route p))))

; Any route makes person eligible
(assert (forall ((p Person))
  (=> (or (eligible-overseas-route p)
          (eligible-standard-route p)
          (eligible-alternative-route p))
      (eligible-any-route p))))

; Australia is an approved country for overseas route
(assert (is-approved-country australia))

; ==================== APPLICANT SCENARIO ====================
; Born and raised in Australia
(assert (= (born-in applicant) australia))

; Has gender certificate from Australia
(assert (has-gender-certificate applicant))
(assert (= (certificate-country applicant) australia))

; Has proof documents
(assert (has-proof-documents applicant))

; Moved to UK 3 years ago
(assert (= (lives-in applicant) uk))
(assert (= (years-in-uk applicant) 3))

; Age 18 or over (assumed adult)
(assert (>= (age applicant) 18))

; Intends to live in acquired gender permanently
(assert (intends-permanent-acquired-gender applicant))

; ==================== VERIFICATION ====================
; Question: Is the applicant eligible to apply for Gender Recognition Certificate in UK?
; We test if eligible-any-route is true for the applicant
(assert (eligible-any-route applicant))

(check-sat)
(get-model)