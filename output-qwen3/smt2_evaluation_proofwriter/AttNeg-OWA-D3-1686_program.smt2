; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-cold (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-nice (Person) Bool)

; 3. Declare constants
(declare-const Bob Person)
(declare-const Erin Person)
(declare-const Fiona Person)

; 4. Assert knowledge base (facts)
(assert (is-cold Bob))
(assert (is-rough Erin))
(assert (is-kind Fiona))

; 5. Assert knowledge base (rules)
; If someone is blue then they are round
(assert (forall ((p Person)) (=> (is-blue p) (is-round p))))
; If someone is nice then they are blue
(assert (forall ((p Person)) (=> (is-nice p) (is-blue p))))
; All rough people are nice
(assert (forall ((p Person)) (=> (is-rough p) (is-nice p))))
; All rough, blue people are cold
(assert (forall ((p Person)) (=> (and (is-rough p) (is-blue p)) (is-cold p))))
; If Fiona is not round then Fiona is cold
(assert (=> (not (is-round Fiona)) (is-cold Fiona)))
; If someone is cold and rough then they are kind
(assert (forall ((p Person)) (=> (and (is-cold p) (is-rough p)) (is-kind p))))

; 6. Verification: Erin is not blue
; We assert the statement to check if it is consistent with the KB.
; If unsat, the statement is False (Erin MUST be blue).
(assert (not (is-blue Erin)))

; 7. Check satisfiability
(check-sat)
(get-model)