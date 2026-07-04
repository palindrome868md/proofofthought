; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare constants
(declare-const bald-eagle Entity)
(declare-const cat Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)

; 3. Declare functions
(declare-fun sees (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun visit (Entity Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-rough (Entity) Bool)

; 4. Assert knowledge base (facts)
; The bald eagle sees the cat.
(assert (sees bald-eagle cat))
; The cat sees the bald eagle.
(assert (sees cat bald-eagle))
; The mouse does not eat the cat.
(assert (not (eats mouse cat)))
; The rabbit does not see the mouse.
(assert (not (sees rabbit mouse)))

; 5. Assert knowledge base (rules)
; If someone is red then they do not eat the bald eagle.
(assert (forall ((x Entity))
  (=> (is-red x) (not (eats x bald-eagle)))))

; If someone sees the bald eagle and the bald eagle does not see the rabbit then they eat the cat.
(assert (forall ((x Entity))
  (=> (and (sees x bald-eagle) (not (sees bald-eagle rabbit)))
      (eats x cat))))

; If the mouse is not rough then the mouse does not eat the cat.
(assert (=> (not (is-rough mouse)) (not (eats mouse cat))))

; If someone eats the bald eagle and they do not see the bald eagle then they do not visit the rabbit.
(assert (forall ((x Entity))
  (=> (and (eats x bald-eagle) (not (sees x bald-eagle)))
      (not (visit x rabbit)))))

; If someone sees the cat then the cat is rough.
(assert (forall ((x Entity))
  (=> (sees x cat) (is-rough cat))))

; If someone sees the mouse then they are not blue.
(assert (forall ((x Entity))
  (=> (sees x mouse) (not (is-blue x)))))

; 6. Verify Question: The cat is rough.
; Assert the statement to test if it is consistent (True) or contradictory (False) with the KB.
; Based on Fact 1 (bald-eagle sees cat) and Rule 5 (if someone sees cat then cat is rough),
; this assertion should be satisfiable (sat).
(assert (is-rough cat))

; 7. Check satisfiability
(check-sat)
(get-model)