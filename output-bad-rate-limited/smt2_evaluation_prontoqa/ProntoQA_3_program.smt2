; Declare domain
(declare-sort Entity 0)

; Declare constants
(declare-const wren Entity)

; Declare category predicates
(declare-fun Vumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)

; Declare property predicates
(declare-fun Floral (Entity) Bool)
(declare-fun Brown (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Bitter (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)

; Knowledge base (facts/rules)

; Wren is a tumpus
(assert (Tumpus wren))

; Universal rules
(assert (forall ((x Entity)) (=> (Vumpus x) (Floral x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Brown x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Small x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Happy x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Amenable x))))
(assert (forall ((x Entity)) (=> (Impus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Metallic x)))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Bitter x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Cold x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Metallic x))))

; Test scenario: (the negation of the question) we test by asserting the statement itself
; Question: "Wren is not metallic." We'll test by asserting (not Metallic wren)
(assert (not (Metallic wren)))

; Check satisfiability
(check-sat)
(get-model)