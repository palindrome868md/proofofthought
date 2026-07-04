; -------------------------------------------------
; Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate (unary function) declarations
; -------------------------------------------------
(declare-fun numpus   (Entity) Bool)
(declare-fun floral   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun brown    (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun bitter   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun hot      (Entity) Bool)
(declare-fun rompuse  (Entity) Bool)   ; “rompuses”
(declare-fun rompus   (Entity) Bool)   ; separate class mentioned once
(declare-fun tumpus   (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)

; -------------------------------------------------
; Constant declaration
; -------------------------------------------------
(declare-const Alex Entity)

; -------------------------------------------------
; Knowledge‑base assertions (universal rules)
; -------------------------------------------------
; 1. Every numpus is floral.
(assert (forall ((x Entity)) (=> (numpus x) (floral x))))

; 2. Numpuses are jompuses.
(assert (forall ((x Entity)) (=> (numpus x) (jompus x))))

; 3. Jompuses are not nervous.
(assert (forall ((x Entity)) (=> (jompus x) (not (nervous x)))))

; 4. Each jompus is an impus.
(assert (forall ((x Entity)) (=> (jompus x) (impus x))))

; 5. Every impus is brown.
(assert (forall ((x Entity)) (=> (impus x) (brown x))))

; 6. Every dumpus is not amenable.
(assert (forall ((x Entity)) (=> (dumpus x) (not (amenable x)))))

; 7. Each impus is a wumpus.
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))

; 8. Wumpuses are not bitter.
(assert (forall ((x Entity)) (=> (wumpus x) (not (bitter x)))))

; 9. Each wumpus is a zumpus.
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))

;10. Every zumpus is not small.
(assert (forall ((x Entity)) (=> (zumpus x) (not (small x)))))

;11. Zumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))

;12. Vumpuses are hot.
(assert (forall ((x Entity)) (=> (vumpus x) (hot x))))

;13. Vumpuses are rompuses.
(assert (forall ((x Entity)) (=> (vumpus x) (rompuse x))))

;14. Rompuses are amenable.
(assert (forall ((x Entity)) (=> (rompuse x) (amenable x))))

;15. Every rompus is a tumpus.
(assert (forall ((x Entity)) (=> (rompus x) (tumpus x))))

;16. Every tumpus is bright.
(assert (forall ((x Entity)) (=> (tumpus x) (bright x))))

;17. Every tumpus is a yumpus.
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

; -------------------------------------------------
; Specific fact about Alex
; -------------------------------------------------
(assert (impus Alex))

; -------------------------------------------------
; Test the statement: "Alex is amenable."
; -------------------------------------------------
(assert (amenable Alex))

; -------------------------------------------------
; Check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)