(declare-sort Entity 0)

; Predicates
(declare-fun jompus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun rompous (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun transparent (Entity) Bool)

; Rex
(declare-const Rex Entity)

; Knowledge base
(assert (jompus Rex))

; 1) Each jompus is earthy
(assert (forall ((x Entity)) (=> (jompus x) (earthy x))))

; 2) Jompuses are yumpuses
(assert (forall ((x Entity)) (=> (jompus x) (yumpus x))))

; 3) Yumpuses are metallic
(assert (forall ((x Entity)) (=> (yumpus x) (metallic x))))

; 4) Each yumpus is an impus
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))

; 5) Each dumpus is not transparent
(assert (forall ((x Entity)) (=> (dumpus x) (not (transparent x)))))

; 6) Impuses are nervous
(assert (forall ((x Entity)) (=> (impus x) (nervous x))))

; 7) Impuses are rompuses
(assert (forall ((x Entity)) (=> (impus x) (rompous x))))

; 8) Every rompus is small
(assert (forall ((x Entity)) (=> (rompous x) (small x))))

; 9) Rompuses are tumpuses
(assert (forall ((x Entity)) (=> (rompous x) (tumpus x))))

; 10) Tumpuses are transparent
(assert (forall ((x Entity)) (=> (tumpus x) (transparent x))))

; 11) Tumpuses are vumpuses
(assert (forall ((x Entity)) (=> (tumpus x) (vumpus x))))

; Test: Rex is not transparent
(assert (not (transparent Rex)))

(check-sat)
(get-model)