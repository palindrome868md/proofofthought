; Domain: Fruits
(declare-sort Fruit 0)

; Predicates
(declare-fun red (Fruit) Bool)
(declare-fun growsben (Fruit) Bool)
(declare-fun vitamin_c (Fruit) Bool)
(declare-fun is_apple (Fruit) Bool)
(declare-fun healthy (Fruit) Bool)
(declare-fun on_warning (Fruit) Bool)

; Constant
(declare-const cherry Fruit)

; Premises (Knowledge Base)
; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((f Fruit))
  (=> (and (red f) (growsben f)) (vitamin_c f))))
; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((f Fruit))
  (=> (and (is_apple f) (growsben f)) (red f))))
; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((f Fruit))
  (=> (and (growsben f) (vitamin_c f)) (healthy f))))
; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((f Fruit))
  (=> (and (growsben f) (healthy f)) (not (on_warning f)))))
; 5. The cherries grow in Ben's yard.
(assert (growsben cherry))
; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (is_apple cherry)) (not (healthy cherry)))
            (red cherry)))

; Negation of the statement to test: (healthy cherry OR on_warning cherry) AND red cherry
; If this is satisfiable together with the knowledge base, the statement is not entailed.
(assert (and (or (healthy cherry) (on_warning cherry)) (red cherry)))

; Single query: check satisfiability
(check-sat)
(get-model)