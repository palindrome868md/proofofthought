; Reasoning Steps:
; 1. Polly is a jompus (Given).
; 2. Every jompus is a dumpus -> Polly is a dumpus.
; 3. Each dumpus is a zumpus -> Polly is a zumpus.
; 4. Zumpuses are wumpuses -> Polly is a wumpus.
; 5. Every wumpus is an impus -> Polly is an impus.
; 6. Impuses are blue -> Polly is blue.
; 7. Conclusion: The statement "Polly is blue" is True.
; 8. Verification: Assert (is-blue Polly) and check for sat.

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Predicates)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-spicy (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)

; 3. Declare constants
(declare-const Polly Entity)

; 4. Assert knowledge base
; Every jompus is spicy
(assert (forall ((x Entity)) (=> (is-jompus x) (is-spicy x))))
; Every jompus is a dumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-dumpus x))))
; Each dumpus is not transparent
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-transparent x)))))
; Each dumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-zumpus x))))
; Zumpuses are feisty
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-feisty x))))
; Zumpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-wumpus x))))
; Each wumpus is not dull
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-dull x)))))
; Every wumpus is an impus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-impus x))))
; Every vumpus is not blue
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-blue x)))))
; Impuses are blue
(assert (forall ((x Entity)) (=> (is-impus x) (is-blue x))))
; Impuses are tumpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-tumpus x))))
; Tumpuses are not floral
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-floral x)))))
; Each tumpus is a numpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-numpus x))))
; Polly is a jompus
(assert (is-jompus Polly))

; 5. Verification
; Test: Is Polly blue?
(assert (is-blue Polly))

; Check satisfiability
(check-sat)
(get-model)