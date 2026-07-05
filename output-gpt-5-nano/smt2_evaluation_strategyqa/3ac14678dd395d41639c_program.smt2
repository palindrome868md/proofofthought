; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun age (Person) Int)
(declare-fun is-disabled (Person) Bool)
(declare-fun medicare-eligible (Person) Bool)

; Declare constants
(declare-const eleventh-grader Person)

; Knowledge base / Rules

; Medicare eligibility if age >= 65
(assert (forall ((p Person)) (=> (>= (age p) 65) (medicare-eligible p))))

; Medicare eligibility if disabled
(assert (forall ((p Person)) (=> (is-disabled p) (medicare-eligible p))))

; Not eligible for those under 65 and not disabled
(assert (forall ((p Person)) (=> (and (< (age p) 65) (not (is-disabled p)))
                                (not (medicare-eligible p)))))

; Facts about the eleventh-grader
(assert (= (age eleventh-grader) 16))
(assert (not (is-disabled eleventh-grader)))

; Test: Would an eleventh-grader be eligible for Medicare?
(assert (medicare-eligible eleventh-grader))

; Check satisfiability
(check-sat)
(get-model)