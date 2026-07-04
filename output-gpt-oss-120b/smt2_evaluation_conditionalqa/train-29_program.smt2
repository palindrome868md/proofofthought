;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------------
; Missing status of a person
(declare-fun missing (Person) Bool)
; Number of days the person has been missing
(declare-fun missing_days (Person) Int)
; Business‑partner relationship (applicant, missing person)
(declare-fun business_partner (Person Person) Bool)
; Sufficient interest for applying as guardian
(declare-fun sufficient_interest (Person Person) Bool)
; Ability to apply for guardianship of the missing person
(declare-fun can_apply (Person Person) Bool)
; Age of a person (required to be >18)
(declare-fun age (Person) Int)

;--- Constants -----------------------------------------------------
(declare-const me Person)        ; the applicant (me)
(declare-const partner Person)   ; the missing business partner

;--- Knowledge base ------------------------------------------------
; The partner has been missing for six months (≈180 days)
(assert (missing partner))
(assert (= (missing_days partner) 180))

; I am over 18 years old
(assert (> (age me) 18))

; Business‑partner relationship gives a sufficient interest
(assert (business_partner me partner))

;--- Rules ---------------------------------------------------------
; Rule 1: If a person is missing ≥90 days and the applicant has sufficient
;         interest, the applicant may apply for guardianship.
(assert (forall ((a Person) (p Person))
        (=> (and (missing p)
                 (>= (missing_days p) 90)
                 (sufficient_interest a p))
            (can_apply a p))))

; Rule 2: Being a business partner provides sufficient interest.
(assert (forall ((a Person) (p Person))
        (=> (business_partner a p)
            (sufficient_interest a p))))

;--- Test the scenario ---------------------------------------------
; Ask: Can I apply to manage my missing business partner's finances?
(assert (can_apply me partner))

;--- Decision -------------------------------------------------------
(check-sat)
(get-model)