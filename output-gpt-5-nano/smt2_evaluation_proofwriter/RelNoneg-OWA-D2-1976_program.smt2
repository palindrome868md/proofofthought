; Sorts and constants
(declare-sort Entity 0)
(declare-const cat Entity)
(declare-const squirrel Entity)

; Predicates
(declare-fun sees (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun round (Entity) Bool)

; Knowledge base
(assert (sees cat squirrel))          ; The cat sees the squirrel
(assert (sees squirrel cat))          ; The squirrel sees the cat
(assert (young cat))                   ; The cat is young

; Rules
; 1) If someone visits the cat and the cat is young then they eat the squirrel
(assert (forall ((p Entity))
  (=> (and (visits p cat) (young cat))
      (eats p squirrel))))

; 2) If someone eats the squirrel and the squirrel sees the cat then the squirrel is round
(assert (forall ((p Entity))
  (=> (and (eats p squirrel) (sees squirrel cat))
      (round squirrel))))

; 3) If someone sees the cat and the cat sees the squirrel then they eat the squirrel
(assert (forall ((p Entity))
  (=> (and (sees p cat) (sees cat squirrel))
      (eats p squirrel))))

; Test: The squirrel eats the squirrel
(assert (eats squirrel squirrel))

; Check satisfiability and model
(check-sat)
(get-model)