; Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

; Predicates (unary properties)
(declare-fun jompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun sweet (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)

; Constant representing the individual "Fae"
(declare-const Fae Entity)

; Knowledge base
; Jompuses are large (irrelevant for opacity, omitted)
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))          ; every jompus is a zumpus
(assert (forall ((x Entity)) (=> (zumpus x) (sweet x))))          ; each zumpus is sweet
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))         ; zumpus ⇒ numpus
(assert (forall ((x Entity)) (=> (numpus x) (hot x))))            ; every numpus is hot
(assert (forall ((x Entity)) (=> (tumpus x) (opaque x))))        ; each tumpus is opaque
(assert (forall ((x Entity)) (=> (numpus x) (yumpus x))))         ; numpuses are yumpuses
(assert (forall ((x Entity)) (=> (yumpus x) (brown x))))          ; every yumpus is brown
(assert (forall ((x Entity)) (=> (yumpus x) (wumpus x))))         ; each yumpus is a wumpus
(assert (forall ((x Entity)) (=> (wumpus x) (not (opaque x))))) ; wumpuses are not opaque
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))          ; wumpuses are impuses

; Fact: Fae is a jompus
(assert (jompus Fae))

; ------------------------------------------------------------------
; Test the statement: "Fae is opaque."
; We assert the opposite of what the knowledge base entails and see
; whether the constraints become unsatisfiable.
(assert (opaque Fae))

; Check whether the combined constraints are consistent
(check-sat)
(get-model)