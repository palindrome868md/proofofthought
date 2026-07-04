; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for categories and properties)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)

(declare-fun is-mean (Thing) Bool)
(declare-fun is-brown (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-happy (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-fruity (Thing) Bool)

; 3. Declare constants
(declare-const rex Thing)

; 4. Assert knowledge base (facts and rules)

; Numpuses are not mean
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-mean x)))))

; Each zumpus is not brown
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-brown x)))))

; Numpuses are rompuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-rompus x))))

; Every rompus is not cold
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-cold x)))))

; Rompuses are vumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-vumpus x))))

; Vumpuses are not happy
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-happy x)))))

; Every vumpus is an impus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-impus x))))

; Each impus is liquid
(assert (forall ((x Thing)) (=> (is-impus x) (is-liquid x))))

; Impuses are jompuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-jompus x))))

; Jompuses are dull
(assert (forall ((x Thing)) (=> (is-jompus x) (is-dull x))))

; Every jompus is a tumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-tumpus x))))

; Every tumpus is spicy
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-spicy x))))

; Tumpuses are yumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-yumpus x))))

; Every yumpus is fruity
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-fruity x))))

; Each yumpus is a wumpus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-wumpus x))))

; Wumpuses are brown
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-brown x))))

; Wumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-dumpus x))))

; Rex is an impus
(assert (is-impus rex))

; 5. Verification: Test if "Rex is brown" is true
; Assert the statement to check consistency with KB
(assert (is-brown rex))

; Check satisfiability
(check-sat)
(get-model)