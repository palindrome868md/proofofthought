; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Predicates)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)

(declare-fun is-small (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-hot (Entity) Bool)

; 3. Declare constants
(declare-const sam Entity)

; 4. Assert knowledge base (facts)
; Jompuses are not small
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-small x)))))
; Jompuses are tumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-tumpus x))))
; Tumpuses are not kind
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-kind x)))))
; Each tumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-vumpus x))))
; Vumpuses are metallic
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-metallic x))))
; Vumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-numpus x))))
; Each numpus is fruity
(assert (forall ((x Entity)) (=> (is-numpus x) (is-fruity x))))
; Each numpus is a dumpus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dumpus x))))
; Dumpuses are nervous
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-nervous x))))
; Dumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-rompus x))))
; Each rompus is opaque
(assert (forall ((x Entity)) (=> (is-rompus x) (is-opaque x))))
; Every wumpus is dull
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-dull x))))
; Each rompus is a zumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))
; Each zumpus is hot
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-hot x))))
; Every zumpus is an impus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-impus x))))
; Every impus is not dull
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-dull x)))))
; Each impus is a yumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))
; Sam is a numpus
(assert (is-numpus sam))

; 5. Verification
; Question: Is the following statement true or false? Sam is not dull.
; We assert the statement to check if it is satisfiable (True)
(assert (not (is-dull sam)))

(check-sat)
(get-model)