; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-blue (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-furry (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-quiet (Person) Bool)

; 3. Declare constants
(declare-const Anne Person)
(declare-const Bob Person)
(declare-const Gary Person)

; 4. Assert knowledge base (facts)
; "Anne is blue."
(assert (is-blue Anne))

; "Bob is not blue."
(assert (not (is-blue Bob)))

; "Gary is blue."
(assert (is-blue Gary))

; "If someone is rough then they are big."
(assert (forall ((x Person)) (=> (is-rough x) (is-big x))))

; "All furry, kind people are big."
(assert (forall ((x Person)) (=> (and (is-furry x) (is-kind x)) (is-big x))))

; "Furry people are big."
(assert (forall ((x Person)) (=> (is-furry x) (is-big x))))

; "Green people are rough."
(assert (forall ((x Person)) (=> (is-green x) (is-rough x))))

; "Blue, quiet people are not furry."
(assert (forall ((x Person)) (=> (and (is-blue x) (is-quiet x)) (not (is-furry x)))))

; "If Gary is quiet then Gary is rough."
(assert (=> (is-quiet Gary) (is-rough Gary)))

; 5. Verification
; Question: "Bob is blue."
; We assert the statement to test its validity against the KB.
(assert (is-blue Bob))

; 6. Check satisfiability
(check-sat)
(get-model)