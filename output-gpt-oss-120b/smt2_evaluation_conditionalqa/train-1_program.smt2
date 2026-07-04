;-------------------------------------------------
; Declarations
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Country 0)

; Predicates / functions
(declare-fun age_over_18 (Person) Bool)
(declare-fun born_in (Person Country) Bool)
(declare-fun raised_in (Person Country) Bool)
(declare-fun gender_certificate (Person Country) Bool) ; certificate issued in a country
(declare-fun resident_years (Person Country) Int)      ; years lived in a country
(declare-fun approved_country (Country) Bool)          ; country accepted for overseas route
(declare-fun can_apply (Person) Bool)                  ; eligible for a GRC

; Constant representing the asker
(declare-const me Person)

; Countries used in the scenario
(declare-const australia Country)
(declare-const uk Country)

;-------------------------------------------------
; Knowledge base (facts from the scenario)
;-------------------------------------------------
(assert (age_over_18 me))                     ; you are an adult
(assert (born_in me australia))
(assert (raised_in me australia))
(assert (gender_certificate me australia))   ; gender change recognised in Australia
(assert (= (resident_years me uk) 3))        ; have lived in the UK for 3 years

; Australia is an approved country for the overseas route
(assert (approved_country australia))

;-------------------------------------------------
; Rule: overseas route eligibility
;-------------------------------------------------
; If a person is 18+, holds a gender‑change certificate issued by an
; approved country, then they can apply for a Gender Recognition Certificate.
(assert (forall ((p Person) (c Country))
  (=> (and (age_over_18 p)
           (gender_certificate p c)
           (approved_country c))
      (can_apply p))))

;-------------------------------------------------
; Test the question: "Am I eligible to apply?"
;-------------------------------------------------
(assert (can_apply me))

;-------------------------------------------------
; Solve
;-------------------------------------------------
(check-sat)   ; expected result: sat  (the person is eligible)
(get-model)