(declare-sort Entity 0)

; Constants
(declare-const max Entity)

; Predicates (unary relations)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun NotAmenable (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun NotMetallic (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Cold (Entity) Bool)

; 1) Max is an impus
(assert (Impus max))

; 2) Vumpuses are fruity
(assert (forall ((x Entity)) (=> (Vumpus x) (Fruity x))))
; 3) Vumpuses are jompuses
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))
; 4) Jompuses are opaque
(assert (forall ((x Entity)) (=> (Jompus x) (Opaque x))))
; 5) Every jompus is a wumpus
(assert (forall ((x Entity)) (=> (Jompus x) (Wumpus x))))
; 6) Every wumpus is nervous
(assert (forall ((x Entity)) (=> (Wumpus x) (Nervous x))))
; 7) Each wumpus is an impus
(assert (forall ((x Entity)) (=> (Wumpus x) (Impus x))))
; 8) Every impus is sour
(assert (forall ((x Entity)) (=> (Impus x) (Sour x))))
; 9) Impuses are tumpuses
(assert (forall ((x Entity)) (=> (Impus x) (Tumpus x))))
; 10) Every tumpus is not amenable
(assert (forall ((x Entity)) (=> (Tumpus x) (NotAmenable x))))
; 11) Each tumpus is a yumpus
(assert (forall ((x Entity)) (=> (Tumpus x) (Yumpus x))))
; 12) Yumpuses are not metallic
(assert (forall ((x Entity)) (=> (Yumpus x) (NotMetallic x))))
; 13) Yumpuses are numpuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Numpus x))))
; 14) Numpuses are large
(assert (forall ((x Entity)) (=> (Numpus x) (Large x))))
; 15) Every numpus is a rompus
(assert (forall ((x Entity)) (=> (Numpus x) (Rompus x))))
; 16) Dumpuses are not cold
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Cold x)))))
; 17) Each rompus is cold
(assert (forall ((x Entity)) (=> (Rompus x) (Cold x))))
; 18) Each rompus is a zumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Zumpus x))))

; 19) Test scenario: Max is not cold
(assert (not (Cold max)))

; 20) Check satisfiability
(check-sat)
(get-model)