; Domain
(declare-sort Entity 0)

; Constants
(declare-const polly Entity)

; Predicates / relations
(declare-fun vumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun angry (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun brown (Entity) Bool)

; Knowledge base
(assert (vumpus polly))

; Vumpus -> Jompus
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))
; Jompus -> earthy
(assert (forall ((x Entity)) (=> (jompus x) (earthy x))))
; Jompus -> wumpus
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))
; Wumpus -> not transparent
(assert (forall ((x Entity)) (=> (wumpus x) (not (transparent x)))))
; Wumpus -> yumpus
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))
; Yumpus -> impus
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))
; Impus -> dumpus
(assert (forall ((x Entity)) (=> (impus x) (dumpus x))))
; Dumpus -> brown
(assert (forall ((x Entity)) (=> (dumpus x) (brown x))))
; Dumpus -> zumpus
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))
; Zumpus -> not sour
(assert (forall ((x Entity)) (=> (zumpus x) (not (sour x)))))
; Zumpus -> numpus
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))
; Numpus -> not angry
(assert (forall ((x Entity)) (=> (numpus x) (not (angry x)))))
; Numpus -> tumpus
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))
; Vumpus -> wooden
(assert (forall ((x Entity)) (=> (vumpus x) (wooden x))))
; Rompus -> happy
(assert (forall ((x Entity)) (=> (rompus x) (happy x))))
; Impus -> not happy
(assert (forall ((x Entity)) (=> (impus x) (not (happy x))))))
; Impus -> dumpus
(assert (forall ((x Entity)) (=> (impus x) (dumpus x))))

; Test: Polly is not happy
(assert (not (happy polly)))

; Check satisfiability
(check-sat)
(get-model)