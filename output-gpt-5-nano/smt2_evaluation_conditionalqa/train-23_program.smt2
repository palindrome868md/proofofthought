; Task: Can children stop a step-parent from handling probate?
; Strategy: Model a scenario where a step-mother is a potential probate administrator,
; and a child has filed a caveat to stop that probate grant. If the caveat exists, we
; can conclude the step-mother cannot be granted probate in this scenario.

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare constants (agents in the scenario)
(declare-const stepmother Person)
(declare-const child1 Person)
(declare-const child2 Person)

; 3. Declare predicates / relations
(declare-fun is-spouse (Person) Bool)
(declare-fun is-child (Person) Bool)
(declare-fun caveat-on (Person Person) Bool)  ; caveat-on accuser, against target
(declare-fun can-grant (Person) Bool)          ; can grant probate to this person

; 4. Knowledge base (scenario setup)
(assert (is-spouse stepmother))   ; stepmother is the spouse of the deceased
(assert (is-child child1))        ; child1 is a child
(assert (is-child child2))        ; child2 is a child

; 5. Test scenario: a child has filed a caveat against the step-mother's probate
(assert (caveat-on child1 stepmother))

; 6. Verification constraint: if a caveat exists against the step-mother, she cannot be granted probate
(assert (=> (caveat-on child1 stepmother) (not (can-grant stepmother))))

; 7. Directly test the question by asserting the outcome (in this scenario, the step-mother cannot be granted)
(assert (not (can-grant stepmother)))

; 8. Check satisfiability and provide a model
(check-sat)
(get-model)