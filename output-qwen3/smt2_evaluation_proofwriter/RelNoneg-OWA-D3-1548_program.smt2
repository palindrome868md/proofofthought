; Reasoning Steps:
; 1. Define Sort 'Animal' for entities (bald-eagle, cat, dog).
; 2. Define Predicates for properties (is-cold, is-kind, etc.) and relations (sees, visits, eats).
; 3. Assert Facts from the text.
; 4. Assert Rules from the text.
; 5. Derivation Logic:
;    - Fact: (visits dog cat)
;    - Rule 1: (visits dog cat) -> (eats cat dog)
;    - Rule 4: (visits dog cat) AND (eats cat dog) -> (is-kind dog)
;    - Rule 2: (is-kind dog) -> (sees dog dog)
;    - Question: (sees dog dog) should be consistent (sat).
; 6. Assert the Question as a constraint and check satisfiability.

; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants
(declare-const bald-eagle Animal)
(declare-const cat Animal)
(declare-const dog Animal)

; 3. Declare Functions (Predicates)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-kind (Animal) Bool)
(declare-fun is-young (Animal) Bool)
(declare-fun is-round (Animal) Bool)
(declare-fun is-rough (Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (is-cold bald-eagle))
(assert (is-kind bald-eagle))
(assert (is-young bald-eagle))
(assert (sees bald-eagle cat))
(assert (visits bald-eagle cat))
(assert (visits bald-eagle dog))
(assert (is-kind cat))
(assert (sees cat dog))
(assert (eats dog bald-eagle))
(assert (eats dog cat))
(assert (is-cold dog))
(assert (is-round dog))
(assert (sees dog bald-eagle))
(assert (sees dog cat))
(assert (visits dog bald-eagle))
(assert (visits dog cat))

; 5. Assert Knowledge Base (Rules)

; If the dog visits the cat then the cat eats the dog.
(assert (=> (visits dog cat) (eats cat dog)))

; If something is kind then it sees the dog.
(assert (forall ((x Animal)) (=> (is-kind x) (sees x dog))))

; If the bald eagle sees the dog then the dog is cold.
(assert (=> (sees bald-eagle dog) (is-cold dog)))

; If something visits the cat and the cat eats the dog then the dog is kind.
(assert (forall ((x Animal)) (=> (and (visits x cat) (eats cat dog)) (is-kind dog))))

; If something eats the cat and it is round then the cat is rough.
(assert (forall ((x Animal)) (=> (and (eats x cat) (is-round x)) (is-rough cat))))

; If something visits the cat and the cat visits the bald eagle then the cat visits the dog.
(assert (forall ((x Animal)) (=> (and (visits x cat) (visits cat bald-eagle)) (visits cat dog))))

; 6. Verification: The dog sees the dog.
; Assert the statement to check if it is consistent with the KB (sat = True)
(assert (sees dog dog))

; 7. Check Satisfiability
(check-sat)
(get-model)