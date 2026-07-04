;------------------------------------------------------------
; 1. Declare sorts
;------------------------------------------------------------
(declare-sort Person 0)
(declare-sort Property 0)
(declare-sort Country 0)

;------------------------------------------------------------
; 2. Declare functions / predicates
;------------------------------------------------------------
(declare-fun is_disabled (Person) Bool)                 ; person is disabled
(declare-fun owns        (Person Property) Bool)        ; person owns the property
(declare-fun lives_in    (Person Property) Bool)        ; person lives in the property
(declare-fun property_country (Property Country) Bool) ; property is in a given country
(declare-fun savings     (Person) Int)                  ; savings of a person (in £)
(declare-fun intends_to_live (Person Property) Bool)   ; intends to live there for 5 years
(declare-fun eligible    (Person) Bool)                ; eligible for a DFG
(declare-fun apply_grant (Person) Bool)                ; person makes a DFG application

;------------------------------------------------------------
; 3. Declare the concrete objects referred to in the scenario
;------------------------------------------------------------
(declare-const wife   Person)
(declare-const husband Person)
(declare-const home   Property)
(declare-const England Country)

;------------------------------------------------------------
; 4. Knowledge base (facts from the scenario & the policy)
;------------------------------------------------------------
; – The wife is paraplegic (disabled)
(assert (is_disabled wife))

; – The husband is not disabled (no information, assume false)
(assert (not (is_disabled husband)))

; – The couple own the property
(assert (owns husband home))

; – Both live in the property
(assert (lives_in wife home))
(assert (lives_in husband home))

; – The property is in England
(assert (property_country home England))

; – Savings are £5 000 (below the £6 000 threshold)
(assert (= (savings husband) 5000))

; – They intend to remain in the property for the next 5 years
(assert (intends_to_live husband home))
(assert (intends_to_live wife home))

;------------------------------------------------------------
; 5. Policy rules (encoded as universally quantified implications)
;------------------------------------------------------------
; Eligibility: a person can be eligible if either they or another
; disabled person lives in a property they own, they intend to stay,
; and the property is in England.
(assert
  (forall ((p Person) (q Person) (pr Property))
    (=> (and (or (is_disabled p) (is_disabled q))
             (owns p pr)
             (lives_in p pr)
             (lives_in q pr)
             (intends_to_live p pr)
             (property_country pr England))
        (eligible p))))

; Applying for a grant requires the applicant to be eligible.
(assert
  (forall ((p Person))
    (=> (apply_grant p) (eligible p))))

;------------------------------------------------------------
; 6. Test the question: “Can we apply for a Disabled Facilities Grant?”
;    (We model the husband as the applicant – the answer is the same
;     for either spouse, because the eligibility condition is met.)
;------------------------------------------------------------
(assert (apply_grant husband))

;------------------------------------------------------------
; 7. Check whether the set of assertions is satisfiable.
;    – SAT  → the application is possible.
;    – UNSAT → the application would be impossible.
;------------------------------------------------------------
(check-sat)
(get-model)