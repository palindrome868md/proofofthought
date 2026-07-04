; Declare sorts
(declare-sort Person 0)

; Declare predicates (functions returning Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-furry (Person) Bool)

; Declare constants
(declare-const bob Person)
(declare-const dave Person)
(declare-const fiona Person)

; Facts about Bob
(assert (is-green bob))
(assert (is-rough bob))
(assert (is-smart bob))

; Facts about Dave
(assert (is-big dave))
(assert (is-blue dave))
(assert (is-quiet dave))
(assert (is-rough dave))
(assert (is-smart dave))

; Facts about Fiona
(assert (is-rough fiona))
(assert (is-smart fiona))

; Rule 1: If someone is smart and big then they are blue
(assert (forall ((p Person))
  (=> (and (is-smart p) (is-big p))
      (is-blue p))))

; Rule 2: All smart people are furry
(assert (forall ((p Person))
  (=> (is-smart p)
      (is-furry p))))

; Rule 3: Rough, green people are big
(assert (forall ((p Person))
  (=> (and (is-rough p) (is-green p))
      (is-big p))))

; Rule 4: All green, rough people are smart
(assert (forall ((p Person))
  (=> (and (is-green p) (is-rough p))
      (is-smart p))))

; Rule 5: If someone is blue and rough then they are quiet
(assert (forall ((p Person))
  (=> (and (is-blue p) (is-rough p))
      (is-quiet p))))

; Rule 6: If Bob is blue and Bob is smart then Bob is big
(assert (=> (and (is-blue bob) (is-smart bob))
      (is-big bob)))

; Rule 7: All quiet people are big
(assert (forall ((p Person))
  (=> (is-quiet p)
      (is-big p))))

; Rule 8: If someone is big then they are furry
(assert (forall ((p Person))
  (=> (is-big p)
      (is-furry p))))

; Test: Bob is not furry
(assert (not (is-furry bob)))

; Check satisfiability
(check-sat)
(get-model)