; Domain
(declare-sort Thing 0)

; Predicates (unary)
(declare-fun is-impuse   (Thing) Bool)
(declare-fun is-fruity    (Thing) Bool)
(declare-fun is-wumpuse   (Thing) Bool)
(declare-fun is-dumpuse   (Thing) Bool)
(declare-fun is-zumpuse   (Thing) Bool)
(declare-fun is-vumpuse   (Thing) Bool)
(declare-fun is-yumpuse   (Thing) Bool)
(declare-fun is-numpuse   (Thing) Bool)
(declare-fun is-tumpuse   (Thing) Bool)
(declare-fun is-sweet      (Thing) Bool)
(declare-fun is-jompuse    (Thing) Bool)
(declare-fun is-wooden     (Thing) Bool)
(declare-fun is-large       (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-brown       (Thing) Bool)
(declare-fun is-kind        (Thing) Bool)
(declare-fun is-temperate   (Thing) Bool)
(declare-fun is-rompuse     (Thing) Bool)

; Constants
(declare-const Wren Thing)

; Knowledge base (facts and rules)

; 1) Impuses are not fruity.
(assert (forall ((x Thing))
  (=> (is-impuse x) (not (is-fruity x)))))

; 2) Impuses are wumpuses.
(assert (forall ((x Thing))
  (=> (is-impuse x) (is-wumpuse x))))

; 3) Each wumpus is not temperate.
(assert (forall ((x Thing))
  (=> (is-wumpuse x) (not (is-temperate x)))))

; 4) Wumpuses are dumpuses.
(assert (forall ((x Thing))
  (=> (is-wumpuse x) (is-dumpuse x))))

; 5) Rompuses are not sweet.
(assert (forall ((x Thing))
  (=> (is-rompuse x) (not (is-sweet x)))))

; 6) Dumpuses are kind.
(assert (forall ((x Thing))
  (=> (is-dumpuse x) (is-kind x))))

; 7) Dumpuses are zumpuses.
(assert (forall ((x Thing))
  (=> (is-dumpuse x) (is-zumpuse x))))

; 8) Zumpuses are wooden.
(assert (forall ((x Thing))
  (=> (is-zumpuse x) (is-wooden x))))

; 9) Zumpuses are vumpuses.
(assert (forall ((x Thing))
  (=> (is-zumpuse x) (is-vumpuse x))))

; 10) Every vumpus is large.
(assert (forall ((x Thing))
  (=> (is-vumpuse x) (is-large x))))

; 11) Vumpuses are yumpuses.
(assert (forall ((x Thing))
  (=> (is-vumpuse x) (is-yumpuse x))))

; 12) Yumpuses are transparent.
(assert (forall ((x Thing))
  (=> (is-yumpuse x) (is-transparent x))))

; 13) Yumpuses are numpuses.
(assert (forall ((x Thing))
  (=> (is-yumpuse x) (is-numpuse x))))

; 14) Numpuses are brown.
(assert (forall ((x Thing))
  (=> (is-numpuse x) (is-brown x))))

; 15) Numpuses are tumpuses.
(assert (forall ((x Thing))
  (=> (is-numpuse x) (is-tumpuse x))))

; 16) Tumpuses are sweet.
(assert (forall ((x Thing))
  (=> (is-tumpuse x) (is-sweet x))))

; 17) Tumpuses are jompuses.
(assert (forall ((x Thing))
  (=> (is-tumpuse x) (is-jompuse x))))

; 18) Wren is a zumpus.
(assert (is-zumpuse Wren))

; 19) Test: Is Wren sweet?
; Assertion of the query itself
(assert (is-sweet Wren))

; Verification: check satisfiability of the knowledge base plus the query
(check-sat)
(get-model)