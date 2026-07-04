; SMT-LIB 2.0 Program for Theorem Proving
; Question: Is the statement "Wren is not angry" true or false?

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Constants
(declare-const Wren Thing)

; 3. Declare Functions (Predicates)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-angry (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-brown (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-dull (Thing) Bool)

; 4. Assert Knowledge Base

; Fact: Wren is a jompus
(assert (is-jompus Wren))

; Rule: Each jompus is not small
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-small x)))))

; Rule: Each wumpus is angry
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-angry x))))

; Rule: Each jompus is a zumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-zumpus x))))

; Rule: Zumpuses are temperate
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-temperate x))))

; Rule: Zumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-tumpus x))))

; Rule: Tumpuses are brown
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-brown x))))

; Rule: Tumpuses are yumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-yumpus x))))

; Rule: Yumpuses are wooden
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-wooden x))))

; Rule: Yumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-dumpus x))))

; Rule: Each dumpus is not angry
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-angry x)))))

; Rule: Every dumpus is a numpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-numpus x))))

; Rule: Numpuses are not dull
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-dull x)))))

; Rule: Every numpus is a vumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-vumpus x))))

; 5. Verification
; Statement to test: "Wren is not angry"
; If this assertion is satisfiable (sat) given the KB, the statement is True.
; If it is unsatisfiable (unsat), the statement is False.
(assert (not (is-angry Wren)))

; 6. Check Satisfiability
(check-sat)
(get-model)