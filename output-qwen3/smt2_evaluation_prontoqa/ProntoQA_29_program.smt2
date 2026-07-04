; Reasoning Steps:
; 1. Max is a jompus (Given).
; 2. Jompuses are rompuses (Given) -> Max is a rompus.
; 3. Rompuses are zumpuses (Given) -> Max is a zumpus.
; 4. Zumpuses are tumpuses (Given) -> Max is a tumpus.
; 5. Tumpuses are yumpuses (Given) -> Max is a yumpus.
; 6. Yumpuses are not bright (Given) -> Max is not bright.
; 7. Question: Is Max bright?
; 8. Verification: Assert (is-bright Max) and check satisfiability.
; 9. Expected Result: unsat (indicating the statement is False).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare constants
(declare-const Max Entity)

; 3. Declare functions (predicates)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)

; 4. Assert knowledge base (facts and rules)

; Max is a jompus
(assert (is-jompus Max))

; Every jompus is liquid
(assert (forall ((x Entity)) (=> (is-jompus x) (is-liquid x))))

; Jompuses are rompuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-rompus x))))

; Every rompus is mean
(assert (forall ((x Entity)) (=> (is-rompus x) (is-mean x))))

; Rompuses are zumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))

; Each zumpus is transparent
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-transparent x))))

; Zumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-tumpus x))))

; Tumpuses are not earthy
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-earthy x)))))

; Each dumpus is bright
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-bright x))))

; Tumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-yumpus x))))

; Yumpuses are not bright
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-bright x)))))

; Yumpuses are impuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-impus x))))

; Impuses are temperate
(assert (forall ((x Entity)) (=> (is-impus x) (is-temperate x))))

; Impuses are numpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-numpus x))))

; Every numpus is feisty
(assert (forall ((x Entity)) (=> (is-numpus x) (is-feisty x))))

; Numpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-wumpus x))))

; 5. Verification: Test the statement "Max is bright"
(assert (is-bright Max))

; 6. Check satisfiability
(check-sat)
(get-model)