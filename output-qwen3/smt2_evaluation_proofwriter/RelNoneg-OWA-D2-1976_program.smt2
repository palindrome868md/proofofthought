; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions
(declare-fun sees (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun is_young (Entity) Bool)
(declare-fun is_round (Entity) Bool)

; 3. Declare constants
(declare-const cat Entity)
(declare-const squirrel Entity)

; 4. Assert knowledge base (facts)
; The cat sees the squirrel.
(assert (sees cat squirrel))
; The squirrel sees the cat.
(assert (sees squirrel cat))

; 5. Assert knowledge base (rules)
; If someone visits the cat and the cat is young then they eat the squirrel.
(assert (forall ((x Entity))
  (=> (and (visits x cat) (is_young cat))
      (eats x squirrel))))

; If someone eats the squirrel and the squirrel sees the cat then the squirrel is round.
(assert (forall ((x Entity))
  (=> (and (eats x squirrel) (sees squirrel cat))
      (is_round squirrel))))

; If someone sees the cat and the cat sees the squirrel then they eat the squirrel.
(assert (forall ((x Entity))
  (=> (and (sees x cat) (sees cat squirrel))
      (eats x squirrel))))

; 6. Test: The squirrel eats the squirrel.
; We assert the statement to check if it is consistent/entailed by the KB.
(assert (eats squirrel squirrel))

; 7. Check satisfiability
; Expected: sat (True), because the third rule combined with the facts entails this.
(check-sat)
(get-model)