; Sorts
(declare-sort Thing 0)

; Predicates (uninterpreted relations)
(declare-fun is-numpus  (Thing) Bool)
(declare-fun is-dumpus  (Thing) Bool)
(declare-fun is-tumpus  (Thing) Bool)
(declare-fun is-jompus  (Thing) Bool)
(declare-fun is-impus   (Thing) Bool)
(declare-fun is-yumpus  (Thing) Bool)
(declare-fun is-floral  (Thing) Bool)
(declare-fun is-liquid  (Thing) Bool)
(declare-fun is-brown   (Thing) Bool)
(declare-fun is-zumpus   (Thing) Bool)
(declare-fun is-vumpus   (Thing) Bool)
(declare-fun is-wumpus   (Thing) Bool)
(declare-fun is-feisty   (Thing) Bool)
(declare-fun is-rompuse  (Thing) Bool)
(declare-fun is-bitter   (Thing) Bool)
(declare-fun is-kind     (Thing) Bool)
(declare-fun is-bright   (Thing) Bool)
(declare-fun is-hot      (Thing) Bool)
(declare-fun is-kind     (Thing) Bool) ; already declared above, kept for clarity

; Sam
(declare-const sam Thing)

; Knowledge base (universal rules)
; 1) Every numpus is floral
(assert (forall ((x Thing)) (=> (is-numpus x) (is-floral x))))
; 2) Every numpus is a dumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-dumpus x))))
; 3) Every dumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-tumpus x))))
; 4) Every tumpus is not brown
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-brown x)))))
; 5) Every tumpus is a jompus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-jompus x))))
; 6) Jompuses are bitter
(assert (forall ((x Thing)) (=> (is-jompus x) (is-bitter x))))
; 7) Jompuses are impuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-impus x))))
; 8) Impuses are yumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-yumpus x))))
; 9) Each impus is not liquid
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-liquid x)))))
; 10) Every vumpus is a wumpus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-wumpus x))))
; 11) Wumpuses are feisty
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-feisty x))))
; 12) Wumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-numpus x))))
; 13) Every vumpus is not kind
(assert (forall ((x Thing) (unused Int)) (=> (is-vumpus x) (not (is-kind x))))) ; extra binding to avoid accidental var capture

; 14) Zumpuses are bright
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-bright x))))
; 15) Every n ump us is floral (already covered by 1, but reiterated here for clarity)
; 16) Rompuses are liquid
(assert (forall ((x Thing)) (=> (is-rompuse x) (is-liquid x))))

; Facts about Sam
(assert (is-numpus sam))

; Test: Is "Sam is not liquid" entailed by the knowledge base?
(assert (not (is-liquid sam)))

; Check satisfiability and produce a model if sat
(check-sat)
(get-model)