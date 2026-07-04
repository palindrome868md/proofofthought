;--- 1. Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicate declarations --------------------------------------------
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Angry    (Entity) Bool)
(declare-fun Rompuse  (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Bright   (Entity) Bool)
(declare-fun Luminous (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Bitter   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Red      (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Happy    (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Large    (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)

;--- 3. Constant declaration -----------------------------------------------
(declare-const Stella Entity)

;--- 4. Knowledge base (facts + universal rules) ---------------------------

; Every tumpus is not angry.
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Angry x)))))

; Tumpuses are rompuses.
(assert (forall ((x Entity)) (=> (Tumpus x) (Rompuse x))))

; Every numpus is not bright.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Bright x)))))

; Rompuses are not luminous.
(assert (forall ((x Entity)) (=> (Rompuse x) (not (Luminous x)))))

; Rompuses are yumpuses.
(assert (forall ((x Entity)) (=> (Rompuse x) (Yumpus x))))

; Yumpuses are transparent.
(assert (forall ((x Entity)) (=> (Yumpus x) (Transparent x))))

; Yumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (Yumpus x) (Zumpus x))))

; Each zumpus is not bitter.
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Bitter x)))))

; Zumpuses are impuses.
(assert (forall ((x Entity)) (=> (Zumpus x) (Impus x))))

; Impuses are red.
(assert (forall ((x Entity)) (=> (Impus x) (Red x))))

; Each impus is a dumpus.
(assert (forall ((x Entity)) (=> (Impus x) (Dumpus x))))

; Every dumpus is happy.
(assert (forall ((x Entity)) (=> (Dumpus x) (Happy x))))

; Each dumpus is a vumpus.
(assert (forall ((x Entity)) (=> (Dumpus x) (Vumpus x))))

; Vumpuses are bright.
(assert (forall ((x Entity)) (=> (Vumpus x) (Bright x))))

; Every vumpus is a jompus.
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))

; Jompuses are large.
(assert (forall ((x Entity)) (=> (Jompus x) (Large x))))

; Each jompus is a wumpus.
(assert (forall ((x Entity)) (=> (Jompus x) (Wumpus x))))

; Stella is a yumpus.
(assert (Yumpus Stella))

;--- 5. Test the statement -------------------------------------------------
; Is Stella bright?
(assert (Bright Stella))

;--- 6. Check satisfiability ------------------------------------------------
(check-sat)
(get-model)