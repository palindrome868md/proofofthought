; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-happy (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-angry (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)

; 3. Declare constants
(declare-const Max Thing)

; 4. Assert knowledge base (facts and rules)
; Each rompus is spicy
(assert (forall ((x Thing)) (=> (is-rompus x) (is-spicy x))))
; Rompuses are zumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-zumpus x))))
; Each zumpus is cold
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-cold x))))
; Zumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-dumpus x))))
; Every dumpus is happy
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-happy x))))
; Dumpuses are vumpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-vumpus x))))
; Each vumpus is blue
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-blue x))))
; Vumpuses are jompuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-jompus x))))
; Jompuses are not large
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-large x)))))
; Every jompus is a wumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-wumpus x))))
; Every impus is angry
(assert (forall ((x Thing)) (=> (is-impus x) (is-angry x))))
; Each wumpus is not angry
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-angry x)))))
; Wumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-tumpus x))))
; Each tumpus is dull
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dull x))))
; Every tumpus is a numpus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-numpus x))))
; Numpuses are not luminous
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-luminous x)))))
; Numpuses are yumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-yumpus x))))

; Fact: Max is a zumpus
(assert (is-zumpus Max))

; 5. Verification: Is Max angry?
; Assert the statement to test
(assert (is-angry Max))

; Check satisfiability
(check-sat)
(get-model)