; -------------------------------------------------
; Sort for all individuals
(declare-sort Entity 0)

; -------------------------------------------------
; Unary predicates (classes / properties)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Fruity   (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Opaque   (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Nervous  (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Sour     (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Large    (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Cold     (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)

; -------------------------------------------------
; Constant representing Max
(declare-const Max Entity)

; -------------------------------------------------
; Knowledge base (universal rules)

; Vumpuses are fruity and jompuses
(assert (forall ((x Entity))
          (=> (Vumpus x) (Fruity x))))
(assert (forall ((x Entity))
          (=> (Vumpus x) (Jompus x))))

; Jompuses are opaque and are wumpuses
(assert (forall ((x Entity))
          (=> (Jompus x) (Opaque x))))
(assert (forall ((x Entity))
          (=> (Jompus x) (Wumpus x))))

; Every wumpus is nervous and an impus
(assert (forall ((x Entity))
          (=> (Wumpus x) (Nervous x))))
(assert (forall ((x Entity))
          (=> (Wumpus x) (Impus x))))

; Every impus is sour and a tumpus
(assert (forall ((x Entity))
          (=> (Impus x) (Sour x))))
(assert (forall ((x Entity))
          (=> (Impus x) (Tumpus x))))

; Every tumpus is not amenable and a yumpus
(assert (forall ((x Entity))
          (=> (Tumpus x) (not (Amenable x)))))
(assert (forall ((x Entity))
          (=> (Tumpus x) (Yumpus x))))

; Yumpuses are not metallic and are numpuses
(assert (forall ((x Entity))
          (=> (Yumpus x) (not (Metallic x)))))
(assert (forall ((x Entity))
          (=> (Yumpus x) (Numpus x))))

; Numpuses are large and are rompus
(assert (forall ((x Entity))
          (=> (Numpus x) (Large x))))
(assert (forall ((x Entity))
          (=> (Numpus x) (Rompus x))))

; Dumpuses are not cold
(assert (forall ((x Entity))
          (=> (Dumpus x) (not (Cold x)))))

; Every rompus is cold and a zumpus
(assert (forall ((x Entity))
          (=> (Rompus x) (Cold x))))
(assert (forall ((x Entity))
          (=> (Rompus x) (Zumpus x))))

; -------------------------------------------------
; Fact: Max is an impus
(assert (Impus Max))

; -------------------------------------------------
; Question to verify: "Max is not cold."
(assert (not (Cold Max)))

; -------------------------------------------------
; Check the consistency of the whole set
(check-sat)
; Expected result: unsat (the statement is false)