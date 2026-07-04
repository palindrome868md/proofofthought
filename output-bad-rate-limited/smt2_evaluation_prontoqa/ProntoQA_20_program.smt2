; Declare sorts
(declare-sort Creature 0)

; Declare predicates
(declare-fun Yumpus (Creature) Bool)
(declare-fun Dumpus (Creature) Bool)
(declare-fun Opaque (Creature) Bool)
(declare-fun Jompus (Creature) Bool)
(declare-fun Shy (Creature) Bool)
(declare-fun Numpus (Creature) Bool)
(declare-fun Sour (Creature) Bool)
(declare-fun Tumpus (Creature) Bool)
(declare-fun Brown (Creature) Bool)
(declare-fun Vumpus (Creature) Bool)
(declare-fun Dull (Creature) Bool)
(declare-fun Wumpus (Creature) Bool)
(declare-fun Rompus (Creature) Bool)
(declare-fun Impuse (Creature) Bool)
(declare-fun Luminous (Creature) Bool)
(declare-fun Small (Creature) Bool)

; Declare constants
(declare-const Stella Creature)

; Knowledge base

; Stella is a dumpus
(assert (Dumpus Stella))

; Rules about yumpus
(assert (forall ((x Creature)) (=> (Yumpus x) (not (Small x)))))
(assert (forall ((x Creature)) (=> (Yumpus x) (Dumpus x))))

; Dumpus -> opaque
(assert (forall ((x Creature)) (=> (Dumpus x) (Opaque x))))

; Dumpus -> jompus
(assert (forall ((x Creature)) (=> (Dumpus x) (Jompus x))))

; Jompus -> shy
(assert (forall ((x Creature)) (=> (Jompus x) (Shy x))))

; Jompus -> tumpus
(assert (forall ((x Creature)) (=> (Jompus x) (Tumpus x))))

; Tumpus properties
(assert (forall ((x Creature)) (=> (Tumpus x) (Brown x))))
(assert (forall ((x Creature)) (=> (Tumpus x) (Vumpus x))))

; Vumpus properties
(assert (forall ((x Creature)) (=> (Vumpus x) (Dull x))))
(assert (forall ((x Creature)) (=> (Vumpus x) (Wumpus x))))

; Wumpus properties
(assert (forall ((x Creature)) (=> (Wumpus x) (not (Sour x)))))
(assert (forall ((x Creature)) (=> (Wumpus x) (Rompus x))))

; Rompus properties
(assert (forall ((x Creature)) (=> (Rompus x) (Impuse x))))
(assert (forall ((x Creature)) (=> (Rompus x) (not (Luminous x)))))

; Query: Is Stella sour?
(assert (Sour Stella))

; Check satisfiability
(check-sat)
(get-model)