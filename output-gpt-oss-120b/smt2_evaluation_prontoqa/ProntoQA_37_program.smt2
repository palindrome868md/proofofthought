;--- Sorts -------------------------------------------------
(declare-sort Creature 0)

;--- Predicates (unary) ------------------------------------
(declare-fun is-impuse   (Creature) Bool)
(declare-fun is-wumpus  (Creature) Bool)
(declare-fun is-dumpus  (Creature) Bool)
(declare-fun is-zumpus  (Creature) Bool)
(declare-fun is-vumpus  (Creature) Bool)
(declare-fun is-yumpus  (Creature) Bool)
(declare-fun is-numpus  (Creature) Bool)
(declare-fun is-tumpus  (Creature) Bool)

(declare-fun is-fruity   (Creature) Bool)
(declare-fun is-temperate(Creature) Bool)
(declare-fun is-kind    (Creature) Bool)
(declare-fun is-wooden  (Creature) Bool)
(declare-fun is-large    (Creature) Bool)
(declare-fun is-transparent (Creature) Bool)
(declare-fun is-brown    (Creature) Bool)
(declare-fun is-sweet    (Creature) Bool)
(declare-fun is-rompuse  (Creature) Bool)
(declare-fun is-jompus   (Creature) Bool)

;--- Constants --------------------------------------------
(declare-const wren Creature)

;--- Knowledge base ----------------------------------------
; Impuses are not fruity.
(assert (forall ((x Creature))
  (=> (is-impuse x) (not (is-fruity x)))))

; Impuses are wumpuses.
(assert (forall ((x Creature))
  (=> (is-impuse x) (is-wumpus x))))

; Each wumpus is not temperate.
(assert (forall ((x Creature))
  (=> (is-wumpus x) (not (is-temperate x)))))

; Wumpuses are dumpuses.
(assert (forall ((x Creature))
  (=> (is-wumpus x) (is-dumpus x))))

; Rompuses are not sweet.
(assert (forall ((x Creature))
  (=> (is-rompuse x) (not (is-sweet x)))))

; Dumpuses are kind.
(assert (forall ((x Creature))
  (=> (is-dumpus x) (is-kind x))))

; Dumpuses are zumpuses.
(assert (forall ((x Creature))
  (=> (is-dumpus x) (is-zumpus x))))

; Zumpuses are wooden.
(assert (forall ((x Creature))
  (=> (is-zumpus x) (is-wooden x))))

; Zumpuses are vumpuses.
(assert (forall ((x Creature))
  (=> (is-zumpus x) (is-vumpus x))))

; Every vumpus is large.
(assert (forall ((x Creature))
  (=> (is-vumpus x) (is-large x))))

; Vumpuses are yumpuses.
(assert (forall ((x Creature))
  (=> (is-vumpus x) (is-yumpus x))))

; Yumpuses are transparent.
(assert (forall ((x Creature))
  (=> (is-yumpus x) (is-transparent x))))

; Yumpuses are numpuses.
(assert (forall ((x Creature))
  (=> (is-yumpus x) (is-numpus x))))

; Numpuses are brown.
(assert (forall ((x Creature))
  (=> (is-numpus x) (is-brown x))))

; Numpuses are tumpuses.
(assert (forall ((x Creature))
  (=> (is-numpus x) (is-tumpus x))))

; Tumpuses are sweet.
(assert (forall ((x Creature))
  (=> (is-tumpus x) (is-sweet x))))

; Tumpuses are jompuses.
(assert (forall ((x Creature))
  (=> (is-tumpus x) (is-jompus x))))

; Wren is a zumpus.
(assert (is-zumpus wren))

;--- Test the statement ------------------------------------
; Is Wren sweet?
(assert (is-sweet wren))

;--- Solve -------------------------------------------------
(check-sat)   ; expected: sat (the statement is true)
(get-model)