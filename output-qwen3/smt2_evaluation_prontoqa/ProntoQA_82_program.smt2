; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories and properties)
; Categories
(declare-fun is-impus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)

; Properties
(declare-fun is-mean (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-happy (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)

; 3. Declare constants
(declare-const rex Entity)

; 4. Assert knowledge base (rules and facts)
; Impuses are mean
(assert (forall ((x Entity)) (=> (is-impus x) (is-mean x))))
; Each impus is a yumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))
; Yumpuses are blue
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-blue x))))
; Yumpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-wumpus x))))
; Wumpuses are hot
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-hot x))))
; Every wumpus is a numpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-numpus x))))
; Jompuses are happy
(assert (forall ((x Entity)) (=> (is-jompus x) (is-happy x))))
; Numpuses are fruity
(assert (forall ((x Entity)) (=> (is-numpus x) (is-fruity x))))
; Numpuses are dumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dumpus x))))
; Every dumpus is not dull
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-dull x)))))
; Every dumpus is a tumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-tumpus x))))
; Tumpuses are not happy
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-happy x)))))
; Every tumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-vumpus x))))
; Vumpuses are not opaque
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-opaque x)))))
; Every vumpus is a rompus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-rompus x))))
; Rompuses are metallic
(assert (forall ((x Entity)) (=> (is-rompus x) (is-metallic x))))
; Each rompus is a zumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))

; Fact: Rex is a yumpus
(assert (is-yumpus rex))

; 5. Verification
; Question: Is the statement "Rex is not happy" true?
; We assert the statement and check for satisfiability.
; Logical Chain: Rex -> Yumpus -> Wumpus -> Numpus -> Dumpus -> Tumpus -> Not Happy.
(assert (not (is-happy rex)))

; Check satisfiability
(check-sat)
(get-model)