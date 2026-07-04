; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories and properties)
(declare-fun is_dumpus (Entity) Bool)
(declare-fun is_rompus (Entity) Bool)
(declare-fun is_yumpus (Entity) Bool)
(declare-fun is_vumpus (Entity) Bool)
(declare-fun is_impus (Entity) Bool)
(declare-fun is_numpus (Entity) Bool)
(declare-fun is_zumpus (Entity) Bool)
(declare-fun is_jompus (Entity) Bool)
(declare-fun is_tumpus (Entity) Bool)
(declare-fun is_wumpus (Entity) Bool)

(declare-fun is_bright (Entity) Bool)
(declare-fun is_aggressive (Entity) Bool)
(declare-fun is_brown (Entity) Bool)
(declare-fun is_fruity (Entity) Bool)
(declare-fun is_sour (Entity) Bool)
(declare-fun is_temperate (Entity) Bool)
(declare-fun is_metallic (Entity) Bool)
(declare-fun is_opaque (Entity) Bool)

; 3. Declare constants
(declare-const Sam Entity)

; 4. Assert knowledge base (facts and rules)

; Each dumpus is bright.
(assert (forall ((x Entity)) (=> (is_dumpus x) (is_bright x))))

; Each dumpus is a rompus.
(assert (forall ((x Entity)) (=> (is_dumpus x) (is_rompus x))))

; Every rompus is aggressive.
(assert (forall ((x Entity)) (=> (is_rompus x) (is_aggressive x))))

; Every rompus is a yumpus.
(assert (forall ((x Entity)) (=> (is_rompus x) (is_yumpus x))))

; Yumpuses are brown.
(assert (forall ((x Entity)) (=> (is_yumpus x) (is_brown x))))

; Yumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (is_yumpus x) (is_vumpus x))))

; Every impus is fruity.
(assert (forall ((x Entity)) (=> (is_impus x) (is_fruity x))))

; Every vumpus is sour.
(assert (forall ((x Entity)) (=> (is_vumpus x) (is_sour x))))

; Every vumpus is a numpus.
(assert (forall ((x Entity)) (=> (is_vumpus x) (is_numpus x))))

; Every numpus is not temperate.
(assert (forall ((x Entity)) (=> (is_numpus x) (not (is_temperate x)))))

; Every numpus is a zumpus.
(assert (forall ((x Entity)) (=> (is_numpus x) (is_zumpus x))))

; Zumpuses are metallic.
(assert (forall ((x Entity)) (=> (is_zumpus x) (is_metallic x))))

; Zumpuses are jompuses.
(assert (forall ((x Entity)) (=> (is_zumpus x) (is_jompus x))))

; Each jompus is not fruity.
(assert (forall ((x Entity)) (=> (is_jompus x) (not (is_fruity x)))))

; Jompuses are tumpuses.
(assert (forall ((x Entity)) (=> (is_jompus x) (is_tumpus x))))

; Tumpuses are opaque.
(assert (forall ((x Entity)) (=> (is_tumpus x) (is_opaque x))))

; Every tumpus is a wumpus.
(assert (forall ((x Entity)) (=> (is_tumpus x) (is_wumpus x))))

; Sam is a yumpus.
(assert (is_yumpus Sam))

; 5. Verification
; Question: Is the following statement true or false? Sam is fruity.
; We assert the statement "Sam is fruity" to check for consistency.
; Logic Chain: Sam is Yumpus -> Vumpus -> Numpus -> Zumpus -> Jompus -> Not Fruity.
; Therefore, asserting "Sam is fruity" should lead to a contradiction (unsat).
(assert (is_fruity Sam))

; Check satisfiability
(check-sat)

; Get model (will be empty if unsat)
(get-model)