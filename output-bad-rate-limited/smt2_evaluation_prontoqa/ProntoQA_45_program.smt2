; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun Dumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Rompuse (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Bitter (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Wooden (Entity) Bool)

; Constants
(declare-const fae Entity)

; Knowledge base
(assert (Dumpus fae))

; Rules
(assert (forall ((p Entity)) (=> (Dumpus p) (Numpus p))))
(assert (forall ((p Entity)) (=> (Numpus p) (not (Bitter p)))))
(assert (forall ((p Entity)) (=> (Numpus p) (Zumpus p))))
(assert (forall ((p Entity)) (=> (Zumpus p) (Fruity p))))
(assert (forall ((p Entity)) (=> (Zumpus p) (Wumpus p))))
(assert (forall ((p Entity)) (=> (Wumpus p) (Large p))))
(assert (forall ((p Entity)) (=> (Tumpus p) (not (Wooden p)))))
(assert (forall ((p Entity)) (=> (Wumpus p) (Impus p))))
(assert (forall ((p Entity)) (=> (Impus p) (Wooden p))))
(assert (forall ((p Entity)) (=> (Impus p) (Rompuse p))))

; Test scenario: Is Fae wooden?
(assert (Wooden fae))

; Check satisfiability
(check-sat)
(get-model)