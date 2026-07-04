; ------------------------------------------------------------
; Sort declaration
; ------------------------------------------------------------
(declare-sort Entity 0)

; ------------------------------------------------------------
; Predicate (unary function) declarations
; ------------------------------------------------------------
(declare-fun Numpus   (Entity) Bool)
(declare-fun Fruity   (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Orange   (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Nervous  (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Sour     (Entity) Bool)
(declare-fun Hot      (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Small    (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Mean     (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)

; ------------------------------------------------------------
; Constant declaration
; ------------------------------------------------------------
(declare-const Alex Entity)

; ------------------------------------------------------------
; Knowledge base (axioms)
; ------------------------------------------------------------
; Numpuses are not fruity.
(assert (forall ((x Entity))
  (=> (Numpus x) (not (Fruity x)))))

; Numpuses are dumpuses.
(assert (forall ((x Entity))
  (=> (Numpus x) (Dumpus x))))

; Each dumpus is not orange.
(assert (forall ((x Entity))
  (=> (Dumpus x) (not (Orange x)))))

; Dumpuses are yumpuses.
(assert (forall ((x Entity))
  (=> (Dumpus x) (Yumpus x))))

; Yumpuses are nervous.
(assert (forall ((x Entity))
  (=> (Yumpus x) (Nervous x))))

; Yumpuses are vumpuses.
(assert (forall ((x Entity))
  (=> (Yumpus x) (Vumpus x))))

; Every impus is sour.
(assert (forall ((x Entity))
  (=> (Impus x) (Sour x))))

; Every vumpus is hot.
(assert (forall ((x Entity))
  (=> (Vumpus x) (Hot x))))

; Vumpuses are tumpuses.
(assert (forall ((x Entity))
  (=> (Vumpus x) (Tumpus x))))

; Each tumpus is small.
(assert (forall ((x Entity))
  (=> (Tumpus x) (Small x))))

; Tumpuses are rompuses.
(assert (forall ((x Entity))
  (=> (Tumpus x) (Rompus x))))

; Every rompus is mean.
(assert (forall ((x Entity))
  (=> (Rompus x) (Mean x))))

; Rompuses are zumpuses.
(assert (forall ((x Entity))
  (=> (Rompus x) (Zumpus x))))

; Each zumpus is not sour.
(assert (forall ((x Entity))
  (=> (Zumpus x) (not (Sour x)))))

; Zumpuses are jompuses.
(assert (forall ((x Entity))
  (=> (Zumpus x) (Jompus x))))

; ------------------------------------------------------------
; Fact about Alex
; ------------------------------------------------------------
(assert (Yumpus Alex))

; ------------------------------------------------------------
; Query: is Alex not sour?
; ------------------------------------------------------------
(assert (not (Sour Alex)))

; ------------------------------------------------------------
; Solve
; ------------------------------------------------------------
(check-sat)
(get-model)