(declare-sort Entity 0)

; Predicates representing categories and properties
(declare-fun numpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun aggressive (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun rompuses (Entity) Bool)

; Sally
(declare-const sally Entity)

; Facts
(numpus sally)

; Rules (universal implications)
(assert (forall ((x Entity)) (=> (numpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (earthy x))))
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (transparent x))))
(assert (forall ((x Entity)) (=> (tumpus x) (small x))))
(assert (forall ((x Entity)) (=> (tumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (aggressive x)))))
(assert (forall ((x Entity)) (=> (dumpus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (not (wooden x)))))
(assert (forall ((x Entity)) (=> (wumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (nervous x)))))
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (temperate x))))
(assert (forall ((x Entity)) (=> (zumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (blue x))))
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (rompuses x) (wooden x))))

; Test: Is "Sally is not wooden" true?
(assert (not (wooden sally)))

(check-sat)
(get-model)