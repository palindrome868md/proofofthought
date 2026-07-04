; 1. Declare sorts
(declare-sort Object 0)

; 2. Declare functions
(declare-fun likes (Object Object) Bool)
(declare-fun blue (Object) Bool)
(declare-fun visits (Object Object) Bool)
(declare-fun kind (Object) Bool)
(declare-fun round (Object) Bool)
(declare-fun sees (Object Object) Bool)

; 3. Declare constants
(declare-const cat Object)
(declare-const squirrel Object)

; 4. Assert knowledge base (facts and rules from text)
; Fact: The cat likes the squirrel
(assert (likes cat squirrel))
; Fact: The squirrel is blue
(assert (blue squirrel))
; Rule: If something visits the cat and the cat likes the squirrel then the squirrel is kind
(assert (forall ((x Object))
  (=> (and (visits x cat) (likes cat squirrel))
      (kind squirrel))))
; Rule: If something visits the cat then the cat visits the squirrel
(assert (forall ((x Object))
  (=> (visits x cat)
      (visits cat squirrel))))
; Rule: If something likes the cat and the cat is round then the cat visits the squirrel
(assert (forall ((x Object))
  (=> (and (likes x cat) (round cat))
      (visits cat squirrel))))
; Rule: If something sees the cat then it visits the cat
(assert (forall ((x Object))
  (=> (sees x cat)
      (visits x cat))))
; Rule: If something is kind and it visits the cat then the cat likes the squirrel
(assert (forall ((x Object))
  (=> (and (kind x) (visits x cat))
      (likes cat squirrel))))
; Rule: If something likes the squirrel then it sees the cat
(assert (forall ((x Object))
  (=> (likes x squirrel)
      (sees x cat))))

; 5. Test: The cat likes the squirrel
(assert (likes cat squirrel))

; 6. Check satisfiability
(check-sat)
(get-model)