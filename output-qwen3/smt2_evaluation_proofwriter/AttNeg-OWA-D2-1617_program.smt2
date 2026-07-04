; Declare sorts
(declare-sort Person 0)

; Declare predicates/functions
(declare-fun is-big (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-red (Person) Bool)

; Declare constant for Gary
(declare-const gary Person)

; Facts about Gary
(assert (is-big gary))
(assert (is-green gary))
(assert (is-round gary))

; Rule 1: If Gary is big and Gary is green then Gary is quiet
(assert (=> (and (is-big gary) (is-green gary)) (is-quiet gary)))

; Rule 2: If someone is blue and big then they are not rough
(assert (forall ((p Person)) (=> (and (is-blue p) (is-big p)) (not (is-rough p)))))

; Rule 3: If someone is round and green then they are rough
(assert (forall ((p Person)) (=> (and (is-round p) (is-green p)) (is-rough p))))

; Rule 4: If someone is big and round then they are rough
(assert (forall ((p Person)) (=> (and (is-big p) (is-round p)) (is-rough p))))

; Rule 5: If Gary is green and Gary is blue then Gary is red
(assert (=> (and (is-green gary) (is-blue gary)) (is-red gary)))

; Rule 6: If Gary is rough then Gary is round
(assert (=> (is-rough gary) (is-round gary)))

; Rule 7: Round, quiet people are not red
(assert (forall ((p Person)) (=> (and (is-round p) (is-quiet p)) (not (is-red p)))))

; Rule 8: If Gary is round and Gary is blue then Gary is green
(assert (=> (and (is-round gary) (is-blue gary)) (is-green gary)))

; Test: Gary is not round
(assert (not (is-round gary)))

; Check satisfiability
(check-sat)
(get-model)