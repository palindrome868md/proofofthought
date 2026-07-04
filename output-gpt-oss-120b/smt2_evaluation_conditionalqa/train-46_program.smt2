; -------------------------------------------------
; 1. Declare uninterpreted sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Property 0)

; -------------------------------------------------
; 2. Declare functions (predicates and values)
; -------------------------------------------------
; Person is disabled?
(declare-fun disabled (Person) Bool)

; Person is a tenant of a property?
(declare-fun tenant_of (Person Property) Bool)

; How many years the person intends to live in the property
(declare-fun intend_years (Person Property) Int)

; Eligibility for a Disabled Facilities Grant
(declare-fun grant_eligible (Person Property) Bool)

; -------------------------------------------------
; 3. Assert the eligibility rule from the document
;    (requires at least 5 years of intended residence)
; -------------------------------------------------
(assert
  (forall ((p Person) (pr Property))
    (=> (and (disabled p)
             (tenant_of p pr)
             (>= (intend_years p pr) 5))
        (grant_eligible p pr))))

; -------------------------------------------------
; 4. Encode the specific scenario
; -------------------------------------------------
(declare-const me Person)
(declare-const myprop Property)

; I am disabled
(assert (disabled me))

; I am a tenant of the rented property
(assert (tenant_of me myprop))

; I intend to live there for 3 years
(assert (= (intend_years me myprop) 3))

; -------------------------------------------------
; 5. Test the claim: "I can apply for a Disabled Facilities Grant"
;    i.e., assert that I am eligible
; -------------------------------------------------
(assert (grant_eligible me myprop))

; -------------------------------------------------
; 6. Check satisfiability (sat = claim true, unsat = claim false)
; -------------------------------------------------
(check-sat)
(get-model)