; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-big (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-white (Person) Bool)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-rough (Person) Bool)

; 3. Declare constants
(declare-const Bob Person)
(declare-const Dave Person)
(declare-const Fiona Person)
(declare-const Harry Person)

; 4. Assert knowledge base (facts)
(assert (is-cold Bob))
(assert (is-white Bob))
(assert (is-big Dave))
(assert (is-cold Dave))
(assert (is-quiet Dave))
(assert (is-smart Dave))
(assert (is-kind Fiona))
(assert (is-smart Fiona))
(assert (is-big Harry))
(assert (is-cold Harry))
(assert (is-rough Harry))
(assert (is-smart Harry))

; 5. Assert knowledge base (rules)
; Big, rough people are white
(assert (forall ((p Person))
  (=> (and (is-big p) (is-rough p))
      (is-white p))))

; If Fiona is big and Fiona is cold then Fiona is kind
(assert (=> (and (is-big Fiona) (is-cold Fiona))
            (is-kind Fiona)))

; If Dave is cold then Dave is quiet
(assert (=> (is-cold Dave)
            (is-quiet Dave)))

; 6. Verification: Test the statement "Bob is cold"
(assert (is-cold Bob))

; 7. Check satisfiability
(check-sat)
(get-model)