; Domain
(declare-sort Entity 0)

; Predicates (unary)
(declare-fun yumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun luminous (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun spicy (Entity) Bool)
(declare-fun dull (Entity) Bool)

; Constants
(declare-const Polly Entity)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (numpus x) (feisty x))))
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (not (kind x)))))
(assert (forall ((x Entity)) (=> (impus x) (not (red x)))))
(assert (forall ((x Entity)) (=> (impus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (fruity x))))
(assert (forall ((x Entity)) (=> (wumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (spicy x))))
(assert (forall ((x Entity)) (=> (rompus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (luminous x))))
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (dull x)))))
(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))

; Fact: Polly is a numpus
(assert (numpus Polly))

; Query: Is Polly not luminous?
(assert (not (luminous Polly)))

; Check entailment via satisfiability
(check-sat)
(get-model)