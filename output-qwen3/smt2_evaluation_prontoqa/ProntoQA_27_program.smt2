; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for categories and properties)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)

(declare-fun is-sour (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-aggressive (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-hot (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-blue (Thing) Bool)

; 3. Declare constants
(declare-const Fae Thing)

; 4. Assert knowledge base (facts and rules)
; Wumpuses are not sour
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-sour x)))))
; Each wumpus is a rompus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-rompus x))))
; Rompuses are dull
(assert (forall ((x Thing)) (=> (is-rompus x) (is-dull x))))
; Each rompus is a dumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-dumpus x))))
; Every dumpus is feisty
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-feisty x))))
; Jompuses are aggressive
(assert (forall ((x Thing)) (=> (is-jompus x) (is-aggressive x))))
; Dumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-tumpus x))))
; Tumpuses are opaque
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-opaque x))))
; Every tumpus is a numpus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-numpus x))))
; Numpuses are hot
(assert (forall ((x Thing)) (=> (is-numpus x) (is-hot x))))
; Numpuses are zumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-zumpus x))))
; Zumpuses are large
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-large x))))
; Every zumpus is a vumpus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-vumpus x))))
; Vumpuses are blue
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-blue x))))
; Every vumpus is an impus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-impus x))))
; Impuses are not aggressive
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-aggressive x)))))
; Impuses are yumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-yumpus x))))

; Fact: Fae is a tumpus
(assert (is-tumpus Fae))

; 5. Verification
; Question: Is the following statement true or false? Fae is not aggressive.
; We assert the statement to check if it is consistent (sat = True) or contradictory (unsat = False)
(assert (not (is-aggressive Fae)))

(check-sat)
(get-model)