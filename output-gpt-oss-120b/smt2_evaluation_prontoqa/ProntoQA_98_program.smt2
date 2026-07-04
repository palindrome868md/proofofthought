;--- Sorts --------------------------------------------------------------
(declare-sort Entity 0)

;--- Predicates (unary Boolean functions) -------------------------------
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Fruity   (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Bright   (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Happy    (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Large    (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Cold     (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Angry    (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Orange   (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)

;--- Constant -----------------------------------------------------------
(declare-const rex Entity)

;--- Knowledge base -----------------------------------------------------

; Vumpuses are rompuses (unused later, kept for completeness)
(assert (forall ((x Entity))
  (=> (Vumpus x) (Rompus x))))

; Every rompus is fruity
(assert (forall ((x Entity))
  (=> (Rompus x) (Fruity x))))

; Each rompus is a zumpus
(assert (forall ((x Entity))
  (=> (Rompus x) (Zumpus x))))

; Every zumpus is bright
(assert (forall ((x Entity))
  (=> (Zumpus x) (Bright x))))

; Zumpuses are tumpuses
(assert (forall ((x Entity))
  (=> (Zumpus x) (Tumpus x))))

; Each tumpus is happy
(assert (forall ((x Entity))
  (=> (Tumpus x) (Happy x))))

; Each tumpus is a jompus
(assert (forall ((x Entity))
  (=> (Tumpus x) (Jompus x))))

; Jompuses are large
(assert (forall ((x Entity))
  (=> (Jompus x) (Large x))))

; Every jompus is an impus
(assert (forall ((x Entity))
  (=> (Jompus x) (Impus x))))

; Impuses are cold
(assert (forall ((x Entity))
  (=> (Impus x) (Cold x))))

; Impuses are dumpuses
(assert (forall ((x Entity))
  (=> (Impus x) (Dumpus x))))

; Dumpuses are angry
(assert (forall ((x Entity))
  (=> (Dumpus x) (Angry x))))

; Each dumpus is a yumpus
(assert (forall ((x Entity))
  (=> (Dumpus x) (Yumpus x))))

; Each yumpus is not orange
(assert (forall ((x Entity))
  (=> (Yumpus x) (not (Orange x)))))

; Every wumpus is not angry
(assert (forall ((x Entity))
  (=> (Wumpus x) (not (Angry x)))))

; Yumpuses are numpuses
(assert (forall ((x Entity))
  (=> (Yumpus x) (Numpus x))))

; Fact: Rex is a zumpus
(assert (Zumpus rex))

;--- Test the statement: "Rex is not angry" ----------------------------
; We assert the negation of what the KB entails.
(assert (not (Angry rex)))

;--- Check satisfiability ------------------------------------------------
(check-sat)   ; expected result: unsat (the statement is false)
(get-model)   ; optional: shows the contradictory assignment