; Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

; Predicates (unary properties)
(declare-fun tump      (Entity) Bool)
(declare-fun bright    (Entity) Bool)
(declare-fun romp      (Entity) Bool)
(declare-fun earthy    (Entity) Bool)
(declare-fun dump      (Entity) Bool)
(declare-fun sweet     (Entity) Bool)
(declare-fun zump      (Entity) Bool)
(declare-fun luminous  (Entity) Bool)
(declare-fun imp       (Entity) Bool)
(declare-fun nump      (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun wump      (Entity) Bool)
(declare-fun red       (Entity) Bool)
(declare-fun yump      (Entity) Bool)
(declare-fun kind      (Entity) Bool)
(declare-fun jomp      (Entity) Bool)
(declare-fun shy       (Entity) Bool)
(declare-fun vump      (Entity) Bool)

; The individual mentioned in the problem
(declare-const Sam Entity)

; ---- Knowledge base ---------------------------------------------------------

; Tumpuses are bright.
(assert (forall ((x Entity)) (=> (tump x) (bright x))))

; Tumpuses are rompuses.
(assert (forall ((x Entity)) (=> (tump x) (romp x))))

; Rompuses are not earthy.
(assert (forall ((x Entity)) (=> (romp x) (not (earthy x)))))

; Every rompus is a dumpus.  (interpreted as "romp -> dump")
(assert (forall ((x Entity)) (=> (romp x) (dump x))))

; Every dumpus is sweet.
(assert (forall ((x Entity)) (=> (dump x) (sweet x))))

; Each dumpus is a zumpus.
(assert (forall ((x Entity)) (=> (dump x) (zump x))))

; Each zumpus is luminous.
(assert (forall ((x Entity)) (=> (zump x) (luminous x))))

; Zumpuses are impuses.
(assert (forall ((x Entity)) (=> (zump x) (imp x))))

; Every numpus is temperate.
(assert (forall ((x Entity)) (=> (nump x) (temperate x))))

; Impuses are not temperate.
(assert (forall ((x Entity)) (=> (imp x) (not (temperate x)))))

; Every impus is a wumpus.
(assert (forall ((x Entity)) (=> (imp x) (wump x))))

; Every wumpus is red.
(assert (forall ((x Entity)) (=> (wump x) (red x))))

; Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (wump x) (yump x))))

; Every yumpus is kind.
(assert (forall ((x Entity)) (=> (yump x) (kind x))))

; Every yumpus is a jompus.
(assert (forall ((x Entity)) (=> (yump x) (jomp x))))

; Every jompus is shy.
(assert (forall ((x Entity)) (=> (jomp x) (shy x))))

; Every jompus is a vumpus.
(assert (forall ((x Entity)) (=> (jomp x) (vump x))))

; Sam is a tumpus.
(assert (tump Sam))

; ---- Question to verify ----------------------------------------------------
; Is Sam not temperate?
(assert (not (temperate Sam)))

(check-sat)
(get-model)