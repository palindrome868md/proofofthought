(declare-sort Person 0)

(declare-fun works_at_Meta (Person) Bool)
(declare-fun high_income (Person) Bool)
(declare-fun takes_bus (Person) Bool)
(declare-fun drives (Person) Bool)
(declare-fun has_car (Person) Bool)
(declare-fun student (Person) Bool)

(declare-const james Person)

;; Premises
;; 1. Everyone working at Meta has a high income.
(assert (forall ((p Person)) (=> (works_at_Meta p) (high_income p))))
;; 2. A person with a high income will not take a bus to their destination.
(assert (forall ((p Person)) (=> (high_income p) (not (takes_bus p)))))
;; 3. People will either take a bus or drive to their destination. (XOR)
(assert (forall ((p Person)) (or (takes_bus p) (drives p))))
(assert (forall ((p Person)) (not (and (takes_bus p) (drives p)))))
;; 4. Everyone who has a car will choose to drive to their destination.
(assert (forall ((p Person)) (=> (has_car p) (drives p))))
;; 5. No students drive to their destination.
(assert (forall ((p Person)) (=> (student p) (not (drives p)))))
;; 6. James has a car or works at Meta.
(assert (or (has_car james) (works_at_Meta james)))

;; Question: If James either drives to his destination or is a student,
;; then he has a high income and is a student.
;; Test the negation of the implication: (A -> B) is false iff (A and not B).
;; Let A = (drives james) or (student james)
;; Let B = (high_income james) and (student james)
(assert (and
  (or (drives james) (student james))
  (not (and (high_income james) (student james)))
))

(check-sat)