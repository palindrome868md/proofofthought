; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
; Type predicates
(declare-fun is_numpus (Entity) Bool)
(declare-fun is_wumpus (Entity) Bool)
(declare-fun is_tumpus (Entity) Bool)
(declare-fun is_dumpus (Entity) Bool)
(declare-fun is_yumpus (Entity) Bool)
(declare-fun is_zumpus (Entity) Bool)
(declare-fun is_impus (Entity) Bool)
(declare-fun is_rompus (Entity) Bool)
(declare-fun is_vumpus (Entity) Bool)
(declare-fun is_jompus (Entity) Bool)

; Property predicates
(declare-fun is_opaque (Entity) Bool)
(declare-fun is_feisty (Entity) Bool)
(declare-fun is_fruity (Entity) Bool)
(declare-fun is_wooden (Entity) Bool)
(declare-fun is_blue (Entity) Bool)
(declare-fun is_spicy (Entity) Bool)
(declare-fun is_kind (Entity) Bool)
(declare-fun is_dull (Entity) Bool)

; 3. Declare Constants
(declare-const sam Entity)

; 4. Assert Knowledge Base (Rules)

; Each numpus is not opaque
(assert (forall ((x Entity)) (=> (is_numpus x) (not (is_opaque x)))))

; Each numpus is a wumpus
(assert (forall ((x Entity)) (=> (is_numpus x) (is_wumpus x))))

; Each wumpus is feisty
(assert (forall ((x Entity)) (=> (is_wumpus x) (is_feisty x))))

; Wumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is_wumpus x) (is_tumpus x))))

; Tumpuses are fruity
(assert (forall ((x Entity)) (=> (is_tumpus x) (is_fruity x))))

; Every tumpus is a dumpus
(assert (forall ((x Entity)) (=> (is_tumpus x) (is_dumpus x))))

; Every dumpus is wooden
(assert (forall ((x Entity)) (=> (is_dumpus x) (is_wooden x))))

; Each dumpus is a yumpus
(assert (forall ((x Entity)) (=> (is_dumpus x) (is_yumpus x))))

; Yumpuses are blue
(assert (forall ((x Entity)) (=> (is_yumpus x) (is_blue x))))

; Each yumpus is a zumpus
(assert (forall ((x Entity)) (=> (is_yumpus x) (is_zumpus x))))

; Every zumpus is spicy
(assert (forall ((x Entity)) (=> (is_zumpus x) (is_spicy x))))

; Zumpuses are impuses
(assert (forall ((x Entity)) (=> (is_zumpus x) (is_impus x))))

; Each impus is not kind
(assert (forall ((x Entity)) (=> (is_impus x) (not (is_kind x)))))

; Impuses are rompuses
(assert (forall ((x Entity)) (=> (is_impus x) (is_rompus x))))

; Jompuses are not dull
(assert (forall ((x Entity)) (=> (is_jompus x) (not (is_dull x)))))

; Every rompus is dull
(assert (forall ((x Entity)) (=> (is_rompus x) (is_dull x))))

; Each rompus is a vumpus
(assert (forall ((x Entity)) (=> (is_rompus x) (is_vumpus x))))

; Fact: Sam is a dumpus
(assert (is_dumpus sam))

; 5. Test Statement: "Sam is not dull"
; We assert the statement to check if it is consistent with the KB.
; If unsat, the statement is False.
(assert (not (is_dull sam)))

; 6. Check Satisfiability
(check-sat)
(get-model)