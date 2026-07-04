(declare-sort Entity 0)

; Predicates (uninterpreted predicates for each kind)
(declare-fun zumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun impuse (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun feisty (Entity) Bool)

; Constant Sally
(declare-const sally Entity)

; Knowledge base (universal rules)
; 1) Every zumpus is not opaque
(assert (forall ((x Entity)) (=> (zumpus x) (not (opaque x)))))

; 2) Numpuses are dumpuses
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))
; 3) Numpuses are brown
(assert (forall ((x Entity)) (=> (numpus x) (brown x))))

; 4) Every dumpus is amenable
(assert (forall ((x Entity)) (=> (dumpus x) (amenable x))))
; 5) Every dumpus is a vumpus
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))
; 6) Each vumpus is not cold
(assert (forall ((x Entity)) (=> (vumpus x) (not (cold x)))))
; 7) Each vumpus is a tumpus
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))
; 8) Every tumpus is wooden
(assert (forall ((x Entity)) (=> (tumpus x) (wooden x))))
; 9) Every tumpus is a rompus
(assert (forall ((x Entity)) (=> (tumpus x) (rompus x))))
; 10) Every rompus is floral
(assert (forall ((x Entity)) (=> (rompus x) (floral x))))
; 11) Rompuses are yumpuses
(assert (forall ((x Entity)) (=> (rompus x) (yumpus x))))
; 12) Every yumpus is bitter
(assert (forall ((x Entity)) (=> (yumpus x) (bitter x))))
; 13) Every yumpus is a wumpus
(assert (forall ((x Entity)) (=> (yumpus x) (wumpus x))))
; 14) Wumpuses are not feisty
(assert (forall ((x Entity)) (=> (wumpus x) (not (feisty x)))))
; 15) Wumpuses are jompuses
(assert (forall ((x Entity)) (=> (wumpus x) (jompus x))))

; Sally is a dumpus
(assert (dumpus sally))

; Test scenario: Sally is bitter
(assert (bitter sally))

(check-sat)
(get-model)