; -------------------------------------------------
; 1. Declare the universe of discourse
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare predicates for every class/property
; -------------------------------------------------
(declare-fun numpus   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun rompuse  (Entity) Bool)

(declare-fun spicy    (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun floral   (Entity) Bool)
(declare-fun cold     (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun mean     (Entity) Bool)

; -------------------------------------------------
; 3. Declare the constant Wren
; -------------------------------------------------
(declare-const wren Entity)

; -------------------------------------------------
; 4. Knowledge base (facts and universal rules)
; -------------------------------------------------
; Numpuses are spicy.
(assert (forall ((x Entity))
          (=> (numpus x) (spicy x))))

; Dumpuses are not small.
(assert (forall ((x Entity))
          (=> (dumpus x) (not (small x)))))

; Each numpus is a yumpus.
(assert (forall ((x Entity))
          (=> (numpus x) (yumpus x))))

; Yumpuses are not opaque.
(assert (forall ((x Entity))
          (=> (yumpus x) (not (opaque x)))))

; Every yumpus is a wumpus.
(assert (forall ((x Entity))
          (=> (yumpus x) (wumpus x))))

; Wumpuses are floral.
(assert (forall ((x Entity))
          (=> (wumpus x) (floral x))))

; Each wumpus is a tumpus.
(assert (forall ((x Entity))
          (=> (wumpus x) (tumpus x))))

; Tumpuses are cold.
(assert (forall ((x Entity))
          (=> (tumpus x) (cold x))))

; Each tumpus is a vumpus.
(assert (forall ((x Entity))
          (=> (tumpus x) (vumpus x))))

; Vumpuses are not bright.
(assert (forall ((x Entity))
          (=> (vumpus x) (not (bright x)))))

; Each vumpus is an impus.
(assert (forall ((x Entity))
          (=> (vumpus x) (impus x))))

; Impuses are nervous.
(assert (forall ((x Entity))
          (=> (impus x) (nervous x))))

; Each impus is a jompus.
(assert (forall ((x Entity))
          (=> (impus x) (jompus x))))

; Jompuses are mean.
(assert (forall ((x Entity))
          (=> (jompus x) (mean x))))

; Jompuses are zumpuses.
(assert (forall ((x Entity))
          (=> (jompus x) (zumpus x))))

; Zumpuses are small.
(assert (forall ((x Entity))
          (=> (zumpus x) (small x))))

; Zumpuses are rompuses.
(assert (forall ((x Entity))
          (=> (zumpus x) (rompuse x))))

; -------------------------------------------------
; 5. Specific fact: Wren is a tumpus.
; -------------------------------------------------
(assert (tumpus wren))

; -------------------------------------------------
; 6. Query: “Wren is not small.”
; -------------------------------------------------
(assert (not (small wren)))

; -------------------------------------------------
; 7. Check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)