; Sorts
(declare-sort Entity 0)

; Constants
(declare-const alex Entity)

; Predicates
(declare-fun Rompuse (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Mean (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Dumpuse (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Sour (Entity) Bool)

; Knowledge base (rules)
(assert (forall ((x Entity))
  (=> (Rompuse x) (Mean x))))
(assert (forall ((x Entity))
  (=> (Rompuse x) (Zumpus x))))
(assert (forall ((x Entity))
  (=> (Zumpus x) (not (Happy x)))))

(assert (forall ((x Entity))
  (=> (Zumpus x) (Numpus x))))

(assert (forall ((x Entity))
  (=> (Numpus x) (not (Temperate x)))))

(assert (forall ((x Entity))
  (=> (Numpus x) (Tumpus x))))
(assert (forall ((x Entity))
  (=> (Tumpus x) (not (Large x)))))
(assert (forall ((x Entity))
  (=> (Tumpus x) (Yumpus x))))
(assert (forall ((x Entity))
  (=> (Yumpus x) (Earthy x))))
(assert (forall ((x Entity))
  (=> (Yumpus x) (Jompus x))))
(assert (forall ((x Entity))
  (=> (Jompus x) (Blue x))))
(assert (forall ((x Entity))
  (=> (Jompus x) (Wumpus x))))
(assert (forall ((x Entity))
  (=> (Wumpus x) (not (Dull x)))))
(assert (forall ((x Entity))
  (=> (Wumpus x) (Impuse x))))
(assert (forall ((x Entity))
  (=> (Impuse x) (Sour x))))
(assert (forall ((x Entity))
  (=> (Impuse x) (Dumpuse x))))
(assert (forall ((x Entity))
  (=> (Vumpus x) (Dull x))))

; Facts
(assert (Numpus alex))

; Query: Is "Alex is not dull" true?
(assert (not (Dull alex)))

; Verification
(check-sat)
(get-model)