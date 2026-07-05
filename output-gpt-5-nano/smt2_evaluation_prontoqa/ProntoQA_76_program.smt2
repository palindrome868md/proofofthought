; Declare sorts
(declare-sort Entity 0)

; Declare predicates
(declare-fun yumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun angry (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun luminous (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun spicy (Entity) Bool)

; Declare individuals
(declare-const Sally Entity)

; Knowledge base
(assert (yumpus Sally))  ; Sally is a yumpus

; Rules
(assert (forall ((x Entity)) (=> (zumpus x) (not (spicy x)))))
(assert (forall ((x Entity)) (=> (yumpus x) (cold x))))
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (red x))))
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (feisty x)))))
(assert (forall ((x Entity)) (=> (jompus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (angry x))))
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (spicy x))))
(assert (forall ((x Entity)) (=> (wumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (not (small x)))))
(assert (forall ((x Entity)) (=> (vumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (earthy x))))
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (luminous x))))
(assert (forall ((x Entity)) (=> (tumpus x) (dumpus x))))

; Test: Is Sally spicy?
(assert (spicy Sally))

; Check satisfiability and get a model
(check-sat)
(get-model)