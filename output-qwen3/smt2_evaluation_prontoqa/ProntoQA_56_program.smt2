; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for types and properties)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)

(declare-fun is-bright (Thing) Bool)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-hot (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-brown (Thing) Bool)
(declare-fun is-bitter (Thing) Bool)

; 3. Declare constants
(declare-const sam Thing)

; 4. Assert knowledge base (facts and rules)
; Zumpuses are bright
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-bright x))))
; Every zumpus is a vumpus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-vumpus x))))
; Each vumpus is not kind
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-kind x)))))
; Each vumpus is a wumpus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-wumpus x))))
; Wumpuses are feisty
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-feisty x))))
; Wumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-numpus x))))
; Each numpus is floral
(assert (forall ((x Thing)) (=> (is-numpus x) (is-floral x))))
; Every numpus is a dumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-dumpus x))))
; Every dumpus is hot
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-hot x))))
; Rompuses are liquid
(assert (forall ((x Thing)) (=> (is-rompus x) (is-liquid x))))
; Each dumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-tumpus x))))
; Every tumpus is not brown
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-brown x)))))
; Every tumpus is a jompus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-jompus x))))
; Jompuses are bitter
(assert (forall ((x Thing)) (=> (is-jompus x) (is-bitter x))))
; Jompuses are impuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-impus x))))
; Each impus is not liquid
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-liquid x)))))
; Impuses are yumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-yumpus x))))

; Sam is a numpus
(assert (is-numpus sam))

; 5. Verification
; Question: Is the following statement true or false? Sam is not liquid.
; We assert the statement "Sam is not liquid" to check if it is consistent (True)
(assert (not (is-liquid sam)))

; Check satisfiability
(check-sat)
(get-model)