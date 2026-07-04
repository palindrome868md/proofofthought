; Reasoning Steps:
; 1. Fae is a Dumpus (Fact).
; 2. Dumpuses are Numpuses (Rule: Dumpus -> Numpus).
; 3. Numpuses are Zumpuses (Rule: Numpus -> Zumpus).
; 4. Zumpuses are Wumpuses (Rule: Zumpus -> Wumpus).
; 5. Wumpuses are Impuses (Rule: Wumpus -> Impus).
; 6. Impuses are Wooden (Rule: Impus -> Wooden).
; 7. Chain: Fae -> Dumpus -> Numpus -> Zumpus -> Wumpus -> Impus -> Wooden.
; 8. Conclusion: Fae is Wooden.
; 9. Verification: Assert (is-wooden fae) and check satisfiability. Expected: sat (True).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (Predicates)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-bitter (Thing) Bool)
(declare-fun is-fruity (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)

; 3. Declare constants
(declare-const fae Thing)

; 4. Assert knowledge base (facts)
; Dumpuses are cold
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-cold x))))
; Dumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-numpus x))))
; Each numpus is not bitter
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-bitter x)))))
; Every numpus is a zumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-zumpus x))))
; Zumpuses are fruity
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-fruity x))))
; Zumpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-wumpus x))))
; Wumpuses are large
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-large x))))
; Each tumpus is not wooden
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-wooden x)))))
; Each wumpus is an impus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-impus x))))
; Every impus is wooden
(assert (forall ((x Thing)) (=> (is-impus x) (is-wooden x))))
; Impuses are rompuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-rompus x))))
; Fae is a dumpus
(assert (is-dumpus fae))

; 5. Check satisfiability
; Question: Is Fae wooden?
; We assert the statement to test if it is consistent (True) with the KB
(assert (is-wooden fae))

(check-sat)
(get-model)