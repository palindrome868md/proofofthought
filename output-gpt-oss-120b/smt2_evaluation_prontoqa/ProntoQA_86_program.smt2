;----------------------------------------------------
;  Sort declaration
;----------------------------------------------------
(declare-sort Entity 0)

;----------------------------------------------------
;  Predicate (uninterpreted function) declarations
;----------------------------------------------------
(declare-fun Zumpus    (Entity) Bool)
(declare-fun Luminous  (Entity) Bool)

(declare-fun Tumpus    (Entity) Bool)
(declare-fun Spicy     (Entity) Bool)

(declare-fun Vumpus    (Entity) Bool)
(declare-fun Fruity    (Entity) Bool)

(declare-fun Impus     (Entity) Bool)
(declare-fun Small     (Entity) Bool)

(declare-fun Rompuse   (Entity) Bool)

(declare-fun Yumpus    (Entity) Bool)
(declare-fun Temperate (Entity) Bool)

(declare-fun Jompus    (Entity) Bool)
(declare-fun Bright    (Entity) Bool)

(declare-fun Wumpus    (Entity) Bool)
(declare-fun Amenable  (Entity) Bool)

(declare-fun Dumpus    (Entity) Bool)
(declare-fun Shy       (Entity) Bool)
(declare-fun Numpus    (Entity) Bool)

;----------------------------------------------------
;  Universal rules (the ontology)
;----------------------------------------------------
; Zumpuses are luminous.
(assert (forall ((x Entity))
  (=> (Zumpus x) (Luminous x))))

; Each zumpus is a tumpus.
(assert (forall ((x Entity))
  (=> (Zumpus x) (Tumpus x))))

; Each tumpus is not spicy.
(assert (forall ((x Entity))
  (=> (Tumpus x) (not (Spicy x)))))

; Tumpuses are vumpuses.
(assert (forall ((x Entity))
  (=> (Tumpus x) (Vumpus x))))

; Vumpuses are not fruity.
(assert (forall ((x Entity))
  (=> (Vumpus x) (not (Fruity x)))))

; Every vumpus is an impus.
(assert (forall ((x Entity))
  (=> (Vumpus x) (Impus x))))

; Each impus is small.
(assert (forall ((x Entity))
  (=> (Impus x) (Small x))))

; Rompuses are not shy.
(assert (forall ((x Entity))
  (=> (Rompuse x) (not (Shy x)))))

; Impuses are yumpuses.
(assert (forall ((x Entity))
  (=> (Impus x) (Yumpus x))))

; Each yumpus is temperate.
(assert (forall ((x Entity))
  (=> (Yumpus x) (Temperate x))))

; Every yumpus is a jompus.
(assert (forall ((x Entity))
  (=> (Yumpus x) (Jompus x))))

; Each jompus is bright.
(assert (forall ((x Entity))
  (=> (Jompus x) (Bright x))))

; Each jompus is a wumpus.
(assert (forall ((x Entity))
  (=> (Jompus x) (Wumpus x))))

; Wumpuses are amenable.
(assert (forall ((x Entity))
  (=> (Wumpus x) (Amenable x))))

; Each wumpus is a dumpus.
(assert (forall ((x Entity))
  (=> (Wumpus x) (Dumpus x))))

; Dumpuses are shy.
(assert (forall ((x Entity))
  (=> (Dumpus x) (Shy x))))

; Dumpuses are numpuses.
(assert (forall ((x Entity))
  (=> (Dumpus x) (Numpus x))))

;----------------------------------------------------
;  Specific facts
;----------------------------------------------------
(declare-const Stella Entity)
(assert (Impus Stella))   ; Stella is an impus

;----------------------------------------------------
;  Question to verify: "Stella is not shy"
;----------------------------------------------------
(assert (not (Shy Stella)))   ; the statement we are testing

;----------------------------------------------------
;  Solve
;----------------------------------------------------
(check-sat)   ; expected: unsat (the statement is false)
(get-model)   ; optional, shows a model if it were sat