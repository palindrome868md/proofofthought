; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories and properties)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)

(declare-fun is-fruity (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-mean (Entity) Bool)

; 3. Declare constants
(declare-const Alex Entity)

; 4. Assert knowledge base (facts)
; Numpuses are not fruity
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-fruity x)))))
; Numpuses are dumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dumpus x))))
; Each dumpus is not orange
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-orange x)))))
; Dumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-yumpus x))))
; Yumpuses are nervous
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-nervous x))))
; Yumpuses are vumpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))
; Every impus is sour
(assert (forall ((x Entity)) (=> (is-impus x) (is-sour x))))
; Every vumpus is hot
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-hot x))))
; Vumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-tumpus x))))
; Each tumpus is small
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-small x))))
; Tumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-rompus x))))
; Every rompus is mean
(assert (forall ((x Entity)) (=> (is-rompus x) (is-mean x))))
; Rompuses are zumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))
; Each zumpus is not sour
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-sour x)))))
; Zumpuses are jompuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-jompus x))))
; Alex is a yumpus
(assert (is-yumpus Alex))

; 5. Verify the statement: "Alex is not sour"
; Assert the statement to test
(assert (not (is-sour Alex)))

; Check satisfiability
(check-sat)
(get-model)