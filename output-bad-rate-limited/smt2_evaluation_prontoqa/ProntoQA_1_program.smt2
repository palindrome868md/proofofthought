; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)

(declare-fun shy (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun aggressive (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun rompuses (Entity) Bool)

; Constants
(declare-const max Entity)

; Knowledge base / Rules

; Jompuses are not shy.
(assert (forall ((x Entity))
  (=> (is-jompus x) (not (shy x)))))

; Jompuses are yumpuses.
(assert (forall ((x Entity))
  (=> (is-jompus x) (is-yumpus x))))

; Each yumpus is aggressive.
(assert (forall ((x Entity))
  (=> (is-yumpus x) (aggressive x))))

; Each yumpus is a dumpus.
(assert (forall ((x Entity))
  (=> (is-yumpus x) (is-dumpus x))))

; Dumpuses are not wooden.
(assert (forall ((x Entity))
  (=> (is-dumpus x) (not (wooden x)))))

; Dumpuses are wumpuses.
(assert (forall ((x Entity))
  (=> (is-dumpus x) (is-wumpus x))))

; Wumpuses are red.
(assert (forall ((x Entity))
  (=> (is-wumpus x) (red x))))

; Every wumpus is an impus.
(assert (forall ((x Entity))
  (=> (is-wumpus x) (is-impus x))))

; Each impus is opaque.
(assert (forall ((x Entity))
  (=> (is-impus x) (opaque x))))

; Impuses are tumpuses.
(assert (forall ((x Entity))
  (=> (is-impus x) (is-tumpus x))))

; Numpuses are sour. (provided for completeness; not used to derive max)
(assert (forall ((x Entity))
  (=> (is-numpus x) (sour x))))

; Tumpuses are not sour.
(assert (forall ((x Entity))
  (=> (is-tumpus x) (not (sour x)))))

; Tumpuses are vumpuses.
(assert (forall ((x Entity))
  (=> (is-tumpus x) (is-vumpus x))))

; Vumpuses are earthy.
(assert (forall ((x Entity))
  (=> (is-vumpus x) (earthy x))))

; Every vumpus is a zumpus.
(assert (forall ((x Entity))
  (=> (is-vumpus x) (is-zumpus x))))

; Zumpuses are small.
(assert (forall ((x Entity))
  (=> (is-zumpus x) (small x))))

; Zumpuses are rompuses.
(assert (forall ((x Entity))
  (=> (is-zumpus x) (rompuses x))))

; Max is a yumpus.
(assert (is-yumpus max))

; Question: Is "Max is sour" true or false?
; Test: Does Max being sour lead to a contradiction?
(assert (sour max))

; Check satisfiability
(check-sat)