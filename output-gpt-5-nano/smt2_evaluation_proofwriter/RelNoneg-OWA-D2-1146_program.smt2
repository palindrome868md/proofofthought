; Declare sorts
(declare-sort Animal 0)

; Declare constants (entities)
(declare-const bald_eagle Animal)
(declare-const bear Animal)
(declare-const rabbit Animal)
(declare-const mouse Animal)

; Declare predicates
(declare-fun sees (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun blue (Animal) Bool)
(declare-fun red (Animal) Bool)
(declare-fun big (Animal) Bool)
(declare-fun cold (Animal) Bool)
(declare-fun nice (Animal) Bool)

; Knowledge base (facts)
(assert (sees bald_eagle bear))
(assert (sees bald_eagle rabbit))
(assert (chases bear bald_eagle))
(assert (chases bear rabbit))
(assert (eats bear mouse))
(assert (blue bear))
(assert (sees bear rabbit))
(assert (chases mouse rabbit))
(assert (cold mouse))
(assert (nice mouse))
(assert (sees mouse bear))
(assert (sees mouse rabbit))
(assert (eats rabbit bear))
(assert (eats rabbit mouse))
(assert (sees rabbit bald_eagle))

; Rules
; If something chases the rabbit then the rabbit eats the bald eagle.
(assert (forall ((x Animal)) (=> (chases x rabbit) (eats rabbit bald_eagle))))
; If something sees the bear then the bear is red.
(assert (forall ((x Animal)) (=> (sees x bear) (red bear))))
; If something is red then it is big.
(assert (forall ((x Animal)) (=> (red x) (big x))))
; If something chases the bald eagle and the bald eagle eats the rabbit then the bald eagle is red.
(assert (forall ((x Animal)) (=> (and (chases x bald_eagle) (eats bald_eagle rabbit)) (red bald_eagle))))
; Red things are blue.
(assert (forall ((x Animal)) (=> (red x) (blue x))))
; If something eats the rabbit and the rabbit is red then it is blue.
(assert (forall ((x Animal)) (=> (and (eats x rabbit) (red rabbit)) (blue x))))

; Test: Does the rabbit eat the mouse?
(assert (eats rabbit mouse))

; Check satisfiability
(check-sat)
(get-model)