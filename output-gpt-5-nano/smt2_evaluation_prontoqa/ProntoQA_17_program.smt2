; Sorts
(declare-sort Entity 0)

; Predicates (unary)
(declare-fun numpus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun rompuses (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun dumpus (Entity) Bool)

; Constant
(declare-const Fae Entity)

; Knowledge base (axioms)
(assert (forall ((x Entity)) (=> (numpus x) (not (nervous x)))))
(assert (forall ((x Entity)) (=> (numpus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (liquid x))))
(assert (forall ((x Entity)) (=> (wumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (fruity x))))
(assert (forall ((x Entity)) (=> (zumpus x) (not (opaque x)))))
(assert (forall ((x Entity)) (=> (jompus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (kind x))))
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (opaque x))))
(assert (forall ((x Entity)) (=> (vumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (not (small x)))))
(assert (forall ((x Entity)) (=> (impus x) (rompuses x))))
(assert (forall ((x Entity)) (=> (rompuses x) (dull x))))
(assert (forall ((x Entity)) (=> (rompuses x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (temperate x))))
(assert (forall ((x Entity)) (=> (tumpus x) (dumpus x))))

; Fact: Fae is a numpus
(assert (numpus Fae))

; Test: Is "Fae not opaque" true?
; If the knowledge base entails Fae opaque, this assertion will make the problem unsat.
(assert (not (opaque Fae)))

; Check satisfiability
(check-sat)
(get-model)