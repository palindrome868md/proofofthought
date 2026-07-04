; Sorts
(declare-sort Creature 0)

; Constants
(declare-const Max Creature)

; Predicates (unary relations)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-amenable (Creature) Bool)
(declare-fun is-metallic (Creature) Bool)
(declare-fun is-large (Creature) Bool)
(declare-fun is-cold (Creature) Bool)
(declare-fun is-fruity (Creature) Bool)

; Knowledge base (as per the problem, translated to SMT-LIB)
; Max is an impus
(assert (is-impus Max))

; Universal rules (translated as implications over all creatures)
(assert (forall ((x Creature))
  (=> (is-impus x) (is-tumpus x))))
(assert (forall ((x Creature))
  (=> (is-tumpus x) (not (is-amenable x)))))
(assert (forall ((x Creature))
  (=> (is-tumpus x) (is-yumpus x))))
(assert (forall ((x Creature))
  (=> (is-yumpus x) (not (is-metallic x)))))
(assert (forall ((x Creature))
  (=> (is-yumpus x) (is-numpus x))))
(assert (forall ((x Creature))
  (=> (is-numpus x) (is-large x))))
(assert (forall ((x Creature))
  (=> (is-numpus x) (is-rompus x))))
(assert (forall ((x Creature))
  (=> (is-rompus x) (is-cold x))))
(assert (forall ((x Creature))
  (=> (is-rompus x) (is-zumpus x))))
(assert (forall ((x Creature))
  (=> (is-dumpus x) (not (is-cold x)))))

; Optional: some background predicates that could be relevant
(assert (forall ((x Creature))
  (=> (is-impus x) (is-tumpus x)))) ; repeated for clarity
(assert (forall ((x Creature))
  (=> (is-tumpus x) (not (is-amenable x))))) ; repeated for clarity

; Test: Is Max not cold?
(assert (not (is-cold Max)))

; Check whether the knowledge base + test is satisfiable
(check-sat)