;-------------------------------------------------
; 1. Declare the (uninterpreted) sort for all objects
;-------------------------------------------------
(declare-sort Entity 0)

;-------------------------------------------------
; 2. Declare unary predicates (functions returning Bool)
;-------------------------------------------------
(declare-fun jompus   (Entity) Bool)
(declare-fun spicy    (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun feisty   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun blue     (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun floral   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)

;-------------------------------------------------
; 3. Declare the constant representing Polly
;-------------------------------------------------
(declare-const polly Entity)

;-------------------------------------------------
; 4. Knowledge base (the given universal statements)
;-------------------------------------------------
; Every jompus is spicy.
(assert (forall ((x Entity)) (=> (jompus x) (spicy x))))

; Every jompus is a dumpus.
(assert (forall ((x Entity)) (=> (jompus x) (dumpus x))))

; Each dumpus is not transparent.
(assert (forall ((x Entity)) (=> (dumpus x) (not (transparent x)))))

; Each dumpus is a zumpus.
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))

; Zumpuses are feisty.
(assert (forall ((x Entity)) (=> (zumpus x) (feisty x))))

; Zumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (wumpus x))))

; Each wumpus is not dull.
(assert (forall ((x Entity)) (=> (wumpus x) (not (dull x)))))

; Every wumpus is an impus.
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))

; Every vumpus is not blue.
(assert (forall ((x Entity)) (=> (vumpus x) (not (blue x)))))

; Impuses are blue.
(assert (forall ((x Entity)) (=> (impus x) (blue x))))

; Impuses are tumpuses.
(assert (forall ((x Entity)) (=> (impus x) (tumpus x))))

; Tumpuses are not floral.
(assert (forall ((x Entity)) (=> (tumpus x) (not (floral x)))))

; Each tumpus is a numpus.
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

; Fact: Polly is a jompus.
(assert (jompus polly))

;-------------------------------------------------
; 5. Test the claim: "Polly is blue."
;-------------------------------------------------
(assert (blue polly))

;-------------------------------------------------
; 6. Check satisfiability (sat means the claim is true)
;-------------------------------------------------
(check-sat)
(get-model)