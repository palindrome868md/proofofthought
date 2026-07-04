; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Predicates for categories and properties)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)

; 3. Declare constants
(declare-const Max Entity)

; 4. Assert knowledge base (facts and rules)

; Each zumpus is not nervous.
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-nervous x)))))

; Zumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-dumpus x))))

; Every dumpus is sweet.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-sweet x))))

; Each dumpus is a vumpus.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-vumpus x))))

; Each vumpus is not brown.
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-brown x)))))

; Vumpuses are rompuses.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-rompus x))))

; Rompuses are kind.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-kind x))))

; Rompuses are yumpuses.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-yumpus x))))

; Every yumpus is large.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-large x))))

; Each yumpus is a tumpus.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-tumpus x))))

; Tumpuses are fruity.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-fruity x))))

; Each tumpus is a wumpus.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-wumpus x))))

; Every impus is metallic.
(assert (forall ((x Entity)) (=> (is-impus x) (is-metallic x))))

; Wumpuses are not metallic.
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-metallic x)))))

; Every wumpus is a numpus.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-numpus x))))

; Numpuses are not transparent.
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-transparent x)))))

; Every numpus is a jompus.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-jompus x))))

; Max is a vumpus.
(assert (is-vumpus Max))

; 5. Verify Question: Is Max metallic?
; We assert the statement to test. If unsat, the statement is False.
(assert (is-metallic Max))

; Check satisfiability
(check-sat)
(get-model)