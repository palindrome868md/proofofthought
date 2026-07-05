; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun Cold (Person) Bool)
(declare-fun Green (Person) Bool)
(declare-fun Kind (Person) Bool)
(declare-fun Quiet (Person) Bool)
(declare-fun Red (Person) Bool)

; Declare constants (individuals)
(declare-const bob Person)
(declare-const erin Person)
(declare-const gary Person)
(declare-const harry Person)

; Knowledge base
(assert (Cold bob))
(assert (Green bob))
(assert (Kind bob))
(assert (Quiet bob))

(assert (Kind erin))
(assert (Quiet erin))

(assert (Cold gary))
(assert (Green gary))
(assert (Quiet gary))
(assert (Red gary))

(assert (Cold harry))
(assert (Red harry))

; Rules: All cold things are kind; If something is kind then it is green
(assert (forall ((p Person)) (=> (Cold p) (Kind p))))
(assert (forall ((p Person)) (=> (Kind p) (Green p))))

; Test: Is Gary kind?
(assert (Kind gary))

; Check satisfiability
(check-sat)
(get-model)