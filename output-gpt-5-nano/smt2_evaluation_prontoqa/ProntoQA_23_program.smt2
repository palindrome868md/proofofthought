; Sort for all individuals
(declare-sort Thing 0)

; Predicates representing each kind/property
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-amenable (Thing) Bool)
(declare-fun is-impuse (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-brown (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-bitter (Thing) Bool)

; Sally as an individual
(declare-const sally Thing)

; Knowledge base / rules

; 1) zumpus -> not opaque
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-opaque x)))))
; 2) zumpus -> numpus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-numpus x))))
; 3) numpus -> brown
(assert (forall ((x Thing)) (=> (is-numpus x) (is-brown x))))
; 4) numpus -> dumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-dumpus x))))
; 5) dumpus -> amenable
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-amenable x))))
; 6) impuse -> not bitter
(assert (forall ((x Thing)) (=> (is-impuse x) (not (is-bitter x)))))
; 7) dumpus -> vumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-vumpus x))))
; 8) vumpus -> not cold
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-cold x)))))
; 9) vumpus -> tumpus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-tumpus x))))
; 10) tumpus -> wooden
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-wooden x))))
; 11) tumpus -> rompus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-rompus x))))
; 12) rompus -> floral
(assert (forall ((x Thing)) (=> (is-rompus x) (is-floral x))))
; 13) rompus -> yumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-yumpus x))))
; 14) yumpus -> bitter
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-bitter x))))
; 15) yumpus -> wumpus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-wumpus x))))
; 16) wumpus -> not feisty
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-feisty x)))))
; 17) wumpus -> jompus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-jompus x))))
; 18) numpus -> dumpus (already included but explicit)
(assert (forall ((x Thing)) (=> (is-numpus x) (is-dumpus x))))
; 19) numpus -> brown (redundant with 3, but explicit)
(assert (forall ((x Thing)) (=> (is-numpus x) (is-brown x))))

; Sally is a dumpus (scenario)
(assert (is-dumpus sally))

; Test scenario: Sally is bitter
(assert (is-bitter sally))

; Check satisfiability to answer the question "Is Sally bitter?"
(check-sat)
(get-model)