; Declare sorts
(declare-sort Person 0)

; Predicates
(declare-fun nice (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun quiet (Person) Bool)

; Constants
(declare-const anne Person)
(declare-const bob Person)
(declare-const charlie Person)
(declare-const harry Person)

; Knowledge base: given facts
(assert (nice anne))
(assert (cold bob))
(assert (not (red bob)))
(assert (rough bob))

(assert (red charlie))
(assert (rough charlie))

(assert (nice harry))
(assert (quiet harry))
(assert (rough harry))
(assert (round harry))

; Knowledge base: general rules
(assert (forall ((p Person)) (=> (nice p) (quiet p))))
(assert (forall ((p Person)) (=> (and (red p) (nice p)) (not (quiet p)))))
(assert (forall ((p Person)) (=> (quiet p) (cold p))))
(assert (forall ((p Person)) (=> (and (quiet p) (round p)) (not (red p)))))
(assert (forall ((p Person)) (=> (and (green p) (quiet p)) (round p))))
(assert (forall ((p Person)) (=> (cold p) (green p))))

; Test: Is "Bob is not red" satisfiable given the KB? (i.e., is the statement true)
(assert (not (red bob)))

; Check satisfiability and provide a model
(check-sat)
(get-model)