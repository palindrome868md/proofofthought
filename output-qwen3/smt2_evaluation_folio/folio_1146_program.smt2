; Declare sorts
(declare-sort Fruit 0)

; Declare functions/predicates
(declare-fun in-yard (Fruit) Bool)
(declare-fun is-red (Fruit) Bool)
(declare-fun has-vitamin-c (Fruit) Bool)
(declare-fun is-apple (Fruit) Bool)
(declare-fun is-healthy (Fruit) Bool)
(declare-fun on-warning-list (Fruit) Bool)

; Declare constant for cherries
(declare-const cherries Fruit)

; Premise 1: All red fruits in Ben's yard contain Vitamin C
(assert (forall ((f Fruit))
  (=> (and (is-red f) (in-yard f))
      (has-vitamin-c f))))

; Premise 2: All apples in Ben's yard are red fruits
(assert (forall ((f Fruit))
  (=> (and (is-apple f) (in-yard f))
      (is-red f))))

; Premise 3: All fruits in Ben's yard with Vitamin C are healthy
(assert (forall ((f Fruit))
  (=> (and (in-yard f) (has-vitamin-c f))
      (is-healthy f))))

; Premise 4: No healthy fruits in Ben's yard are on warning list
(assert (forall ((f Fruit))
  (=> (and (in-yard f) (is-healthy f))
      (not (on-warning-list f)))))

; Premise 5: Cherries grow in Ben's yard
(assert (in-yard cherries))

; Premise 6: If cherries are not apples and not healthy, then they are red fruits
(assert (=> (and (not (is-apple cherries)) (not (is-healthy cherries)))
            (is-red cherries)))

; Statement to test: If cherries are on warning list or red, then not healthy and no vitamin C
; To verify truth value: assert premises + antecedent + negation of consequent
; Antecedent: (on-warning-list OR is-red)
; Consequent: (NOT is-healthy AND NOT has-vitamin-c)
; Negation of consequent: (is-healthy OR has-vitamin-c)
; If sat = statement is FALSE (counterexample exists)
; If unsat = statement is TRUE (no counterexample possible)
(assert (or (on-warning-list cherries) (is-red cherries)))
(assert (or (is-healthy cherries) (has-vitamin-c cherries)))

; Check satisfiability
(check-sat)
(get-model)