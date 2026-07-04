; ---------- Sort ----------
(declare-sort Entity 0)

; ---------- Predicates (unary) ----------
(declare-fun is-rompus (Entity) Bool)
(declare-fun transparent (Entity) Bool)

(declare-fun is-yumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)

(declare-fun is-jompus (Entity) Bool)
(declare-fun large (Entity) Bool)

(declare-fun is-wumpus (Entity) Bool)
(declare-fun brown (Entity) Bool)

(declare-fun is-tumpus (Entity) Bool)
(declare-fun hot (Entity) Bool)

(declare-fun is-zumpus (Entity) Bool)
(declare-fun dull (Entity) Bool)

(declare-fun is-numpus (Entity) Bool)
(declare-fun bitter (Entity) Bool)

(declare-fun is-dumpus (Entity) Bool)
(declare-fun shy (Entity) Bool)

(declare-fun is-impus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)

; ---------- Constant ----------
(declare-const Max Entity)

; ---------- Knowledge base ----------
; Rompuses are transparent.
(assert (forall ((x Entity))
  (=> (is-rompus x) (transparent x))))

; Every rompus is a yumpus.
(assert (forall ((x Entity))
  (=> (is-rompus x) (is-yumpus x))))

; Yumpuses are earthy.
(assert (forall ((x Entity))
  (=> (is-yumpus x) (earthy x))))

; Yumpuses are jompuses.
(assert (forall ((x Entity))
  (=> (is-yumpus x) (is-jompus x))))

; Every jompus is not large.
(assert (forall ((x Entity))
  (=> (is-jompus x) (not (large x)))))

; Each jompus is a wumpus.
(assert (forall ((x Entity))
  (=> (is-jompus x) (is-wumpus x))))

; Each wumpus is not brown.
(assert (forall ((x Entity))
  (=> (is-wumpus x) (not (brown x)))))

; Tumpuses are hot.
(assert (forall ((x Entity))
  (=> (is-tumpus x) (hot x))))

; Wumpuses are zumpuses.
(assert (forall ((x Entity))
  (=> (is-wumpus x) (is-zumpus x))))

; Every zumpus is dull.
(assert (forall ((x Entity))
  (=> (is-zumpus x) (dull x))))

; Zumpuses are numpuses.
(assert (forall ((x Entity))
  (=> (is-zumpus x) (is-numpus x))))

; Numpuses are bitter.
(assert (forall ((x Entity))
  (=> (is-numpus x) (bitter x))))

; Every numpus is a dumpus.
(assert (forall ((x Entity))
  (=> (is-numpus x) (is-dumpus x))))

; Dumpuses are not shy.
(assert (forall ((x Entity))
  (=> (is-dumpus x) (not (shy x)))))

; Each dumpus is an impus.
(assert (forall ((x Entity))
  (=> (is-dumpus x) (is-impus x))))

; Impuses are not hot.
(assert (forall ((x Entity))
  (=> (is-impus x) (not (hot x)))))

; Impuses are vumpuses.
(assert (forall ((x Entity))
  (=> (is-impus x) (is-vumpus x))))

; Fact: Max is a wumpus.
(assert (is-wumpus Max))

; ---------- Test the statement ----------
; Is "Max is not hot" true?
(assert (not (hot Max)))

; ---------- Solve ----------
(check-sat)
(get-model)