(set-logic AUFLIA)

(declare-sort Person 0)

(declare-const anne Person)
(declare-const bob Person)
(declare-const charlie Person)
(declare-const fiona Person)

(declare-fun blue (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun young (Person) Bool)

; Facts
(assert (blue anne))
(assert (quiet anne))
(assert (white anne))

(assert (blue bob))
(assert (kind bob))
(assert (nice bob))
(assert (red bob))
(assert (young bob))

(assert (blue charlie))
(assert (quiet charlie))

(assert (blue fiona))
(assert (kind fiona))
(assert (nice fiona))
(assert (quiet fiona))
(assert (young fiona))

; Rules
(assert (forall ((x Person)) (=> (kind x) (red x))))
(assert (forall ((x Person)) (=> (and (red x) (nice x)) (white x))))
(assert (forall ((x Person)) (=> (and (blue x) (white x)) (red x))))
(assert (forall ((x Person)) (=> (and (quiet x) (red x)) (nice x))))
(assert (forall ((x Person)) (=> (blue x) (white x))))
(assert (forall ((x Person)) (=> (red x) (young x))))
(assert (=> (and (quiet fiona) (nice fiona)) (kind fiona)))
(assert (forall ((x Person)) (=> (and (young x) (white x)) (kind x))))

; Test: Fiona is not white
(assert (not (white fiona)))

(check-sat)