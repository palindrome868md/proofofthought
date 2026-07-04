;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations -------------------------------------------
(declare-fun kind   (Entity) Bool)
(declare-fun cold   (Entity) Bool)
(declare-fun young  (Entity) Bool)
(declare-fun round  (Entity) Bool)
(declare-fun rough  (Entity) Bool)

(declare-fun sees   (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)

;--- Constant symbols -------------------------------------------------
(declare-const bald_eagle Entity)
(declare-const cat        Entity)
(declare-const dog        Entity)

;--- Facts ------------------------------------------------------------
; bald eagle
(assert (cold bald_eagle))
(assert (kind bald_eagle))
(assert (young bald_eagle))
(assert (sees bald_eagle cat))
(assert (visits bald_eagle cat))
(assert (visits bald_eagle dog))

; cat
(assert (kind cat))
(assert (sees cat dog))

; dog
(assert (eats dog bald_eagle))
(assert (eats dog cat))
(assert (cold dog))
(assert (round dog))
(assert (sees dog bald_eagle))
(assert (sees dog cat))
(assert (visits dog bald_eagle))
(assert (visits dog cat))

;--- Rules ------------------------------------------------------------
; 1. If the dog visits the cat then the cat eats the dog.
(assert (=> (visits dog cat) (eats cat dog)))

; 2. If something is kind then it sees the dog.
(assert (forall ((x Entity))
        (=> (kind x) (sees x dog))))

; 3. If the bald eagle sees the dog then the dog is cold.
(assert (=> (sees bald_eagle dog) (cold dog)))

; 4. If something visits the cat and the cat eats the dog then the dog is kind.
(assert (forall ((x Entity))
        (=> (and (visits x cat) (eats cat dog))
            (kind dog))))

; 5. If something eats the cat and it is round then the cat is rough.
(assert (forall ((x Entity))
        (=> (and (eats x cat) (round x))
            (rough cat))))

; 6. If something visits the cat and the cat visits the bald eagle then the cat visits the dog.
(assert (forall ((x Entity))
        (=> (and (visits x cat) (visits cat bald_eagle))
            (visits cat dog))))

;--- Query: does the dog see the dog? ---------------------------------
(assert (sees dog dog))

;--- Check satisfiability ---------------------------------------------
(check-sat)
(get-model)