; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun sees (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun redp (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun blue (Entity) Bool)

; Constants
(declare-const bald-eagle Entity)
(declare-const cat Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)

; Knowledge base

; 1. The bald eagle sees the cat.
(assert (sees bald-eagle cat))

; 2. The cat sees the bald eagle.
(assert (sees cat bald-eagle))

; 3. The mouse does not eat the cat.
(assert (not (eats mouse cat)))

; 4. The rabbit does not see the mouse.
(assert (not (sees rabbit mouse)))

; 5. If someone is red then they do not eat the bald eagle.
(assert (forall ((p Entity))
  (=> (redp p) (not (eats p bald-eagle)))))

; 6. If someone sees the bald eagle and the bald eagle does not see the rabbit then they eat the cat.
(assert (forall ((p Entity))
  (=> (and (sees p bald-eagle) (not (sees bald-eagle rabbit)))
      (eats p cat))))

; 7. If the mouse is not rough then the mouse does not eat the cat.
(assert (=> (not (rough mouse)) (not (eats mouse cat))))

; 8. If someone eats the bald eagle and they do not see the bald eagle then they do not visit the rabbit.
(assert (forall ((p Entity))
  (=> (and (eats p bald-eagle) (not (sees p bald-eagle)))
      (not (visits p rabbit)))))

; 9. If someone sees the cat then the cat is rough.
(assert (forall ((p Entity))
  (=> (sees p cat) (rough cat))))

; 10. If someone sees the mouse then they are not blue.
(assert (forall ((p Entity))
  (=> (sees p mouse) (not (blue p)))))

; Query: The cat is rough.
(assert (rough cat))

; Check satisfiability and get a model
(check-sat)
(get-model)