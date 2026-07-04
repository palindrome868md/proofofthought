;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicates (unary properties) ---------------------------------
(declare-fun vumpus          (Entity) Bool)
(declare-fun floral          (Entity) Bool)
(declare-fun wumpus          (Entity) Bool)
(declare-fun spicy           (Entity) Bool)
(declare-fun zumpus          (Entity) Bool)
(declare-fun orange          (Entity) Bool)
(declare-fun tumpus          (Entity) Bool)
(declare-fun dull            (Entity) Bool)
(declare-fun dumpus          (Entity) Bool)
(declare-fun amenable        (Entity) Bool)
(declare-fun yumpus          (Entity) Bool)
(declare-fun opaque          (Entity) Bool)
(declare-fun impus           (Entity) Bool)
(declare-fun feisty          (Entity) Bool)
(declare-fun jompus          (Entity) Bool)
(declare-fun numpuss         (Entity) Bool)   ; “numpuses”

;--- Individual ----------------------------------------------------
(declare-const rex Entity)

;--- Knowledge base -----------------------------------------------
; Vumpuses are floral.
(assert (forall ((x Entity)) (=> (vumpus x) (floral x))))

; Vumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (wumpus x))))

; Each wumpus is not spicy.
(assert (forall ((x Entity)) (=> (wumpus x) (not (spicy x)))))

; Wumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))

; Zumpuses are orange.
(assert (forall ((x Entity)) (=> (zumpus x) (orange x))))

; Zumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))

; Every tumpus is dull.
(assert (forall ((x Entity)) (=> (tumpus x) (dull x))))

; Every tumpus is a dumpus.
(assert (forall ((x Entity)) (=> (tumpus x) (dumpus x))))

; Every dumpus is amenable.
(assert (forall ((x Entity)) (=> (dumpus x) (amenable x))))

; Every yumpus is not opaque.
(assert (forall ((x Entity)) (=> (yumpus x) (not (opaque x)))))

; Dumpuses are impuses.
(assert (forall ((x Entity)) (=> (dumpus x) (impus x))))

; Each impus is not feisty.
(assert (forall ((x Entity)) (=> (impus x) (not (feisty x)))))

; Every impus is a jompus.
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))

; Each jompus is opaque.
(assert (forall ((x Entity)) (=> (jompus x) (opaque x))))

; Jompuses are numpuses.
(assert (forall ((x Entity)) (=> (jompus x) (numpuss x))))

; Fact: Rex is a zumpus.
(assert (zumpus rex))

;--- Query: “Rex is not opaque.” -----------------------------------
(assert (not (opaque rex)))   ; the statement we are testing

;--- Solve ---------------------------------------------------------
(check-sat)   ; unsat → the statement is false
(get-model)