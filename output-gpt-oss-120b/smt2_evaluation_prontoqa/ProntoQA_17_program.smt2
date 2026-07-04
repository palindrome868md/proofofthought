;--- Sort declaration ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (function) declarations ---------------------------------------
(declare-fun is_numpus (Entity) Bool)
(declare-fun is_wumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun is_jompus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun is_zumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun is_yumpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun is_vumpus (Entity) Bool)
(declare-fun is_impus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun is_rompuse (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun is_tumpuse (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun is_dumpuse (Entity) Bool)

;--- Constant representing the individual Fae ---------------------------------
(declare-const fae Entity)

;--- Knowledge base -----------------------------------------------------------
; Each numpus is not nervous (ignored – not needed for the query)
; Every numpus is a wumpus
(assert (forall ((x Entity)) (=> (is_numpus x) (is_wumpus x))))

; Wumpuses are liquid
(assert (forall ((x Entity)) (=> (is_wumpus x) (liquid x))))

; Each wumpus is a jompus
(assert (forall ((x Entity)) (=> (is_wumpus x) (is_jompus x))))

; Jompuses are fruity
(assert (forall ((x Entity)) (=> (is_jompus x) (fruity x))))

; Zumpuses are not opaque (irrelevant for Fae)
(assert (forall ((x Entity)) (=> (is_zumpus x) (not (opaque x)))))

; Each jompus is a yumpus
(assert (forall ((x Entity)) (=> (is_jompus x) (is_yumpus x))))

; Every yumpus is kind
(assert (forall ((x Entity)) (=> (is_yumpus x) (kind x))))

; Yumpuses are vumpuses
(assert (forall ((x Entity)) (=> (is_yumpus x) (is_vumpus x))))

; Vumpuses are opaque
(assert (forall ((x Entity)) (=> (is_vumpus x) (opaque x))))

; Every vumpus is an impus
(assert (forall ((x Entity)) (=> (is_vumpus x) (is_impus x))))

; Impuses are not small
(assert (forall ((x Entity)) (=> (is_impus x) (not (small x)))))

; Impuses are rompuses
(assert (forall ((x Entity)) (=> (is_impus x) (is_rompuse x))))

; Rompuses are dull
(assert (forall ((x Entity)) (=> (is_rompuse x) (dull x))))

; Rompuses are tumpuses
(assert (forall ((x Entity)) (=> (is_rompuse x) (is_tumpuse x))))

; Every tumpus is temperate
(assert (forall ((x Entity)) (=> (is_tumpuse x) (temperate x))))

; Every tumpus is a dumpus
(assert (forall ((x Entity)) (=> (is_tumpuse x) (is_dumpuse x))))

; Fact: Fae is a numpus
(assert (is_numpus fae))

;--- Test the statement: "Fae is not opaque" ---------------------------------
(assert (not (opaque fae)))   ; this is the claim we are checking

;--- Query --------------------------------------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)  ; will be empty because the problem is unsatisfiable