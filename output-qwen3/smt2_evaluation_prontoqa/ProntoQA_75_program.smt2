; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories and properties)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)

(declare-fun is-bright (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-spicy (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-small (Entity) Bool)

; 3. Declare constants
(declare-const Polly Entity)

; 4. Assert knowledge base (rules)
; Jompuses are bright
(assert (forall ((x Entity)) (=> (is-jompus x) (is-bright x))))
; Every jompus is a rompus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-rompus x))))
; Rompuses are not opaque
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-opaque x)))))
; Rompuses are vumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-vumpus x))))
; Each vumpus is red
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-red x))))
; Each vumpus is a numpus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-numpus x))))
; Every zumpus is not fruity
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-fruity x)))))
; Every numpus is not spicy
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-spicy x)))))
; Numpuses are impuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-impus x))))
; Each impus is temperate
(assert (forall ((x Entity)) (=> (is-impus x) (is-temperate x))))
; Every impus is a wumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-wumpus x))))
; Every wumpus is fruity
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-fruity x))))
; Wumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-yumpus x))))
; Yumpuses are liquid
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-liquid x))))
; Yumpuses are dumpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-dumpus x))))
; Dumpuses are small
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-small x))))
; Dumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-tumpus x))))

; 5. Assert facts about Polly
; Polly is a rompus
(assert (is-rompus Polly))

; 6. Test the statement: Polly is fruity
(assert (is-fruity Polly))

; 7. Check satisfiability
; sat = True (Statement is consistent/entailed)
; unsat = False (Statement contradicts KB)
(check-sat)
(get-model)