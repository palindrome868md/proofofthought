; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare constants
(declare-const bald-eagle Animal)
(declare-const rabbit Animal)
(declare-const squirrel Animal)

; 3. Declare functions
(declare-fun sees (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun is-blue (Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun is-young (Animal) Bool)

; 4. Assert knowledge base (facts)
; The bald eagle sees the rabbit.
(assert (sees bald-eagle rabbit))
; The rabbit likes the bald eagle.
(assert (likes rabbit bald-eagle))
; The squirrel is blue.
(assert (is-blue squirrel))

; 5. Assert knowledge base (rules)
; If something likes the bald eagle then it is blue.
(assert (forall ((x Animal))
  (=> (likes x bald-eagle)
      (is-blue x))))

; If something likes the bald eagle and it sees the bald eagle then the bald eagle is blue.
(assert (forall ((x Animal))
  (=> (and (likes x bald-eagle) (sees x bald-eagle))
      (is-blue bald-eagle))))

; If something chases the rabbit then the rabbit is young.
(assert (forall ((x Animal))
  (=> (chases x rabbit)
      (is-young rabbit))))

; 6. Test: The rabbit is blue.
; Based on the fact that the rabbit likes the bald eagle, 
; and the rule that anything liking the bald eagle is blue,
; this assertion should be satisfiable (True).
(assert (is-blue rabbit))

; 7. Check satisfiability
(check-sat)
(get-model)