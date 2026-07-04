; Reasoning Steps:
; 1. Analyze Facts about Harry:
;    - Harry is green (asserted).
;    - Harry is young (asserted).
; 2. Analyze Rules relevant to Harry:
;    - Rule: If something is young then it is blue.
;      Since Harry is young, Harry is blue.
;    - Rule: If something is blue and green then it is not quiet.
;      Since Harry is blue (derived) and green (fact), Harry is NOT quiet.
; 3. Analyze Question:
;    - "Harry is quiet."
; 4. Verification Strategy:
;    - Assert the Knowledge Base.
;    - Assert the statement in question: (is-quiet Harry).
;    - Check satisfiability.
;    - Since the KB implies (not (is-quiet Harry)), asserting (is-quiet Harry) creates a contradiction.
;    - Expected Result: unsat (which means the statement is False).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions
(declare-fun is-smart (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-quiet (Thing) Bool)
(declare-fun is-nice (Thing) Bool)
(declare-fun is-round (Thing) Bool)
(declare-fun is-green (Thing) Bool)
(declare-fun is-young (Thing) Bool)

; 3. Declare constants
(declare-const Anne Thing)
(declare-const Charlie Thing)
(declare-const Erin Thing)
(declare-const Harry Thing)

; 4. Assert knowledge base (facts)
; Facts
(assert (is-smart Anne))
(assert (not (is-blue Charlie)))
(assert (is-quiet Charlie))
(assert (not (is-nice Erin)))
(assert (is-round Erin))
(assert (is-green Harry))
(assert (is-young Harry))

; Rules
; Smart things are green.
(assert (forall ((x Thing)) (=> (is-smart x) (is-green x))))
; If Anne is round then Anne is young.
(assert (=> (is-round Anne) (is-young Anne)))
; If something is blue and green then it is not quiet.
(assert (forall ((x Thing)) (=> (and (is-blue x) (is-green x)) (not (is-quiet x)))))
; If something is green and smart then it is round.
(assert (forall ((x Thing)) (=> (and (is-green x) (is-smart x)) (is-round x))))
; If something is young then it is blue.
(assert (forall ((x Thing)) (=> (is-young x) (is-blue x))))
; Smart things are nice.
(assert (forall ((x Thing)) (=> (is-smart x) (is-nice x))))
; If Harry is quiet and Harry is not smart then Harry is young.
(assert (=> (and (is-quiet Harry) (not (is-smart Harry))) (is-young Harry)))

; 5. Check satisfiability (Test: Harry is quiet)
(assert (is-quiet Harry))

(check-sat)
(get-model)