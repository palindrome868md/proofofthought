; Sorts
(declare-sort Entity 0)

; Predicates (unary)
(declare-fun Rompus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Angry (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Luminous (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Dull (Entity) Bool)

; Constants
(declare-const Max Entity)

; Knowledge base (facts and rules)

; 1) Max is a zumpus
(assert (Zumpus Max))

; 2) Rompus -> Spicy
(assert (forall ((x Entity)) (=> (Rompus x) (Spicy x))))

; 3) Rompus -> Zumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Zumpus x))))

; 4) Zumpus -> Dumpus
(assert (forall ((x Entity)) (=> (Zumpus x) (Dumpus x))))

; 5) Dumpus -> Vumpus
(assert (forall ((x Entity)) (=> (Dumpus x) (Vumpus x))))

; 6) Vumpus -> Jompus
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))

; 7) Jompus -> not Large
(assert (forall ((x Entity)) (=> (Jompus x) (not (Large x)))))

; 8) Jompus -> Wumpus
(assert (forall ((x Entity)) (=> (Jompus x) (Wumpus x))))

; 9) Wumpus -> not Angry
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Angry x)))))

; 10) Wumpus -> Tumpus
(assert (forall ((x Entity)) (=> (Wumpus x) (Tumpus x))))

; 11) Tumpus -> Dull
(assert (forall ((x Entity)) (=> (Tumpus x) (Dull x))))

; 12) Tumpus -> Numpus
(assert (forall ((x Entity)) (=> (Tumpus x) (Numpus x))))

; 13) Numpus -> not Luminous
(assert (forall ((x Entity)) (=> (Numpus x) (not (Luminous x)))))

; 14) Numpus -> Yumpus
(assert (forall ((x Entity)) (=> (Numpus x) (Yumpus x))))

; 15) Vumpus -> Blue
(assert (forall ((x Entity)) (=> (Vumpus x) (Blue x))))

; 16) Dumpus -> Happy
(assert (forall ((x Entity)) (=> (Dumpus x) (Happy x))))

; Test scenario: Is "Max angry" true?
; Add the claim to test
(assert (Angry Max))

; Check satisfiability to determine truth of "Max is angry"
(check-sat)
(get-model)