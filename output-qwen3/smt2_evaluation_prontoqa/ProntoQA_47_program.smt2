; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare predicates (functions returning Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)

; 3. Declare constants
(declare-const Max Entity)

; 4. Assert knowledge base (facts and rules)

; Vumpuses are fruity.
(assert (forall ((x Entity)) (=> (Vumpus x) (Fruity x))))

; Vumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))

; Jompuses are opaque.
(assert (forall ((x Entity)) (=> (Jompus x) (Opaque x))))

; Every jompus is a wumpus.
(assert (forall ((x Entity)) (=> (Jompus x) (Wumpus x))))

; Every wumpus is nervous.
(assert (forall ((x Entity)) (=> (Wumpus x) (Nervous x))))

; Each wumpus is an impus.
(assert (forall ((x Entity)) (=> (Wumpus x) (Impus x))))

; Every impus is sour.
(assert (forall ((x Entity)) (=> (Impus x) (Sour x))))

; Impuses are tumpuses.
(assert (forall ((x Entity)) (=> (Impus x) (Tumpus x))))

; Every tumpus is not amenable.
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Amenable x)))))

; Each tumpus is a yumpus.
(assert (forall ((x Entity)) (=> (Tumpus x) (Yumpus x))))

; Yumpuses are not metallic.
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Metallic x)))))

; Yumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Yumpus x) (Numpus x))))

; Numpuses are large.
(assert (forall ((x Entity)) (=> (Numpus x) (Large x))))

; Every numpus is a rompus.
(assert (forall ((x Entity)) (=> (Numpus x) (Rompus x))))

; Dumpuses are not cold.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Cold x)))))

; Each rompus is cold.
(assert (forall ((x Entity)) (=> (Rompus x) (Cold x))))

; Each rompus is a zumpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Zumpus x))))

; Max is an impus.
(assert (Impus Max))

; 5. Verification
; Question: Is the statement "Max is not cold" true?
; We assert the statement to check satisfiability.
; If unsat, the statement contradicts the KB (is False).
; If sat, the statement is consistent with the KB (is True).
(assert (not (Cold Max)))

(check-sat)
(get-model)