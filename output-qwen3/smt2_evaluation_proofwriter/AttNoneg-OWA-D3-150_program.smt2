; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (properties)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-furry (Thing) Bool)
(declare-fun is-nice (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-big (Thing) Bool)

; 3. Declare constants (entities)
(declare-const dave Thing)
(declare-const erin Thing)
(declare-const gary Thing)
(declare-const harry Thing)

; 4. Assert knowledge base (facts)
(assert (is-smart dave))
(assert (is-furry erin))
(assert (is-nice erin))
(assert (is-nice gary))
(assert (is-nice harry))
(assert (is-red harry))
(assert (is-smart harry))

; Rules
; Big things are furry
(assert (forall ((x Thing)) (=> (is-big x) (is-furry x))))
; If something is blue then it is big
(assert (forall ((x Thing)) (=> (is-blue x) (is-big x))))
; Red things are blue
(assert (forall ((x Thing)) (=> (is-red x) (is-blue x))))

; 5. Verification
; Question: Harry is not blue.
; We assert the statement to check if it is consistent (sat) or contradictory (unsat)
(assert (not (is-blue harry)))

; 6. Check satisfiability
(check-sat)
(get-model)