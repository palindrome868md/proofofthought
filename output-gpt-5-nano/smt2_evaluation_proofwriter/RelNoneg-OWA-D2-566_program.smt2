; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const cat Entity)
(declare-const squirrel Entity)

; Declare predicates
(declare-fun likes (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun kind (Entity) Bool)

; Facts
(assert (likes cat squirrel))  ; The cat likes the squirrel
(assert (blue squirrel))        ; The squirrel is blue

; Rules (knowledge base)
(assert (forall ((x Entity))
  (=> (visits x cat)
      (visits cat squirrel))))  ; If something visits the cat, then the cat visits the squirrel

(assert (forall ((x Entity))
  (=> (and (visits x cat) (likes cat squirrel))
      (kind squirrel))))  ; If something visits the cat and the cat likes the squirrel, then the squirrel is kind

(assert (forall ((x Entity))
  (=> (and (likes x cat) (round cat))
      (visits cat squirrel))))  ; If something likes the cat and the cat is round, then the cat visits the squirrel

(assert (forall ((x Entity))
  (=> (sees x cat)
      (visits x cat))))  ; If something sees the cat, then it visits the cat

(assert (forall ((x Entity))
  (=> (and (kind x) (visits x cat))
      (likes cat squirrel))))  ; If something is kind and it visits the cat, then the cat likes the squirrel

(assert (forall ((x Entity))
  (=> (likes x squirrel)
      (sees x cat))))  ; If something likes the squirrel, then it sees the cat

; Test scenario: The cat likes the squirrel
(assert (likes cat squirrel))

; Check satisfiability and model
(check-sat)
(get-model)