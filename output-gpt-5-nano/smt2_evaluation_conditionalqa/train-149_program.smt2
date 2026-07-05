; Scenario: Is it possible to stop the sister from visiting the father in a care home
; This SMT-LIB program encodes a simple knowledge base and a test for the possibility
; of a Court of Protection-style intervention to stop visits.

; 1) Declare sorts
(declare-sort Person 0)

; 2) Declare predicates / functions
(declare-fun has-capacity (Person) Bool)      ; person has mental capacity
(declare-fun visits (Person Person) Bool)      ; visiting relation: visits Visitor Patient
(declare-fun manipulating (Person Person) Bool) ; Visitor manipulating Patient (financial/other concerns)

; 3) Court decision predicate (one-off decision to stop visiting)
(declare-fun COP-stop-visit (Person Person) Bool)

; 4) Declare individuals involved in the scenario
(declare-const father Person)
(declare-const sister Person)

; 5) Knowledge base (facts)
(assert (not (has-capacity father)))          ; father lacks capacity (dementia)
(assert (visits sister father))               ; sister visits father
(assert (manipulating sister father))         ; sister is manipulating father (as per scenario)

; 6) Rule: If someone manipulates a person lacking capacity, a COP-style stop-visit decision can be made
(assert (=> (and (manipulating sister father) (not (has-capacity father)))
            (COP-stop-visit sister father)))

; 7) Test: Is it possible to stop sister from visiting father?
(assert (COP-stop-visit sister father))

; 8) Check satisfiability and provide a model
(check-sat)
(get-model)