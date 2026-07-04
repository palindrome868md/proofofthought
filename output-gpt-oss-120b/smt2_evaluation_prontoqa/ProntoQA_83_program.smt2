; --------------------------------------------------------------
; 1. Declare the universe sort
(declare-sort Entity 0)

; 2. Declare all unary predicates (return Bool)
(declare-fun Tumpus      (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Impus       (Entity) Bool)
(declare-fun Cold        (Entity) Bool)
(declare-fun Yumpus      (Entity) Bool)
(declare-fun Sour        (Entity) Bool)
(declare-fun Zumpus      (Entity) Bool)
(declare-fun Amenable    (Entity) Bool)
(declare-fun Numpus      (Entity) Bool)
(declare-fun Wooden      (Entity) Bool)
(declare-fun Rompus      (Entity) Bool)
(declare-fun Dumpus      (Entity) Bool)
(declare-fun Dull        (Entity) Bool)
(declare-fun Vumpus      (Entity) Bool)
(declare-fun Large       (Entity) Bool)
(declare-fun Wumpus      (Entity) Bool)
(declare-fun Floral      (Entity) Bool)
(declare-fun Jompus      (Entity) Bool)

; 3. Declare the individual constant
(declare-const Wren Entity)

; --------------------------------------------------------------
; 4. Knowledge base (universal rules)

; Tumpuses are transparent
(assert (forall ((x Entity)) (=> (Tumpus x) (Transparent x))))

; Each impus is cold
(assert (forall ((x Entity)) (=> (Impus x) (Cold x))))

; Impuses are yumpuses
(assert (forall ((x Entity)) (=> (Impus x) (Yumpus x))))

; Every yumpus is sour
(assert (forall ((x Entity)) (=> (Yumpus x) (Sour x))))

; Yumpuses are zumpuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Zumpus x))))

; Zumpuses are not amenable
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Amenable x)))))

; Every zumpus is a numpus
(assert (forall ((x Entity)) (=> (Zumpus x) (Numpus x))))

; Numpuses are wooden
(assert (forall ((x Entity)) (=> (Numpus x) (Wooden x))))

; Numpuses are rompuses
(assert (forall ((x Entity)) (=> (Numpus x) (Rompus x))))

; Each rompus is not transparent
(assert (forall ((x Entity)) (=> (Rompus x) (not (Transparent x)))))

; Every rompus is a dumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Dumpus x))))

; Dumpuses are dull
(assert (forall ((x Entity)) (=> (Dumpus x) (Dull x))))

; Each dumpus is a vumpus
(assert (forall ((x Entity)) (=> (Dumpus x) (Vumpus x))))

; Vumpuses are large
(assert (forall ((x Entity)) (=> (Vumpus x) (Large x))))

; Each vumpus is a wumpus
(assert (forall ((x Entity)) (=> (Vumpus x) (Wumpus x))))

; Every wumpus is floral
(assert (forall ((x Entity)) (=> (Wumpus x) (Floral x))))

; Each wumpus is a jompus
(assert (forall ((x Entity)) (=> (Wumpus x) (Jompus x))))

; --------------------------------------------------------------
; 5. Facts about the specific individual

; Wren is an impus
(assert (Impus Wren))

; --------------------------------------------------------------
; 6. Test the statement: "Wren is transparent."
(assert (Transparent Wren))

; --------------------------------------------------------------
; 7. Check satisfiability (sat = true, unsat = false)
(check-sat)
(get-model)