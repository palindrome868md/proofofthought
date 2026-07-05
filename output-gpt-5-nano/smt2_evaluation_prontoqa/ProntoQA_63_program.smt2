; Sort
(declare-sort Creature 0)

; Predicates (unary)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)

; Additional predicates used in rules
(declare-fun is-mean (Creature) Bool)
(declare-fun is-brown (Creature) Bool)
(declare-fun is-cold (Creature) Bool)
(declare-fun is-happy (Creature) Bool)
(declare-fun is-liquid (Creature) Bool)
(declare-fun is-dull (Creature) Bool)
(declare-fun is-fruity (Creature) Bool)
(declare-fun is-spicy (Creature) Bool)

; Constants
(declare-const rex Creature)

; Knowledge base (as in the problem statement)

; Numpuses are not mean
(assert (forall ((c Creature)) (=> (is-numpus c) (not (is-mean c)))))

; Each zumpus is not brown
(assert (forall ((c Creature)) (=> (is-zumpus c) (not (is-brown c)))))

; Numpuses are rompuses
(assert (forall ((c Creature)) (=> (is-numpus c) (is-rompus c))))

; Every rompus is not cold
(assert (forall ((c Creature)) (=> (is-rompus c) (not (is-cold c)))))

; Rompuses are vumpuses
(assert (forall ((c Creature)) (=> (is-rompus c) (is-vumpus c))))

; Vumpuses are not happy
(assert (forall ((c Creature)) (=> (is-vumpus c) (not (is-happy c)))))

; Every vumpus is an impus
(assert (forall ((c Creature)) (=> (is-vumpus c) (is-impus c))))

; Each impus is liquid
(assert (forall ((c Creature)) (=> (is-impus c) (is-liquid c))))

; Impuses are jompuses
(assert (forall ((c Creature)) (=> (is-impus c) (is-jompus c))))

; Jompuses are dull
(assert (forall ((c Creature)) (=> (is-jompus c) (is-dull c))))

; Every jompus is a tumpus
(assert (forall ((c Creature)) (=> (is-jompus c) (is-tumpus c))))

; Every tumpus is spicy
(assert (forall ((c Creature)) (=> (is-tumpus c) (is-spicy c))))

; Tumpuses are yumpuses
(assert (forall ((c Creature)) (=> (is-tumpus c) (is-yumpus c))))

; Every yumpus is fruity
(assert (forall ((c Creature)) (=> (is-yumpus c) (is-fruity c))))

; Each yumpus is a wumpus
(assert (forall ((c Creature)) (=> (is-yumpus c) (is-wumpus c))))

; Wumpuses are brown
(assert (forall ((c Creature)) (=> (is-wumpus c) (is-brown c))))

; Wumpuses are dumpuses
(assert (forall ((c Creature)) (=> (is-wumpus c) (is-dumpus c))))

; Rex is an impus
(assert (is-impus rex))

; Query: Is Rex brown?
(assert (is-brown rex))

; Check satisfiability and get a model
(check-sat)
(get-model)