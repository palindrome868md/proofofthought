; Sorts
(declare-sort Entity 0)

; Constants
(declare-const fae Entity)

; Predicates (uninterpreted)
(declare-fun wumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun aggressive (Entity) Bool)

; Knowledge base (facts and rules)

; 1) Wumpuses are not sour
(assert (forall ((x Entity)) (=> (wumpus x) (not (sour x)))))

; 2) Wumpuses -> Rompus
(assert (forall ((x Entity)) (=> (wumpus x) (rompus x))))

; 3) Rompuses -> Dumpus
(assert (forall ((x Entity)) (=> (rompus x) (dumpus x))))

; 4) Dumpus -> Feisty
(assert (forall ((x Entity)) (=> (dumpus x) (feisty x))))

; 5) Dumpus -> Tumpus
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))

; 6) Tumpus -> Opaque
(assert (forall ((x Entity)) (=> (tumpus x) (opaque x))))

; 7) Tumpus -> Numpus
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

; 8) Numpus -> Hot
(assert (forall ((x Entity)) (=> (numpus x) (hot x))))

; 9) Numpus -> Zumpus
(assert (forall ((x Entity)) (=> (numpus x) (zumpus x))))

; 10) Zumpus -> Large
(assert (forall ((x Entity)) (=> (zumpus x) (large x))))

; 11) Zumpus -> Vumpus
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))

; 12) Vumpus -> Blue
(assert (forall ((x Entity)) (=> (vumpus x) (blue x))))

; 13) Vumpus -> Impus
(assert (forall ((x Entity)) (=> (vumpus x) (impus x))))

; 14) Impus -> Not Aggressive
(assert (forall ((x Entity)) (=> (impus x) (not (aggressive x)))))

; 15) Impus -> Yumpus
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))

; 16) Fae is a Tumpus
(assert (tumpus fae))

; Query: Is "Fae is not aggressive" true? (test scenario)
(assert (not (aggressive fae)))

; Verification check
(check-sat)