; -------------------------------------------------
; 1. Declare the uninterpreted sort for people
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; 2. Declare predicates / functions
; -------------------------------------------------
; Does the person have dementia?
(declare-fun has_dementia (Person) Bool)

; Does the person have the mental capacity to make a will?
(declare-fun has_capacity_to_make_will (Person) Bool)

; Can the second person make a statutory will on behalf of the first?
(declare-fun can_make_statutory_will_on_behalf (Person Person) Bool)

; -------------------------------------------------
; 3. Declare constants for the individuals involved
; -------------------------------------------------
(declare-const grandmother Person)   ; the person who has dementia
(declare-const me Person)           ; the applicant (you)

; -------------------------------------------------
; 4. Knowledge base (facts from the scenario & the law)
; -------------------------------------------------
; The grandmother suffers from dementia
(assert (has_dementia grandmother))

; Because of her dementia she does NOT have the capacity to understand a will
(assert (not (has_capacity_to_make_will grandmother)))

; Legal rule (from the document):
; If a person lacks capacity to make a will, anyone may apply to the Court of Protection
; to make a statutory will on their behalf.
(assert (forall ((p Person) (a Person))
        (=> (not (has_capacity_to_make_will p))
            (can_make_statutory_will_on_behalf p a))))

; -------------------------------------------------
; 5. Test the specific question:
; "Can I make a will on her behalf?"
; -------------------------------------------------
(assert (can_make_statutory_will_on_behalf grandmother me))

; -------------------------------------------------
; 6. Check satisfiability (sat = Yes, unsat = No)
; -------------------------------------------------
(check-sat)
(get-model)