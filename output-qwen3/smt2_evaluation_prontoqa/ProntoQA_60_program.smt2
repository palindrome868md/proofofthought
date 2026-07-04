; Reasoning Steps:
; 1. Sam is a Wumpus (Fact).
; 2. Wumpus -> Impus (Rule). So Sam is an Impus.
; 3. Impus -> Numpus (Rule). So Sam is a Numpus.
; 4. Numpus -> Vumpus (Rule). So Sam is a Vumpus.
; 5. Vumpus -> Dumpus (Rule). So Sam is a Dumpus.
; 6. Dumpus -> Not Mean (Rule). So Sam is Not Mean.
; 7. Query: Is Sam Mean?
; 8. We assert (is-mean Sam). Since KB implies (not (is-mean Sam)), this should be UNSAT.
; 9. UNSAT means the statement "Sam is mean" is False.

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-hot (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-mean (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-large (Thing) Bool)

; 3. Declare constants
(declare-const Sam Thing)

; 4. Assert knowledge base (facts)
; Wumpuses are large
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-large x))))
; Each wumpus is an impus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-impus x))))
; Each impus is not hot
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-hot x)))))
; Impuses are numpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-numpus x))))
; Every numpus is earthy
(assert (forall ((x Thing)) (=> (is-numpus x) (is-earthy x))))
; Zumpuses are mean
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-mean x))))
; Numpuses are vumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-vumpus x))))
; Vumpuses are liquid
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-liquid x))))
; Vumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-dumpus x))))
; Dumpuses are not mean
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-mean x)))))
; Dumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-tumpus x))))
; Sam is a wumpus
(assert (is-wumpus Sam))

; 5. Verification: Is Sam mean?
; Assert the statement to test
(assert (is-mean Sam))

; Check satisfiability
(check-sat)
(get-model)