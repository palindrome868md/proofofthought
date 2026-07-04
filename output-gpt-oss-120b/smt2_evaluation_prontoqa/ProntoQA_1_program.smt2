; -------------------------------------------------
;  Sort declaration
; -------------------------------------------------
(declare-sort Creature 0)

; -------------------------------------------------
;  Predicate declarations (unary properties)
; -------------------------------------------------
(declare-fun Jompus (Creature) Bool)
(declare-fun Shy (Creature) Bool)
(declare-fun Yumpus (Creature) Bool)
(declare-fun Aggressive (Creature) Bool)
(declare-fun Dumpus (Creature) Bool)
(declare-fun Wooden (Creature) Bool)
(declare-fun Wumpus (Creature) Bool)
(declare-fun Red (Creature) Bool)
(declare-fun Impus (Creature) Bool)
(declare-fun Opaque (Creature) Bool)
(declare-fun Tumpus (Creature) Bool)
(declare-fun Numpus (Creature) Bool)
(declare-fun Sour (Creature) Bool)
(declare-fun Vumpus (Creature) Bool)
(declare-fun Earthy (Creature) Bool)
(declare-fun Zumpus (Creature) Bool)
(declare-fun Small (Creature) Bool)
(declare-fun Rompuse (Creature) Bool)

; -------------------------------------------------
;  Constant declaration
; -------------------------------------------------
(declare-const Max Creature)

; -------------------------------------------------
;  Knowledge base (universal rules)
; -------------------------------------------------
; Jompuses are not shy.
(assert (forall ((x Creature))
  (=> (Jompus x) (not (Shy x)))))

; Jompuses are yumpuses.
(assert (forall ((x Creature))
  (=> (Jompus x) (Yumpus x))))

; Each yumpus is aggressive.
(assert (forall ((x Creature))
  (=> (Yumpus x) (Aggressive x))))

; Each yumpus is a dumpus.
(assert (forall ((x Creature))
  (=> (Yumpus x) (Dumpus x))))

; Dumpuses are not wooden.
(assert (forall ((x Creature))
  (=> (Dumpus x) (not (Wooden x)))))

; Dumpuses are wumpuses.
(assert (forall ((x Creature))
  (=> (Dumpus x) (Wumpus x))))

; Wumpuses are red.
(assert (forall ((x Creature))
  (=> (Wumpus x) (Red x))))

; Every wumpus is an impus.
(assert (forall ((x Creature))
  (=> (Wumpus x) (Impus x))))

; Each impus is opaque.
(assert (forall ((x Creature))
  (=> (Impus x) (Opaque x))))

; Impuses are tumpuses.
(assert (forall ((x Creature))
  (=> (Impus x) (Tumpus x))))

; Numpuses are sour.
(assert (forall ((x Creature))
  (=> (Numpus x) (Sour x))))

; Tumpuses are not sour.
(assert (forall ((x Creature))
  (=> (Tumpus x) (not (Sour x)))))

; Tumpuses are vumpuses.
(assert (forall ((x Creature))
  (=> (Tumpus x) (Vumpus x))))

; Vumpuses are earthy.
(assert (forall ((x Creature))
  (=> (Vumpus x) (Earthy x))))

; Every vumpus is a zumpus.
(assert (forall ((x Creature))
  (=> (Vumpus x) (Zumpus x))))

; Zumpuses are small.
(assert (forall ((x Creature))
  (=> (Zumpus x) (Small x))))

; Zumpuses are rompuses.
(assert (forall ((x Creature))
  (=> (Zumpus x) (Rompuse x))))

; -------------------------------------------------
;  Specific facts
; -------------------------------------------------
; Max is a yumpus.
(assert (Yumpus Max))

; -------------------------------------------------
;  Test the statement: "Max is sour."
; -------------------------------------------------
(assert (Sour Max))

; -------------------------------------------------
;  Check the query
; -------------------------------------------------
(check-sat)
(get-model)