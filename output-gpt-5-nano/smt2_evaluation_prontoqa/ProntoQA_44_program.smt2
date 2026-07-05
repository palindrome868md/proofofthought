(declare-sort Entity 0)

(declare-const rex Entity)

; Predicates
(declare-fun Yumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Red (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Shy (Entity) Bool)
(declare-fun Floral (Entity) Bool)
(declare-fun Amenable (Entity) Bool)

; Knowledge base
(assert (Jompus rex))
(assert (=> (Jompus rex) (Numpus rex)))
(assert (=> (Numpus rex) (not (Opaque rex))))
(assert (=> (Numpus rex) (Wumpus rex)))
(assert (=> (Wumpus rex) (Rompus rex)))
(assert (=> (Rompus rex) (not (Red rex))))
(assert (=> (Rompus rex) (Tumpus rex)))
(assert (=> (Tumpus rex) (Spicy rex)))
(assert (=> (Tumpus rex) (Dumpus rex)))
(assert (=> (Dumpus rex) (Zumpus rex)))
(assert (=> (Dumpus rex) (Shy rex)))

; Test: Rex is not spicy
(assert (not (Spicy rex)))

(check-sat)