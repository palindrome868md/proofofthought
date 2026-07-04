; Declare sorts
(declare-sort Person 0)

; Declare predicates (functions returning Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-green (Person) Bool)

; Declare constants for each person
(declare-const anne Person)
(declare-const bob Person)
(declare-const charlie Person)
(declare-const harry Person)

; Assert facts about Anne
(assert (is-nice anne))

; Assert facts about Bob
(assert (is-cold bob))
(assert (not (is-red bob)))
(assert (is-rough bob))

; Assert facts about Charlie
(assert (is-red charlie))
(assert (is-rough charlie))

; Assert facts about Harry
(assert (is-nice harry))
(assert (is-quiet harry))
(assert (is-rough harry))
(assert (is-round harry))

; Assert rules
; Rule 1: Nice people are quiet
(assert (forall ((p Person))
  (=> (is-nice p) (is-quiet p))))

; Rule 2: If someone is red and nice then they are not quiet
(assert (forall ((p Person))
  (=> (and (is-red p) (is-nice p)) (not (is-quiet p)))))

; Rule 3: Quiet people are cold
(assert (forall ((p Person))
  (=> (is-quiet p) (is-cold p))))

; Rule 4: If someone is quiet and round then they are not red
(assert (forall ((p Person))
  (=> (and (is-quiet p) (is-round p)) (not (is-red p)))))

; Rule 5: If someone is green and quiet then they are round
(assert (forall ((p Person))
  (=> (and (is-green p) (is-quiet p)) (is-round p))))

; Rule 6: If someone is cold then they are green
(assert (forall ((p Person))
  (=> (is-cold p) (is-green p))))

; Test: Bob is not red (this is explicitly stated as a fact)
; We assert this and check if it's consistent with the KB
(assert (not (is-red bob)))

; Check satisfiability
(check-sat)
(get-model)