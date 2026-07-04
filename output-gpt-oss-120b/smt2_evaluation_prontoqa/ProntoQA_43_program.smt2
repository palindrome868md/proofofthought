; -------------------------------------------------
; 1. Declare the (uninterpreted) sort for all beings
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare the individual Polly
; -------------------------------------------------
(declare-const polly Entity)

; -------------------------------------------------
; 3. Declare all unary predicates (properties / classes)
; -------------------------------------------------
(declare-fun impus   (Entity) Bool)
(declare-fun luminous(Entity) Bool)
(declare-fun zumpus  (Entity) Bool)
(declare-fun shy     (Entity) Bool)
(declare-fun numpus  (Entity) Bool)
(declare-fun cold    (Entity) Bool)
(declare-fun tumpus  (Entity) Bool)
(declare-fun large   (Entity) Bool)
(declare-fun yumpus  (Entity) Bool)
(declare-fun angry   (Entity) Bool)
(declare-fun vumpus  (Entity) Bool)
(declare-fun earthy  (Entity) Bool)
(declare-fun jompus  (Entity) Bool)
(declare-fun sour    (Entity) Bool)
(declare-fun dumpus  (Entity) Bool)
(declare-fun rompuse (Entity) Bool)
(declare-fun opaque  (Entity) Bool)
(declare-fun wumpus  (Entity) Bool)

; -------------------------------------------------
; 4. Knowledge base (facts and universal rules)
; -------------------------------------------------

; Fact: Polly is an impus
(assert (impus polly))

; 1. Each impus is luminous.
(assert (forall ((x Entity))
        (=> (impus x) (luminous x))))

; 2. Every impus is a zumpus.
(assert (forall ((x Entity))
        (=> (impus x) (zumpus x))))

; 3. Every zumpus is shy.
(assert (forall ((x Entity))
        (=> (zumpus x) (shy x))))

; 4. Every zumpus is a numpus.
(assert (forall ((x Entity))
        (=> (zumpus x) (numpus x))))

; 5. Numpuses are not cold.
(assert (forall ((x Entity))
        (=> (numpus x) (not (cold x)))))

; 6. Each numpus is a tumpus.
(assert (forall ((x Entity))
        (=> (numpus x) (tumpus x))))

; 7. Tumpuses are large.
(assert (forall ((x Entity))
        (=> (tumpus x) (large x))))

; 8. Each tumpus is a yumpus.
(assert (forall ((x Entity))
        (=> (tumpus x) (yumpus x))))

; 9. Each yumpus is angry.
(assert (forall ((x Entity))
        (=> (yumpus x) (angry x))))

; 10. Yumpuses are vumpuses.
(assert (forall ((x Entity))
        (=> (yumpus x) (vumpus x))))

; 11. Vumpuses are not earthy.
(assert (forall ((x Entity))
        (=> (vumpus x) (not (earthy x)))))

; 12. Vumpuses are jompuses.
(assert (forall ((x Entity))
        (=> (vumpus x) (jompus x))))

; 13. Every jompus is not sour.
(assert (forall ((x Entity))
        (=> (jompus x) (not (sour x)))))

; 14. Dumpuses are not angry.
(assert (forall ((x Entity))
        (=> (dumpus x) (not (angry x)))))

; 15. Jompuses are rompuses.
(assert (forall ((x Entity))
        (=> (jompus x) (rompuse x))))

; 16. Rompuses are not opaque.
(assert (forall ((x Entity))
        (=> (rompuse x) (not (opaque x)))))

; 17. Rompuses are wumpuses.
(assert (forall ((x Entity))
        (=> (rompuse x) (wumpus x))))

; -------------------------------------------------
; 5. Test the query: "Polly is angry."
; -------------------------------------------------
(assert (angry polly))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)