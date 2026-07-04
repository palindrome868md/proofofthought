; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (predicates)
(declare-fun likes (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun is-big (Animal) Bool)
(declare-fun is-rough (Animal) Bool)
(declare-fun is-young (Animal) Bool)

; 3. Declare constants (specific animals)
(declare-const bald-eagle Animal)
(declare-const mouse Animal)
(declare-const rabbit Animal)
(declare-const tiger Animal)

; 4. Assert knowledge base (facts and rules)
; Fact 1: The bald eagle likes the mouse.
(assert (likes bald-eagle mouse))
; Fact 2: The mouse likes the bald eagle.
(assert (likes mouse bald-eagle))
; Fact 3: The rabbit likes the mouse.
(assert (likes rabbit mouse))
; Fact 4: The tiger chases the mouse.
(assert (chases tiger mouse))
; Fact 5: The tiger chases the rabbit.
(assert (chases tiger rabbit))
; Fact 6: The tiger is big.
(assert (is-big tiger))
; Fact 7: The tiger sees the bald eagle.
(assert (sees tiger bald-eagle))

; Rule 8: If the rabbit likes the tiger and the tiger sees the bald eagle then the rabbit is rough.
(assert (=> (and (likes rabbit tiger) (sees tiger bald-eagle)) (is-rough rabbit)))

; Rule 9: If someone sees the rabbit then the rabbit likes the tiger.
(assert (forall ((x Animal)) (=> (sees x rabbit) (likes rabbit tiger))))

; Rule 10: If someone likes the bald eagle and the bald eagle likes the rabbit then the rabbit is big.
(assert (forall ((x Animal)) (=> (and (likes x bald-eagle) (likes bald-eagle rabbit)) (is-big rabbit))))

; Rule 11: If someone likes the bald eagle then the bald eagle is rough.
(assert (forall ((x Animal)) (=> (likes x bald-eagle) (is-rough bald-eagle))))

; Rule 12: If the mouse chases the rabbit then the rabbit chases the tiger.
(assert (=> (chases mouse rabbit) (chases rabbit tiger)))

; Rule 13: If the rabbit sees the bald eagle then the bald eagle chases the rabbit.
(assert (=> (sees rabbit bald-eagle) (chases bald-eagle rabbit)))

; Rule 14: If someone is young and they chase the mouse then they see the mouse.
(assert (forall ((x Animal)) (=> (and (is-young x) (chases x mouse)) (sees x mouse))))

; Rule 15: If someone likes the mouse and they are rough then they see the rabbit.
(assert (forall ((x Animal)) (=> (and (likes x mouse) (is-rough x)) (sees x rabbit))))

; 5. Verification
; Question: "The rabbit does not like the mouse."
; To verify this statement, we assert it and check for satisfiability against the KB.
; Since Fact 3 states (likes rabbit mouse), asserting (not (likes rabbit mouse)) should be unsat.
(assert (not (likes rabbit mouse)))

(check-sat)
(get-model)