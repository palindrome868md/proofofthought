;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Constants ---------------------------------------------------------
(declare-const Wren Entity)

;--- Unary predicates ---------------------------------------------------
(declare-fun Tumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Feisty (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Orange (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)

;--- Knowledge base ----------------------------------------------------
; Tumpuses are dull.
(assert (forall ((x Entity)) (=> (Tumpus x) (Dull x))))

; Tumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Tumpus x) (Jompus x))))

; Jompuses are not sour.
(assert (forall ((x Entity)) (=> (Jompus x) (not (Sour x)))))

; Each jompus is a vumpus.
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))

; Vumpuses are feisty.
(assert (forall ((x Entity)) (=> (Vumpus x) (Feisty x))))

; Vumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (Vumpus x) (Dumpus x))))

; Dumpuses are cold.
(assert (forall ((x Entity)) (=> (Dumpus x) (Cold x))))

; Each dumpus is a yumpus.
(assert (forall ((x Entity)) (=> (Dumpus x) (Yumpus x))))

; Each yumpus is transparent.
(assert (forall ((x Entity)) (=> (Yumpus x) (Transparent x))))

; Each yumpus is a numpus.
(assert (forall ((x Entity)) (=> (Yumpus x) (Numpus x))))

; Numpuses are not amenable.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Amenable x)))))

; Numpuses are zumpuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Zumpus x))))

; Each zumpus is orange.
(assert (forall ((x Entity)) (=> (Zumpus x) (Orange x))))

; Each zumpus is a rompus.
(assert (forall ((x Entity)) (=> (Zumpus x) (Rompus x))))

; Rompuses are earthy.
(assert (forall ((x Entity)) (=> (Rompus x) (Earthy x))))

; Each impus is not orange.
(assert (forall ((x Entity)) (=> (Impus x) (not (Orange x)))))

; Rompuses are wumpuses.
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))

;--- Fact about Wren ----------------------------------------------------
(assert (Vumpus Wren))

;--- Query: "Wren is not orange" ----------------------------------------
(assert (not (Orange Wren)))   ; we test the negation of what we can prove

;--- Check the consistency ------------------------------------------------
(check-sat)   ; expected result: unsat (the statement is false)
(get-model)