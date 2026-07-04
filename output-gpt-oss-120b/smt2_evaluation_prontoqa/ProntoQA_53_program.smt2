; --- Sort ---------------------------------------------------------
(declare-sort Entity 0)

; --- Predicates ---------------------------------------------------
(declare-fun numpus   (Entity) Bool)
(declare-fun kind     (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun hot      (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun rompuse  (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun jompuse  (Entity) Bool)
(declare-fun dumpuse  (Entity) Bool)
(declare-fun earthy   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)

; --- Individual ---------------------------------------------------
(declare-const Fae Entity)

; --- Knowledge base -----------------------------------------------
; Numpuses are kind.
(assert (forall ((x Entity)) (=> (numpus x) (kind x))))

; Each numpus is a wumpus.
(assert (forall ((x Entity)) (=> (numpus x) (wumpus x))))

; Wumpuses are not wooden.
(assert (forall ((x Entity)) (=> (wumpus x) (not (wooden x)))))

; Every zumpus is not dull.
(assert (forall ((x Entity)) (=> (zumpus x) (not (dull x)))))

; Wumpuses are impuses.
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))

; Impuses are not nervous.
(assert (forall ((x Entity)) (=> (impus x) (not (nervous x)))))

; Each impus is a yumpus.
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))

; Every yumpus is hot.
(assert (forall ((x Entity)) (=> (yumpus x) (hot x))))

; Every yumpus is a vumpus.
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))

; Every vumpus is transparent.
(assert (forall ((x Entity)) (=> (vumpus x) (transparent x))))

; Vumpuses are rompuses.
(assert (forall ((x Entity)) (=> (vumpus x) (rompuse x))))

; Rompuses are not small.
(assert (forall ((x Entity)) (=> (rompuse x) (not (small x)))))

; Rompuses are jompuses.
(assert (forall ((x Entity)) (=> (rompuse x) (jompuse x))))

; Jompuses are dull.
(assert (forall ((x Entity)) (=> (jompuse x) (dull x))))

; Jompuses are dumpuses.
(assert (forall ((x Entity)) (=> (jompuse x) (dumpuse x))))

; Each dumpus is earthy.
(assert (forall ((x Entity)) (=> (dumpuse x) (earthy x))))

; Every dumpus is a tumpus.
(assert (forall ((x Entity)) (=> (dumpuse x) (tumpus x))))

; Fae is an impus.
(assert (impus Fae))

; --- Question to verify ------------------------------------------
; Is Fae dull?
(assert (dull Fae))

; --- Solve --------------------------------------------------------
(check-sat)
(get-model)