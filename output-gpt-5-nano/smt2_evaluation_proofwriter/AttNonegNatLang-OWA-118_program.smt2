; Sorts
(declare-sort Person 0)

; Predicates (properties)
(declare-fun is-young (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-rough (Person) Bool)

; Constants (individuals)
(declare-const bob Person)
(declare-const dave Person)
(declare-const fred Person)
(declare-const gary Person)

; Knowledge base (rules)

; Rule: If someone is nice and round and cold, then they are blue
(assert (forall ((p Person))
  (=> (and (is-nice p) (is-round p) (is-cold p))
      (is-blue p))))

; Rule: Green and big and cold -> nice
(assert (forall ((p Person))
  (=> (and (is-green p) (is-big p) (is-cold p))
      (is-nice p))))

; Rule: Kind and young and green -> cold
(assert (forall ((p Person))
  (=> (and (is-kind p) (is-young p) (is-green p))
      (is-cold p))))

; Rule: Young -> round (interpreted from "young at heart and age are very round")
(assert (forall ((p Person))
  (=> (is-young p) (is-round p))))

; Rule: Round and green and nice -> red
(assert (forall ((p Person))
  (=> (and (is-round p) (is-green p) (is-nice p))
      (is-red p))))

; Rule: If round and red -> rough
(assert (forall ((p Person))
  (=> (and (is-round p) (is-red p))
      (is-rough p))))

; Rule: Rough and green and kind -> blue
(assert (forall ((p Person))
  (=> (and (is-rough p) (is-green p) (is-kind p))
      (is-blue p))))

; Facts (initial assertions)

; Bob: young, kind, blue, green, cold, big
(assert (is-young bob))
(assert (is-kind bob))
(assert (is-blue bob))
(assert (is-green bob))
(assert (is-cold bob))
(assert (is-big bob))

; Dave: nice
(assert (is-nice dave))

; Fred: green and cold
(assert (is-green fred))
(assert (is-cold fred))

; Gary: kind, round, green
(assert (is-kind gary))
(assert (is-round gary))
(assert (is-green gary))

; Test question: Is "Bob is not red" satisfiable?
(assert (not (is-red bob)))

; Check satisfiability and produce a model if sat
(check-sat)
(get-model)