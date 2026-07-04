; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for properties and categories)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)
(declare-fun is-luminous (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-spicy (Entity) Bool)
(declare-fun is-dull (Entity) Bool)

; 3. Declare constants
(declare-const Polly Entity)

; 4. Assert knowledge base (facts and rules)
; Every yumpus is not kind
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-kind x)))))
; Each yumpus is an impus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-impus x))))
; Every impus is not red
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-red x)))))
; Every impus is a numpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-numpus x))))
; Numpuses are feisty
(assert (forall ((x Entity)) (=> (is-numpus x) (is-feisty x))))
; Each dumpus is not luminous
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-luminous x)))))
; Numpuses are zumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-zumpus x))))
; Each zumpus is cold
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-cold x))))
; Zumpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-wumpus x))))
; Each wumpus is fruity
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-fruity x))))
; Every wumpus is a rompus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-rompus x))))
; Every rompus is spicy
(assert (forall ((x Entity)) (=> (is-rompus x) (is-spicy x))))
; Rompuses are tumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-tumpus x))))
; Tumpuses are luminous
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-luminous x))))
; Tumpuses are jompuses
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-jompus x))))
; Every jompus is not dull
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-dull x)))))
; Jompuses are vumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-vumpus x))))
; Polly is a numpus
(assert (is-numpus Polly))

; 5. Verification: Test the statement "Polly is not luminous"
; Logical Derivation: 
; Polly is numpus -> Polly is zumpus -> Polly is wumpus -> Polly is rompus -> Polly is tumpus -> Polly is luminous.
; Since the KB implies Polly IS luminous, asserting Polly is NOT luminous should result in unsat.
(assert (not (is-luminous Polly)))

; 6. Check satisfiability
; Expected: unsat (indicating the statement "Polly is not luminous" is False)
(check-sat)
(get-model)