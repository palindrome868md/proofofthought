;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicates (unary) --------------------------------------------
(declare-fun Rompus (Entity) Bool)
(declare-fun Luminous (Entity) Bool)
(declare-fun Yumpuses (Entity) Bool)
(declare-fun Feisty (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Wumpuses (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Numpuses (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Dumpuses (Entity) Bool)
(declare-fun Tumpuses (Entity) Bool)
(declare-fun Kind (Entity) Bool)
(declare-fun Vumpuses (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Zumpuses (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Jompuses (Entity) Bool)

;--- Constant ------------------------------------------------------
(declare-const Alex Entity)

;--- Knowledge base ------------------------------------------------
; Rompuses are luminous.
(assert (forall ((x Entity)) (=> (Rompus x) (Luminous x))))

; Yumpuses are feisty.
(assert (forall ((x Entity)) (=> (Yumpuses x) (Feisty x))))

; Rompuses are impuses.
(assert (forall ((x Entity)) (=> (Rompus x) (Impus x))))

; Each impus is not sour.
(assert (forall ((x Entity)) (=> (Impus x) (not (Sour x)))))

; Impuses are wumpuses.
(assert (forall ((x Entity)) (=> (Impus x) (Wumpuses x))))

; Wumpuses are not fruity.
(assert (forall ((x Entity)) (=> (Wumpuses x) (not (Fruity x)))))

; Wumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Wumpuses x) (Numpuses x))))

; Every numpus is blue.
(assert (forall ((x Entity)) (=> (Numpuses x) (Blue x))))

; Every numpus is a dumpus.
(assert (forall ((x Entity)) (=> (Numpuses x) (Dumpuses x))))

; Every dumpus is not feisty.
(assert (forall ((x Entity)) (=> (Dumpuses x) (not (Feisty x)))))

; Each dumpus is a tumpus.
(assert (forall ((x Entity)) (=> (Dumpuses x) (Tumpuses x))))

; Tumpuses are kind.
(assert (forall ((x Entity)) (=> (Tumpuses x) (Kind x))))

; Every tumpus is a vumpus.
(assert (forall ((x Entity)) (=> (Tumpuses x) (Vumpuses x))))

; Each vumpus is opaque.
(assert (forall ((x Entity)) (=> (Vumpuses x) (Opaque x))))

; Vumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (Vumpuses x) (Zumpuses x))))

; Each zumpus is not large.
(assert (forall ((x Entity)) (=> (Zumpuses x) (not (Large x)))))

; Zumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Zumpuses x) (Jompuses x))))

; Alex is a rompus.
(assert (Rompus Alex))

;--- Query ---------------------------------------------------------
; Is Alex not feisty?
(assert (not (Feisty Alex)))

(check-sat)
(get-model)