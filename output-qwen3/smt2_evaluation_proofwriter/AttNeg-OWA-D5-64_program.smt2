; ==============================================================================
; Reasoning Steps for "Bob is not quiet"
; ==============================================================================
; 1. Fact: Bob is young.
; 2. Rule: If someone is young then they are big.
;    Deduction: Bob is big.
; 3. Rule: Big people are smart.
;    Deduction: Bob is smart.
; 4. Rule: All smart people are white.
;    Deduction: Bob is white.
; 5. Rule: White people are quiet.
;    Deduction: Bob is quiet.
; 6. Question to Verify: "Bob is not quiet."
; 7. Conflict: Deduction (Bob is quiet) contradicts Question (Bob is not quiet).
; 8. Expected Result: unsat (The statement "Bob is not quiet" is False).
; ==============================================================================

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-white (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-round (Person) Bool)

; 3. Declare Constants (Individuals)
(declare-const anne Person)
(declare-const bob Person)
(declare-const erin Person)
(declare-const fiona Person)

; 4. Assert Knowledge Base (Facts)
; Anne Facts
(assert (is-quiet anne))
(assert (is-smart anne))
(assert (is-white anne))
(assert (not (is-young anne)))

; Bob Facts
(assert (is-young bob))

; Erin Facts
(assert (not (is-young erin)))

; Fiona Facts
(assert (is-big fiona))
(assert (is-quiet fiona))
(assert (is-red fiona))
(assert (is-smart fiona))

; 5. Assert Knowledge Base (Rules)
; White people are quiet
(assert (forall ((p Person)) (=> (is-white p) (is-quiet p))))

; If someone is young then they are big
(assert (forall ((p Person)) (=> (is-young p) (is-big p))))

; Young, smart people are round
(assert (forall ((p Person)) (=> (and (is-young p) (is-smart p)) (is-round p))))

; Smart, quiet people are round
(assert (forall ((p Person)) (=> (and (is-smart p) (is-quiet p)) (is-round p))))

; All quiet, big people are red
(assert (forall ((p Person)) (=> (and (is-quiet p) (is-big p)) (is-red p))))

; If Anne is big and Anne is young then Anne is round
(assert (=> (and (is-big anne) (is-young anne)) (is-round anne)))

; Big people are smart
(assert (forall ((p Person)) (=> (is-big p) (is-smart p))))

; All smart people are white
(assert (forall ((p Person)) (=> (is-smart p) (is-white p))))

; 6. Verification Scenario
; Question: "Bob is not quiet."
; We assert the negation of the desired truth (or the statement itself to test consistency).
; According to instructions: Assert the scenario being tested.
; Scenario: Bob is not quiet.
(assert (not (is-quiet bob)))

; 7. Check Satisfiability
(check-sat)
(get-model)