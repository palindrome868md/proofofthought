; Sort
(declare-sort Entity 0)

; Constant
(declare-const wren Entity)

; Predicates
(declare-fun Romp (Entity) Bool)
(declare-fun Yump (Entity) Bool)
(declare-fun Jomp (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Nump (Entity) Bool)
(declare-fun Vump (Entity) Bool)
(declare-fun Dump (Entity) Bool)
(declare-fun Earth (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Bright (Entity) Bool)

; Facts
(assert (Romp wren))

; Rules (from the problem)
(assert (forall ((x Entity)) (=> (Romp x) (Yump x))))
(assert (forall ((x Entity)) (=> (Yump x) (Jomp x))))
(assert (forall ((x Entity)) (=> (Jomp x) (not (Blue x)))))
(assert (forall ((x Entity)) (=> (Dump x) (not (Earth x)))))
(assert (forall ((x Entity)) (=> (Jomp x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Bright x))))
(assert (forall ((x Entity)) (=> (Impus x) (Nump x))))
(assert (forall ((x Entity)) (=> (Nump x) (Earth x))))
(assert (forall ((x Entity)) (=> (Nump x) (Vump x))))

; Test: Is "Wren is not earthy" true?
(assert (not (Earth wren)))

; Check satisfiability
(check-sat)