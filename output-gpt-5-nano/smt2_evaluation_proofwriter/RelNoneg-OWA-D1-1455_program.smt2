; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const bald_eagle Person)
(declare-const bear Person)
(declare-const tiger Person)
(declare-const cow Person)

; Declare predicates (functions)
(declare-fun eats (Person Person) Bool)
(declare-fun likes (Person Person) Bool)
(declare-fun needs (Person Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun kind (Person) Bool)

; Knowledge base
(assert (eats bald_eagle bear))
(assert (eats bald_eagle tiger))
(assert (rough bald_eagle))
(assert (likes bald_eagle bear))
(assert (needs bald_eagle tiger))

(assert (eats bear cow))
(assert (eats bear tiger))
(assert (cold bear))

(assert (needs cow tiger))
(assert (needs tiger bald_eagle))

; Rules
; Rough people are kind
(assert (forall ((p Person)) (=> (rough p) (kind p))))

; If someone likes the bear and they need the tiger then the bear likes the bald eagle
(assert (forall ((p Person)) (=> (and (likes p bear) (needs p tiger)) (likes bear bald_eagle))))

; If someone is cold and they need the bear then they need the bald eagle
(assert (forall ((p Person)) (=> (and (cold p) (needs p bear)) (needs p bald_eagle))))

; Test: The bald eagle needs the tiger
(assert (needs bald_eagle tiger))

; Check satisfiability
(check-sat)
(get-model)