; ---------------------------------------------------------
; 1. Declare the domain sort
; ---------------------------------------------------------
(declare-sort Entity 0)

; ---------------------------------------------------------
; 2. Declare predicates (unary Boolean functions)
; ---------------------------------------------------------
(declare-fun vumpus   (Entity) Bool)
(declare-fun floral   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun brown    (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun happy    (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun numpuse  (Entity) Bool) ; “numpses” → singular name
(declare-fun bitter   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun cold     (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)

; ---------------------------------------------------------
; 3. Universal rules (encoded as quantified implications)
; ---------------------------------------------------------
; Vumpuses are floral.
(assert (forall ((x Entity)) (=> (vumpus x) (floral x))))
; Vumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))
; Tumpuses are brown.
(assert (forall ((x Entity)) (=> (tumpus x) (brown x))))
; Each tumpus is a wumpus.
(assert (forall ((x Entity)) (=> (tumpus x) (wumpus x))))
; Wumpuses are small.
(assert (forall ((x Entity)) (=> (wumpus x) (small x))))
; Each wumpus is a rompus.
(assert (forall ((x Entity)) (=> (wumpus x) (rompus x))))
; Each zumpus is metallic.
(assert (forall ((x Entity)) (=> (zumpus x) (metallic x))))
; Every rompus is happy.
(assert (forall ((x Entity)) (=> (rompus x) (happy x))))
; Rompuses are impuses.
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
; Each impus is amenable.
(assert (forall ((x Entity)) (=> (impus x) (amenable x))))
; Each impus is a dumpus.
(assert (forall ((x Entity)) (=> (impus x) (dumpus x))))
; Every dumpus is not metallic.
(assert (forall ((x Entity)) (=> (dumpus x) (not (metallic x)))))
; Dumpuses are numpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (numpuse x))))
; Each numpus is bitter.
(assert (forall ((x Entity)) (=> (numpuse x) (bitter x))))
; Each numpus is a jompus.
(assert (forall ((x Entity)) (=> (numpuse x) (jompus x))))
; Every jompus is cold.
(assert (forall ((x Entity)) (=> (jompus x) (cold x))))
; Each jompus is a yumpus.
(assert (forall ((x Entity)) (=> (jompus x) (yumpus x))))

; ---------------------------------------------------------
; 4. Individual facts
; ---------------------------------------------------------
(declare-const wren Entity)
(assert (tumpus wren))

; ---------------------------------------------------------
; 5. Statement to be verified: "Wren is not metallic"
; ---------------------------------------------------------
(assert (not (metallic wren)))

; ---------------------------------------------------------
; 6. Check satisfiability (sat means the statement is true)
; ---------------------------------------------------------
(check-sat)
(get-model)