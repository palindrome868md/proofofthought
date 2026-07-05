; Declare sorts
(declare-sort Entity 0)

; Declare predicates (unary predicates representing properties)
(declare-fun Jompus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Feisty (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Dumpuse (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Numpuse (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Hot (Entity) Bool)
(declare-fun Brown (Entity) Bool)
(declare-fun Kind (Entity) Bool)
(declare-fun Dull (Entity) Bool)

; Declare constants
(declare-const Alex Entity)

; Knowledge base (universal rules)
(assert (forall ((p Entity)) (=> (Jompus p) (Sour p))))
(assert (forall ((p Entity)) (=> (Jompus p) (Rompus p))))
(assert (forall ((p Entity)) (=> (Rompus p) (not (Kind p)))))
(assert (forall ((p Entity)) (=> (Rompus p) (Zumpus p))))
(assert (forall ((p Entity)) (=> (Zumpus p) (Feisty p))))
(assert (forall ((p Entity)) (=> (Zumpus p) (Tumpus p))))
(assert (forall ((p Entity)) (=> (Tumpus p) (Small p))))
(assert (forall ((p Entity)) (=> (Tumpus p) (Wumpus p))))
(assert (forall ((p Entity)) (=> (Wumpus p) (Opaque p))))
(assert (forall ((p Entity)) (=> (Wumpus p) (Impuse p))))
(assert (forall ((p Entity)) (=> (Yumpus p) (Hot p))))
(assert (forall ((p Entity)) (=> (Impuse p) (Brown p))))
(assert (forall ((p Entity)) (=> (Impuse p) (Dumpuse p))))
(assert (forall ((p Entity)) (=> (Dumpuse p) (Vumpus p))))
(assert (forall ((p Entity)) (=> (Vumpus p) (Numpuse p))))

; Fact: Alex is a zumpus
(assert (Zumpus Alex))

; Test: Is Alex hot? (the scenario we are verifying)
(assert (Hot Alex))

; Check satisfiability and provide a model if exists
(check-sat)
(get-model)