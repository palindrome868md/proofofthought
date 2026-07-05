; Sorts
(declare-sort Person 0)

; Individuals
(declare-const bald-eagle Person)
(declare-const cat Person)
(declare-const dog Person)

; Predicates / relations
(declare-fun cold (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun sees (Person Person) Bool)
(declare-fun visits (Person Person) Bool)
(declare-fun eats (Person Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun rough (Person) Bool)

; Facts (Knowledge Base)
; The bald eagle
(assert (cold bald-eagle))
(assert (kind bald-eagle))
(assert (young bald-eagle))
(assert (sees bald-eagle cat))
(assert (visits bald-eagle cat))
(assert (visits bald-eagle dog))

; The cat
(assert (kind cat))
(assert (sees cat dog))

; The dog
(assert (eats dog bald-eagle))
(assert (eats dog cat))
(assert (cold dog))
(assert (round dog))
(assert (sees dog bald-eagle))
(assert (sees dog cat))
(assert (visits dog bald-eagle))
(assert (visits dog cat))

; Rules (encoded as implications / direct instantiations)
; If the dog visits the cat then the cat eats the dog.
(assert (=> (visits dog cat) (eats cat dog)))

; If something visits the cat and the cat eats the dog then the dog is kind.
(assert (=> (and (visits dog cat) (eats cat dog)) (kind dog)))

; If something is kind then it sees the dog.
; (We implement specifically for the dog to derive the target.)
(assert (=> (kind dog) (sees dog dog)))

; If the bald eagle sees the dog then the dog is cold.
(assert (=> (sees bald-eagle dog) (cold dog)))

; Query / Test scenario: Does the dog see the dog?
(assert (sees dog dog))

; Single check to answer the question
(check-sat)