; Declare the universal sort for all individuals
(declare-sort Entity 0)

; Unary predicates (properties)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Nervous  (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Large    (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Brown    (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Bitter   (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Floral   (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Bright   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)

; Constant representing Wren
(declare-const wren Entity)

; Knowledge base (axioms)

; Every zumpus is nervous.
(assert (forall ((x Entity)) (=> (Zumpus x) (Nervous x))))

; Every zumpus is a dumpus.
(assert (forall ((x Entity)) (=> (Zumpus x) (Dumpus x))))

; Every dumpus is large.
(assert (forall ((x Entity)) (=> (Dumpus x) (Large x))))

; Dumpuses are rompuses.
(assert (forall ((x Entity)) (=> (Dumpus x) (Rompus x))))

; Every rompus is brown.
(assert (forall ((x Entity)) (=> (Rompus x) (Brown x))))

; Each rompus is a numpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Numpus x))))

; Numpuses are not bitter.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Bitter x)))))

; Numpuses are wumpuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))

; Each wumpus is floral.
(assert (forall ((x Entity)) (=> (Wumpus x) (Floral x))))

; Every wumpus is a yumpus.
(assert (forall ((x Entity)) (=> (Wumpus x) (Yumpus x))))

; Every yumpus is not transparent.
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Transparent x)))))

; Yumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (Yumpus x) (Tumpus x))))

; Tumpuses are not bright.
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Bright x)))))

; Every tumpus is an impus.
(assert (forall ((x Entity)) (=> (Tumpus x) (Impus x))))

; Vumpuses are transparent.
(assert (forall ((x Entity)) (=> (Vumpus x) (Transparent x))))

; Fact: Wren is a dumpus.
(assert (Dumpus wren))

; -------------------------------------------------
; Query: Is Wren not transparent?
; -------------------------------------------------
(assert (not (Transparent wren))

)
; Check satisfiability (sat means the statement is true)
(check-sat)
(get-model)