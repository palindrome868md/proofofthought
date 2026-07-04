; Reasoning Steps:
; 1. Analyze the Question: "Dave is white."
; 2. Identify Relevant Facts:
;    - Dave is furry.
;    - Rule: Furry things are white.
; 3. Logical Deduction:
;    - Since Dave is furry, and all furry things are white, Dave must be white.
; 4. Verification Strategy:
;    - Assert the Knowledge Base (facts and rules).
;    - Assert the statement to verify: (is-white Dave).
;    - Check Satisfiability.
;    - If 'sat', the statement is consistent/true given the KB.
;    - If 'unsat', the statement contradicts the KB (false).
; 5. Expected Result: 'sat' (True).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (properties)
(declare-fun is-furry (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-rough (Thing) Bool)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-white (Thing) Bool)
(declare-fun is-young (Thing) Bool)
(declare-fun is-round (Thing) Bool)

; 3. Declare constants (individuals)
(declare-const Dave Thing)
(declare-const Gary Thing)

; 4. Assert knowledge base (facts and rules)

; Facts about Dave
(assert (is-furry Dave))

; Facts about Gary
(assert (is-cold Gary))
(assert (is-furry Gary))
(assert (is-rough Gary))
(assert (is-smart Gary))
(assert (is-white Gary))
(assert (is-young Gary))
(assert (=> (and (is-furry Gary) (is-round Gary)) (is-young Gary)))

; General Rules
; Furry things are white
(assert (forall ((x Thing)) (=> (is-furry x) (is-white x))))

; All smart things are cold
(assert (forall ((x Thing)) (=> (is-smart x) (is-cold x))))

; If something is smart and white then it is cold
(assert (forall ((x Thing)) (=> (and (is-smart x) (is-white x)) (is-cold x))))

; If something is white then it is smart
(assert (forall ((x Thing)) (=> (is-white x) (is-smart x))))

; If something is white and smart then it is cold
(assert (forall ((x Thing)) (=> (and (is-white x) (is-smart x)) (is-cold x))))

; Round, rough things are white
(assert (forall ((x Thing)) (=> (and (is-round x) (is-rough x)) (is-white x))))

; Young, cold things are furry
(assert (forall ((x Thing)) (=> (and (is-young x) (is-cold x)) (is-furry x))))

; 5. Verification: Is Dave white?
; We assert the statement and check satisfiability.
(assert (is-white Dave))

; 6. Check satisfiability
(check-sat)
(get-model)