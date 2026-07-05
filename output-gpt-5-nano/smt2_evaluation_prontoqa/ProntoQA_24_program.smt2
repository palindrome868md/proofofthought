; Sort for all entities
(declare-sort Entity 0)

; Predicates (unary relations)
(declare-fun Numpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Floral (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Brown (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Bitter (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Hot (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)

; Constant for Alex
(declare-const alex Entity)

; Knowledge base
; 1) Every numpus is floral
(assert (forall ((x Entity)) (=> (Numpus x) (Floral x))))
; 2) Numpuses are jompuses
(assert (forall ((x Entity)) (=> (Numpus x) (Jompus x))))
; 3) Jompuses are not nervous
(assert (forall ((x Entity)) (=> (Jompus x) (not (Nervous x)))))
; 4) Each jompus is an impus
(assert (forall ((x Entity)) (=> (Jompus x) (Impus x))))
; 5) Every impus is brown
(assert (forall ((x Entity)) (=> (Impus x) (Brown x))))
; 6) Every dumpus is not amenable
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Amenable x)))))
; 7) Each impus is a wumpus
(assert (forall ((x Entity)) (=> (Impus x) (Wumpus x))))
; 8) Wumpuses are not bitter
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Bitter x)))))
; 9) Each wumpus is a zumpus
(assert (forall ((x Entity)) (=> (Wumpus x) (Zumpus x))))
; 10) Every zumpus is not small
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Small x)))))
; 11) Zumpuses are vumpuses
(assert (forall ((x Entity)) (=> (Zumpus x) (Vumpus x))))
; 12) Vumpuses are hot
(assert (forall ((x Entity)) (=> (Vumpus x) (Hot x))))
; 13) Vumpuses are rompuses
(assert (forall ((x Entity)) (=> (Vumpus x) (Rompus x))))
; 14) Rompuses are amenable
(assert (forall ((x Entity)) (=> (Rompus x) (Amenable x))))
; 15) Every rompus is a tumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Tumpus x))))
; 16) Every tumpus is bright
(assert (forall ((x Entity)) (=> (Tumpus x) (Bright x))))
; 17) Every tumpus is a yumpus
(assert (forall ((x Entity)) (=> (Tumpus x) (Yumpus x))))
; 18) Alex is an impus
(assert (Impus alex))

; Test: Is Alex amenable?
(assert (Amenable alex))

; Check satisfiability
(check-sat)
(get-model)