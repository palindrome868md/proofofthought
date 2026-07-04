; Reasoning Steps:
; 1. Analyze the chain of implications starting from Fae.
;    - Fact: Fae is an impus.
;    - Rule: Every impus is a yumpus.
;    - Rule: Yumpuses are zumpuses.
;    - Rule: Each zumpus is a vumpus.
;    - Rule: Vumpuses are tumpuses.
;    - Rule: Every tumpus is blue.
;    - Deduction: Fae is an impus -> yumpus -> zumpus -> vumpus -> tumpus -> blue.
;    - Conclusion: Fae is blue.
; 2. Analyze the statement to verify: "Fae is not blue".
;    - This contradicts the deduction that Fae is blue.
; 3. SMT Strategy:
;    - Assert the Knowledge Base (all rules and facts).
;    - Assert the statement to test: (not (is-blue Fae)).
;    - Run (check-sat).
;    - Expected Result: unsat (meaning the statement is False).

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates for Categories)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-impu (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)

; 2. Declare Functions (Predicates for Properties)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-happy (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-bright (Thing) Bool)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-small (Thing) Bool)

; 3. Declare Constants
(declare-const Fae Thing)

; 4. Assert Knowledge Base (Rules)
; Jompuses are not blue
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-blue x)))))
; Each rompus is happy
(assert (forall ((x Thing)) (=> (is-rompus x) (is-happy x))))
; Rompuses are dumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-dumpus x))))
; Dumpuses are not cold
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-cold x)))))
; Each dumpus is a wumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-wumpus x))))
; Each wumpus is liquid
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-liquid x))))
; Each wumpus is an impus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-impu x))))
; Each impus is kind
(assert (forall ((x Thing)) (=> (is-impu x) (is-kind x))))
; Every impus is a yumpus
(assert (forall ((x Thing)) (=> (is-impu x) (is-yumpus x))))
; Each yumpus is bright
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-bright x))))
; Yumpuses are zumpuses
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-zumpus x))))
; Each zumpus is sour
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-sour x))))
; Each zumpus is a vumpus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-vumpus x))))
; Every vumpus is small
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-small x))))
; Vumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-tumpus x))))
; Every tumpus is blue
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-blue x))))
; Every tumpus is a numpus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-numpus x))))

; 4. Assert Knowledge Base (Facts)
; Fae is an impus
(assert (is-impu Fae))

; 5. Verification
; Test Statement: "Fae is not blue"
; We assert the negation of the derived fact to check for contradiction.
(assert (not (is-blue Fae)))

; 6. Check Satisfiability
(check-sat)
(get-model)