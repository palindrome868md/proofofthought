; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const Stella Entity)

; Declare predicates (unary relations)
(declare-fun impus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun bitter (Entity) Bool)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (impus x) (large x))))
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (dull x))))
(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (bitter x))))
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (kind x))))
(assert (forall ((x Entity)) (=> (dumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (metallic x))))
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (blue x))))
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (floral x))))
(assert (forall ((x Entity)) (=> (yumpus x) (tumpus x))))

; Additional rules about feisty
(assert (forall ((x Entity)) (=> (numpus x) (feisty x))))
(assert (forall ((x Entity)) (=> (zumpus x) (not (feisty x)))))

; Facts
(assert (vumpus Stella))
; Note: The question asks if Stella is feisty. We test this by asserting it.

; Query: Is Stella feisty?
(assert (feisty Stella))

; Check satisfiability
(check-sat)