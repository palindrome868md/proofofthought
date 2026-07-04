; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for properties and categories)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-orange (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)

; 3. Declare constants
(declare-const sam Thing)

; 4. Assert knowledge base (facts)

; Jompuses are not dull
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-dull x)))))

; Every wumpus is opaque
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-opaque x))))

; Wumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-dumpus x))))

; Every dumpus is not floral
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-floral x)))))

; Dumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-numpus x))))

; Each numpus is not luminous
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-luminous x)))))

; Each numpus is a vumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-vumpus x))))

; Every vumpus is large
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-large x))))

; Vumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-tumpus x))))

; Every tumpus is not orange
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-orange x)))))

; Every tumpus is a zumpus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-zumpus x))))

; Zumpuses are dull
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-dull x))))

; Every zumpus is an impus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-impus x))))

; Every impus is spicy
(assert (forall ((x Thing)) (=> (is-impus x) (is-spicy x))))

; Every impus is a rompus
(assert (forall ((x Thing)) (=> (is-impus x) (is-rompus x))))

; Rompuses are not temperate
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-temperate x)))))

; Every rompus is a yumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-yumpus x))))

; Sam is a dumpus
(assert (is-dumpus sam))

; 5. Verification: Test if "Sam is dull" is True
; Assert the statement to be verified
(assert (is-dull sam))

; 6. Check satisfiability
; sat = True (Statement is consistent/derivable)
; unsat = False (Statement contradicts KB)
(check-sat)
(get-model)