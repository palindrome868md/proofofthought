; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (properties)
(declare-fun is-big (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-furry (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-white (Person) Bool)

; 3. Declare constants
(declare-const anne Person)
(declare-const fiona Person)
(declare-const gary Person)

; 4. Assert knowledge base (facts)
(assert (is-big anne))
(assert (is-red anne))
(assert (is-big fiona))
(assert (not (is-round fiona)))
(assert (is-smart fiona))
(assert (is-furry gary))
(assert (is-smart gary))

; 5. Assert knowledge base (rules)
(assert (=> (and (is-big anne) (is-furry anne)) (is-blue anne)))
(assert (forall ((p Person)) (=> (is-white p) (is-round p))))
(assert (=> (is-blue anne) (is-white anne)))
(assert (forall ((p Person)) (=> (and (is-red p) (is-big p)) (is-white p))))
(assert (forall ((p Person)) (=> (is-white p) (is-furry p))))
(assert (forall ((p Person)) (=> (is-furry p) (is-smart p))))
(assert (=> (and (is-blue gary) (not (is-big gary))) (is-smart gary)))
(assert (=> (and (is-red fiona) (not (is-furry fiona))) (is-smart fiona)))

; 6. Test: Gary is not smart
(assert (not (is-smart gary)))

; 7. Check satisfiability
(check-sat)
(get-model)