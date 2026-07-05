; Sorts
(declare-sort Animal 0)

; Predicates
(declare-fun eats (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)

(declare-fun cold (Animal) Bool)
(declare-fun kind (Animal) Bool)
(declare-fun rough (Animal) Bool)
(declare-fun young (Animal) Bool)
(declare-fun big (Animal) Bool)

; Constants
(declare-const bald-eagle Animal)
(declare-const mouse Animal)
(declare-const rabbit Animal)

; Facts
(assert (eats bald-eagle mouse))
(assert (sees bald-eagle mouse))
(assert (sees bald-eagle rabbit))
(assert (visits bald-eagle mouse))

(assert (eats mouse bald-eagle))
(assert (eats mouse rabbit))
(assert (sees mouse bald-eagle))
(assert (visits mouse rabbit))
(assert (eats rabbit bald-eagle))
(assert (cold rabbit))
(assert (kind rabbit))
(assert (rough rabbit))
(assert (young rabbit))
(assert (sees rabbit bald-eagle))
(assert (sees rabbit mouse))
(assert (visits rabbit bald-eagle))

; Rules
; 1) If something visits the rabbit then it is young.
(assert (forall ((p Animal))
  (=> (visits p rabbit) (young p))))

; 2) If something sees the mouse then the mouse visits the bald eagle.
(assert (forall ((p Animal))
  (=> (sees p mouse) (visits mouse bald-eagle))))

; 3) Big things are cold.
(assert (forall ((p Animal))
  (=> (big p) (cold p))))

; 4) If something sees the rabbit then it visits the rabbit.
(assert (forall ((p Animal))
  (=> (sees p rabbit) (visits p rabbit))))

; 5) Young things are cold.
(assert (forall ((p Animal))
  (=> (young p) (cold p))))

; 6) If something sees the mouse and it visits the mouse then the mouse eats the rabbit.
(assert (forall ((p Animal))
  (=> (and (sees p mouse) (visits p mouse)) (eats mouse rabbit))))

; 7) If something sees the mouse then the mouse is big.
(assert (forall ((p Animal))
  (=> (sees p mouse) (big mouse))))

; 8) If something visits the mouse and the mouse is rough then it eats the mouse.
(assert (forall ((p Animal))
  (=> (and (visits p mouse) (rough mouse)) (eats p mouse))))

; Query: The mouse does not eat the bald eagle
(assert (not (eats mouse bald-eagle)))

; Check satisfiability
(check-sat)
(get-model)