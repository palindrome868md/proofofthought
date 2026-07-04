; SMT-LIB 2.0 Program for Reasoning about Harry's Size
; Question: Harry is big.

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-young (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-blue (Person) Bool)

; 3. Declare Constants
(declare-const Alan Person)
(declare-const Dave Person)
(declare-const Gary Person)
(declare-const Harry Person)

; 4. Assert Knowledge Base (Facts about Individuals)

; Alan: round, kind
(assert (is-round Alan))
(assert (is-kind Alan))

; Dave: round, kind
(assert (is-round Dave))
(assert (is-kind Dave))

; Gary: young, round, cold
(assert (is-young Gary))
(assert (is-round Gary))
(assert (is-cold Gary))

; Harry: young, rough, green, cold, nice
(assert (is-young Harry))
(assert (is-rough Harry))
(assert (is-green Harry))
(assert (is-cold Harry))
(assert (is-nice Harry))

; 5. Assert Knowledge Base (Rules)

; People who have red coloration usually treat people in a kind manner.
(assert (forall ((p Person)) (=> (is-red p) (is-kind p))))

; They are also usually young looking.
(assert (forall ((p Person)) (=> (is-red p) (is-young p))))

; If you run across a young person with rough skin and a round figure, you can count on them being kind.
(assert (forall ((p Person)) (=> (and (is-young p) (is-rough p) (is-round p)) (is-kind p))))

; A person that is both nice and rough is someone who is also big.
(assert (forall ((p Person)) (=> (and (is-nice p) (is-rough p)) (is-big p))))

; A red, nice person will definitely be a blue person.
(assert (forall ((p Person)) (=> (and (is-red p) (is-nice p)) (is-blue p))))

; Someone that is cold rough and red is also considered to be kind.
(assert (forall ((p Person)) (=> (and (is-cold p) (is-rough p) (is-red p)) (is-kind p))))

; A young person who is big and rough and big is also usually round.
(assert (forall ((p Person)) (=> (and (is-young p) (is-big p) (is-rough p)) (is-round p))))

; 6. Verification
; Question: Harry is big.
; We assert the claim. If sat, the claim is consistent/entailed (True).
; If unsat, the claim contradicts the KB (False).
(assert (is-big Harry))

; 7. Check Satisfiability
(check-sat)
(get-model)