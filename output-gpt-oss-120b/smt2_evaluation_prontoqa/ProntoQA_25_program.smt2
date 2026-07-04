;--- 1. Declare the domain (uninterpreted sort) -----------------
(declare-sort Entity 0)

;--- 2. Declare class predicates ---------------------------------
(declare-fun is-Zumpus  (Entity) Bool)
(declare-fun is-Vumpus  (Entity) Bool)
(declare-fun is-Numpus  (Entity) Bool)
(declare-fun is-Wumpus  (Entity) Bool)
(declare-fun is-Tumpus  (Entity) Bool)
(declare-fun is-Rompus  (Entity) Bool)
(declare-fun is-Yumpus  (Entity) Bool)
(declare-fun is-Impus   (Entity) Bool)
(declare-fun is-Jompus  (Entity) Bool)
(declare-fun is-Dumpus  (Entity) Bool)

;--- 3. Declare property predicates -------------------------------
(declare-fun dull        (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun blue        (Entity) Bool)
(declare-fun liquid      (Entity) Bool)
(declare-fun spicy       (Entity) Bool)
(declare-fun floral      (Entity) Bool)
(declare-fun hot         (Entity) Bool)
(declare-fun large       (Entity) Bool)

;--- 4. Declare the individual -----------------------------------
(declare-const Sam Entity)

;--- 5. Knowledge base -------------------------------------------

; Zumpuses are dull.
(assert (forall ((x Entity))
  (=> (is-Zumpus x) (dull x))))

; Every vumpus is not transparent.
(assert (forall ((x Entity))
  (=> (is-Vumpus x) (not (transparent x)))))

; Vumpuses are numpuses.
(assert (forall ((x Entity))
  (=> (is-Vumpus x) (is-Numpus x))))

; Numpuses are blue.
(assert (forall ((x Entity))
  (=> (is-Numpus x) (blue x))))

; Numpuses are wumpuses.
(assert (forall ((x Entity))
  (=> (is-Numpus x) (is-Wumpus x))))

; Wumpuses are liquid.
(assert (forall ((x Entity))
  (=> (is-Wumpus x) (liquid x))))

; Each wumpus is a tumpus.
(assert (forall ((x Entity))
  (=> (is-Wumpus x) (is-Tumpus x))))

; Tumpuses are not spicy.
(assert (forall ((x Entity))
  (=> (is-Tumpus x) (not (spicy x)))))

; Tumpuses are rompuses.
(assert (forall ((x Entity))
  (=> (is-Tumpus x) (is-Rompus x))))

; Each rompus is not dull.
(assert (forall ((x Entity))
  (=> (is-Rompus x) (not (dull x)))))

; Rompuses are yumpuses.
(assert (forall ((x Entity))
  (=> (is-Rompus x) (is-Yumpus x))))

; Every yumpus is floral.
(assert (forall ((x Entity))
  (=> (is-Yumpus x) (floral x))))

; Every yumpus is an impus.
(assert (forall ((x Entity))
  (=> (is-Yumpus x) (is-Impus x))))

; Impuses are hot.
(assert (forall ((x Entity))
  (=> (is-Impus x) (hot x))))

; Each impus is a jompus.
(assert (forall ((x Entity))
  (=> (is-Impus x) (is-Jompus x))))

; Every jompus is large.
(assert (forall ((x Entity))
  (=> (is-Jompus x) (large x))))

; Jompuses are dumpuses.
(assert (forall ((x Entity))
  (=> (is-Jompus x) (is-Dumpus x))))

; Sam is a vumpus.
(assert (is-Vumpus Sam))

;--- 6. Test the statement: "Sam is not dull" -------------------
(assert (not (dull Sam)))   ; i.e., Sam is not dull

;--- 7. Check satisfiability ------------------------------------
(check-sat)
(get-model)