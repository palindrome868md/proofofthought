; Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

; Predicates for categories
(declare-fun Numpus (Entity) Bool)
(declare-fun Impus  (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)

; Predicates for properties
(declare-fun Mean        (Entity) Bool)
(declare-fun Fruity      (Entity) Bool)
(declare-fun Small       (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Bright      (Entity) Bool)
(declare-fun Orange      (Entity) Bool)
(declare-fun Sweet       (Entity) Bool)
(declare-fun Wooden      (Entity) Bool)

; Constant representing Sam
(declare-const Sam Entity)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (Numpus x) (not (Mean x)))))
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (not (Fruity x)))))
(assert (forall ((x Entity)) (=> (Impus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Small x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Transparent x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (not (Bright x)))))
(assert (forall ((x Entity)) (=> (Jompus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Orange x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Sweet x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Wooden x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Orange x)))))

; Fact: Sam is an impus
(assert (Impus Sam))

; Test the statement: "Sam is orange"
(assert (Orange Sam))

(check-sat)
(get-model)