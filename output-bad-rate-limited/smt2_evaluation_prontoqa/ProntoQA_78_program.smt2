; Sorts
(declare-sort Entity 0)

; Constants
(declare-const Fae Entity)

; Predicates (uninterpreted relations)
(declare-fun Impus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)

(declare-fun Brown (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Kind (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Hot (Entity) Bool)

(declare-fun Happy (Entity) Bool)

; Knowledge base (rules)

; 1) Impus are not happy
(assert (forall ((p Entity)) (=> (Impus p) (not (Happy p)))))

; 2) Impus are vumpus
(assert (forall ((p Entity)) (=> (Impus p) (Vumpus p))))

; 3) Vumpus -> Brown
(assert (forall ((p Entity)) (=> (Vumpus p) (Brown p))))

; 4) Vumpus -> Dumpus
(assert (forall ((p Entity)) (=> (Vumpus p) (Dumpus p))))

; 5) Dumpus -> Rompus
(assert (forall ((p Entity)) (=> (Dumpus p) (Rompus p))))

; 6) Rompus -> Transparent
(assert (forall ((p Entity)) (=> (Rompus p) (Transparent p))))

; 7) Rompus -> Wumpus
(assert (forall ((p Entity)) (=> (Rompus p) (Wumpus p))))

; 8) Wumpus -> Kind
(assert (forall ((p Entity)) (=> (Wumpus p) (Kind p))))

; 9) Wumpus -> Yumpus
(assert (forall ((p Entity)) (=> (Wumpus p) (Yumpus p))))

; 10) Yumpus -> Small
(assert (forall ((p Entity)) (=> (Yumpus p) (Small p))))

; 11) Yumpus -> Zumpus
(assert (forall ((p Entity)) (=> (Yumpus p) (Zumpus p))))

; 12) Zumpus -> Liquid
(assert (forall ((p Entity)) (=> (Zumpus p) (Liquid p))))

; 13) Zumpus -> Tumpus
(assert (forall ((p Entity)) (=> (Zumpus p) (Tumpus p))))

; 14) Tumpus -> Hot
(assert (forall ((p Entity) (i) ) (=> (Tumpus p) (Hot p))))  ; corrected shape below

; 14') Tumpus -> Hot (properly formed)
(assert (forall ((p Entity)) (=> (Tumpus p) (Hot p))))

; 15) Tumpus -> Numpus
(assert (forall ((p Entity)) (=> (Tumpus p) (Numpus p))))

; Note: We also need Fae to exist as a vumpus to trigger the chain
(assert (Vumpus Fae))

; Test case: Is "Fae is small" true?
(assert (Small Fae))

; Verification
(check-sat)
(get-model)