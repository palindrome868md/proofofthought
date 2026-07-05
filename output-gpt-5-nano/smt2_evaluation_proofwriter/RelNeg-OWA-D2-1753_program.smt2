; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const bear Entity)
(declare-const cat Entity)
(declare-const rabbit Entity)
(declare-const squirrel Entity)

; Predicates / properties
(declare-fun eats (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun nice (Entity) Bool)

; Facts
(assert (eats bear cat))
(assert (sees bear cat))
(assert (eats cat bear))
(assert (red cat))
(assert (sees cat rabbit))
(assert (eats rabbit squirrel))
(assert (sees rabbit squirrel))
(assert (eats squirrel bear))
(assert (eats squirrel cat))
(assert (visits squirrel rabbit))

; Rules
; 1. If something sees the cat then the cat visits the squirrel.
(assert (forall ((x Entity))
  (=> (sees x cat)
      (visits cat squirrel))))

; 2. If something eats the squirrel and the squirrel is green then the squirrel does not visit the cat.
(assert (forall ((x Entity))
  (=> (and (eats x squirrel) (green squirrel))
      (not (visits squirrel cat)))))

; 3. If something is nice and it eats the squirrel then the squirrel visits the cat.
(assert (forall ((x Entity))
  (=> (and (nice x) (eats x squirrel))
      (visits squirrel cat))))

; 4. If something is red and it visits the squirrel then it eats the cat.
(assert (forall ((x Entity))
  (=> (and (red x) (visits x squirrel))
      (eats x cat))))

; 5. If the rabbit is not green and the rabbit does not see the bear then the rabbit visits the squirrel.
(assert (forall ((r Entity))
  (=> (and (not (green rabbit)) (not (sees rabbit bear)))
      (visits rabbit squirrel))))

; 6. If something visits the bear then the bear eats the rabbit.
(assert (forall ((x Entity))
  (=> (visits x bear)
      (eats bear rabbit))))

; 7. If the squirrel does not eat the rabbit then the rabbit visits the cat.
(assert (forall ((x Entity))
  (=> (not (eats squirrel rabbit))
      (visits rabbit cat))))

; 8. If something visits the cat and it sees the squirrel then the cat does not eat the bear.
(assert (forall ((x Entity))
  (=> (and (visits x cat) (sees x squirrel))
      (not (eats cat bear)))))

; Test: Does the cat visit the squirrel?
(assert (visits cat squirrel))

; Query: Check satisfiability of the knowledge base with the test assertion
(check-sat)