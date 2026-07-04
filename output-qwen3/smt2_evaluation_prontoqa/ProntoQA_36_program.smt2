; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-shy (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)

; 3. Declare constants
(declare-const Sally Entity)

; 4. Assert Knowledge Base
; Every jompus is bright
(assert (forall ((x Entity)) (=> (is-jompus x) (is-bright x))))
; Every jompus is a wumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))
; Each wumpus is wooden
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-wooden x))))
; Each wumpus is a yumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-yumpus x))))
; Yumpuses are amenable
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-amenable x))))
; Yumpuses are impuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-impus x))))
; Impuses are temperate
(assert (forall ((x Entity)) (=> (is-impus x) (is-temperate x))))
; Impuses are tumpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-tumpus x))))
; Tumpuses are shy
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-shy x))))
; Every tumpus is a rompus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-rompus x))))
; Rompuses are not small
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-small x)))))
; Every rompus is a numpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-numpus x))))
; Numpuses are fruity
(assert (forall ((x Entity)) (=> (is-numpus x) (is-fruity x))))
; Each dumpus is not shy
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-shy x)))))
; Numpuses are vumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-vumpus x))))
; Sally is a jompus
(assert (is-jompus Sally))

; 5. Verification
; Question: Is the following statement true or false? Sally is shy.
; Assert the statement to test consistency (True = sat, False = unsat)
(assert (is-shy Sally))

; 6. Check satisfiability
(check-sat)
(get-model)