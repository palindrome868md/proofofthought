; -------------------------------------------------
;  Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
;  Predicate (unary function) declarations
; -------------------------------------------------
(declare-fun Jompus   (Entity) Bool)
(declare-fun Blue     (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Happy    (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Cold     (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Liquid   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Kind     (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Bright   (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Sour     (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Small    (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)

; -------------------------------------------------
;  Constant
; -------------------------------------------------
(declare-const Fae Entity)

; -------------------------------------------------
;  Knowledge base (axioms)
; -------------------------------------------------

; Jompuses are not blue
(assert (forall ((x Entity))
  (=> (Jompus x) (not (Blue x)))))

; Each rompus is happy
(assert (forall ((x Entity))
  (=> (Rompus x) (Happy x))))

; Rompuses are dumpuses
(assert (forall ((x Entity))
  (=> (Rompus x) (Dumpus x))))

; Dumpuses are not cold
(assert (forall ((x Entity))
  (=> (Dumpus x) (not (Cold x)))))

; Each dumpus is a wumpus
(assert (forall ((x Entity))
  (=> (Dumpus x) (Wumpus x))))

; Each wumpus is liquid
(assert (forall ((x Entity))
  (=> (Wumpus x) (Liquid x))))

; Each wumpus is an impus
(assert (forall ((x Entity))
  (=> (Wumpus x) (Impus x))))

; Each impus is kind
(assert (forall ((x Entity))
  (=> (Impus x) (Kind x))))

; Every impus is a yumpus
(assert (forall ((x Entity))
  (=> (Impus x) (Yumpus x))))

; Each yumpus is bright
(assert (forall ((x Entity))
  (=> (Yumpus x) (Bright x))))

; Yumpuses are zumpuses
(assert (forall ((x Entity))
  (=> (Yumpus x) (Zumpus x))))

; Each zumpus is sour
(assert (forall ((x Entity))
  (=> (Zumpus x) (Sour x))))

; Each zumpus is a vumpus
(assert (forall ((x Entity))
  (=> (Zumpus x) (Vumpus x))))

; Every vumpus is small
(assert (forall ((x Entity))
  (=> (Vumpus x) (Small x))))

; Vumpuses are tumpuses
(assert (forall ((x Entity))
  (=> (Vumpus x) (Tumpus x))))

; Every tumpus is blue
(assert (forall ((x Entity))
  (=> (Tumpus x) (Blue x))))

; Every tumpus is a numpus
(assert (forall ((x Entity))
  (=> (Tumpus x) (Numpus x))))

; -------------------------------------------------
;  Fact about Fae
; -------------------------------------------------
(assert (Impus Fae))

; -------------------------------------------------
;  Question to verify: "Fae is not blue"
; -------------------------------------------------
(assert (not (Blue Fae)))   ; the statement we are testing

; -------------------------------------------------
;  Check satisfiability
; -------------------------------------------------
(check-sat)   ; expected result: unsat (the statement is false)
(get-model)