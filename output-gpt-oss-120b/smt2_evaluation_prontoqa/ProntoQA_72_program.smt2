; -------------------------------------------------
; 1. Declare the (uninterpreted) sort for individuals
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare all predicates that appear in the story
;    (each takes an Entity and returns Bool)
; -------------------------------------------------
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Small    (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Aggressive (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Bright   (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Liquid   (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Orange   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Fruity   (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Sour     (Entity) Bool)
(declare-fun Rompuss  (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)

; -------------------------------------------------
; 3. Declare the constant representing Sam
; -------------------------------------------------
(declare-const Sam Entity)

; -------------------------------------------------
; 4. Knowledge‑base: universal rules and facts
; -------------------------------------------------

; Tumpuses are not small
(assert (forall ((x Entity))
  (=> (Tumpus x) (not (Small x)))))

; Tumpuses are yumpuses
(assert (forall ((x Entity))
  (=> (Tumpus x) (Yumpus x))))

; Every yumpus is aggressive
(assert (forall ((x Entity))
  (=> (Yumpus x) (Aggressive x))))

; Each yumpus is a wumpus
(assert (forall ((x Entity))
  (=> (Yumpus x) (Wumpus x))))

; Every wumpus is bright
(assert (forall ((x Entity))
  (=> (Wumpus x) (Bright x))))

; Each wumpus is a jompus
(assert (forall ((x Entity))
  (=> (Wumpus x) (Jompus x))))

; Jompuses are not liquid
(assert (forall ((x Entity))
  (=> (Jompus x) (not (Liquid x)))))

; Every jompus is a vumpus
(assert (forall ((x Entity))
  (=> (Jompus x) (Vumpus x))))

; Each vumpus is orange
(assert (forall ((x Entity))
  (=> (Vumpus x) (Orange x))))

; Every vumpus is an impus
(assert (forall ((x Entity))
  (=> (Vumpus x) (Impus x))))

; Every impus is not transparent
(assert (forall ((x Entity))
  (=> (Impus x) (not (Transparent x)))))

; Each impus is a zumpus
(assert (forall ((x Entity))
  (=> (Impus x) (Zumpus x))))

; Every zumpus is fruity
(assert (forall ((x Entity))
  (=> (Zumpus x) (Fruity x))))

; Every zumpus is a numpus
(assert (forall ((x Entity))
  (=> (Zumpus x) (Numpus x))))

; Every numpus is sour
(assert (forall ((x Entity))
  (=> (Numpus x) (Sour x))))

; Rompuses are not fruity
(assert (forall ((x Entity))
  (=> (Rompuss x) (not (Fruity x)))))

; Numpuses are dumpuses
(assert (forall ((x Entity))
  (=> (Numpus x) (Dumpus x))))

; Fact: Sam is a wumpus
(assert (Wumpus Sam))

; -------------------------------------------------
; 5. Query: is Sam fruity?
; -------------------------------------------------
(assert (Fruity Sam))

; -------------------------------------------------
; 6. Ask the solver
; -------------------------------------------------
(check-sat)
(get-model)