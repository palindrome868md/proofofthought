; Domain sort
(declare-sort Obj 0)

; Predicates (unary)
(declare-fun is-tumpus (Obj) Bool)
(declare-fun is-vumpus (Obj) Bool)
(declare-fun is-rompus (Obj) Bool)
(declare-fun is-dumpus (Obj) Bool)
(declare-fun is-yumpus (Obj) Bool)
(declare-fun is-jompus (Obj) Bool)
(declare-fun is-numpus (Obj) Bool)
(declare-fun is-impus (Obj) Bool)
(declare-fun is-wumpus (Obj) Bool)
(declare-fun is-zumpus (Obj) Bool)

; Additional predicates used in rules
(declare-fun is-blue (Obj) Bool)
(declare-fun is-transparent (Obj) Bool)
(declare-fun is-fruity (Obj) Bool)
(declare-fun is-nervous (Obj) Bool)
(declare-fun is-liquid (Obj) Bool)
(declare-fun is-cold (Obj) Bool)
(declare-fun is-large (Obj) Bool)
(declare-fun is-aggressive (Obj) Bool)

; Constant
(declare-const wren Obj)

; Knowledge base (universal rules)
(assert (forall ((x Obj))
  (=> (is-tumpus x) (not (is-blue x)))))

(assert (forall ((x Obj))
  (=> (is-vumpus x) (is-rompus x))))

(assert (forall ((x Obj))
  (=> (is-vumpus x) (not (is-transparent x)))))

(assert (forall ((x Obj))
  (=> (is-rompus x) (not (is-fruity x)))))

(assert (forall ((x Obj))
  (=> (is-rompus x) (is-dumpus x))))

(assert (forall ((x Obj))
  (=> (is-dumpus x) (not (is-nervous x)))))

(assert (forall ((x Obj))
  (=> (is-dumpus x) (is-yumpus x))))

(assert (forall ((x Obj))
  (=> (is-yumpus x) (not (is-liquid x)))))

(assert (forall ((x Obj))
  (=> (is-yumpus x) (is-jompus x))))

(assert (forall ((x Obj))
  (=> (is-jompus x) (not (is-cold x)))))

(assert (forall ((x Obj))
  (=> (is-zumpus x) (is-cold x))))

(assert (forall ((x Obj))
  (=> (is-jompus x) (is-numpus x))))

(assert (forall ((x Obj))
  (=> (is-numpus x) (is-large x))))

(assert (forall ((x Obj))
  (=> (is-numpus x) (is-impus x))))

(assert (forall ((x Obj))
  (=> (is-impus x) (is-aggressive x))))

(assert (forall ((x Obj))
  (=> (is-impus x) (is-wumpus x))))

; Facts
(assert (is-vumpus wren))

; Test: Is "Wren is not cold" true given the knowledge base?
(assert (not (is-cold wren)))

; Check satisfiability and provide a model
(check-sat)
(get-model)