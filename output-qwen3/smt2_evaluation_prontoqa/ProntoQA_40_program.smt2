; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for types and properties)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)

(declare-fun is-small (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)

; 3. Declare constants
(declare-const sally Entity)

; 4. Assert knowledge base (facts and rules)

; Yumpuses are small
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-small x))))
; Yumpuses are vumpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))
; Vumpuses are red
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-red x))))
; Vumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-numpus x))))
; Numpuses are bitter
(assert (forall ((x Entity)) (=> (is-numpus x) (is-bitter x))))
; Each numpus is a wumpus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-wumpus x))))
; Each impus is not amenable
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-amenable x)))))
; Every wumpus is bright
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-bright x))))
; Every wumpus is a dumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-dumpus x))))
; Every dumpus is temperate
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-temperate x))))
; Dumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-rompus x))))
; Rompuses are floral
(assert (forall ((x Entity)) (=> (is-rompus x) (is-floral x))))
; Rompuses are tumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-tumpus x))))
; Tumpuses are opaque
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-opaque x))))
; Each tumpus is a jompus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-jompus x))))
; Every jompus is amenable
(assert (forall ((x Entity)) (=> (is-jompus x) (is-amenable x))))
; Every jompus is a zumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-zumpus x))))

; Fact: Sally is a wumpus
(assert (is-wumpus sally))

; 5. Assert the statement to verify
; Question: Is the following statement true or false? Sally is amenable.
; We assert the statement. If sat, it is True. If unsat, it is False.
(assert (is-amenable sally))

; 6. Check satisfiability
(check-sat)
(get-model)