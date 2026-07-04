; ------------------------------------------------------------
;  Declarations
; ------------------------------------------------------------
(declare-sort Entity 0)

; Unary predicates (properties / classes)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Orange   (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Small    (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Sour     (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Cold     (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Dull     (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Floral   (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Opaque   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)

; Constant representing the individual Fae
(declare-const Fae Entity)

; ------------------------------------------------------------
;  Knowledge base (premises)
; ------------------------------------------------------------

; 1.  Each tumpus is orange.
(assert (forall ((x Entity)) (=> (Tumpus x) (Orange x))))

; 2.  Tumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Tumpus x) (Numpus x))))

; 3.  Numpuses are small.
(assert (forall ((x Entity)) (=> (Numpus x) (Small x))))

; 4.  Numpuses are vumpuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Vumpus x))))

; 5.  Every vumpus is sour.
(assert (forall ((x Entity)) (=> (Vumpus x) (Sour x))))

; 6.  Vumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (Vumpus x) (Dumpus x))))

; 7.  Each dumpus is cold.
(assert (forall ((x Entity)) (=> (Dumpus x) (Cold x))))

; 8.  Every dumpus is a zumpus.
(assert (forall ((x Entity)) (=> (Dumpus x) (Zumpus x))))

; 9.  Each zumpus is dull.
(assert (forall ((x Entity)) (=> (Zumpus x) (Dull x))))

;10.  Zumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (Zumpus x) (Yumpus x))))

;11.  Jompuses are floral.
(assert (forall ((x Entity)) (=> (Jompus x) (Floral x))))

;12.  Every yumpus is not amenable.
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Amenable x)))))

;13.  Each yumpus is a rompus.
(assert (forall ((x Entity)) (=> (Yumpus x) (Rompus x))))

;14.  Every rompus is opaque.
(assert (forall ((x Entity)) (=> (Rompus x) (Opaque x))))

;15.  Rompuses are impuses.
(assert (forall ((x Entity)) (=> (Rompus x) (Impus x))))

;16.  Impuses are not floral.
(assert (forall ((x Entity)) (=> (Impus x) (not (Floral x)))))

;17.  Impuses are wumpuses.
(assert (forall ((x Entity)) (=> (Impus x) (Wumpus x))))

; ------------------------------------------------------------
;  Fact about Fae
; ------------------------------------------------------------
(assert (Dumpus Fae))

; ------------------------------------------------------------
;  Test the statement: "Fae is not floral"
; ------------------------------------------------------------
(assert (not (Floral Fae)))

; ------------------------------------------------------------
;  Check satisfiability
; ------------------------------------------------------------
(check-sat)
(get-model)