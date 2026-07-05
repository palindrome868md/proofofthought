; Sorts
(declare-sort Person 0)

; Constants
(declare-const james Person)

; Predicates (relations)
(declare-fun works-at-meta (Person) Bool)
(declare-fun has-car (Person) Bool)
(declare-fun high-income (Person) Bool)
(declare-fun takes-bus (Person) Bool)
(declare-fun drives (Person) Bool)
(declare-fun student (Person) Bool)

; Knowledge base (premises)
; 1. Everyone working at Meta has a high income.
(assert (forall ((p Person)) (=> (works-at-meta p) (high-income p))))
; 2. A person with a high income will not take a bus to their destination.
(assert (forall ((p Person)) (=> (high-income p) (not (takes-bus p)))))
; 3. People will either take a bus or drive to their destination.
(assert (forall ((p Person)) (or (takes-bus p) (drives p))))
; 4. Everyone who has a car will choose to drive to their destination.
(assert (forall ((p Person)) (=> (has-car p) (drives p))))
; 5. No students drive to their destination.
(assert (forall ((p Person)) (=> (student p) (not (drives p)))))
; 6. James has a car or works at Meta.
(assert (or (has-car james) (works-at-meta james)))

; Statement to test:
; "If James either drives to his destination or is a student, then he has a high income and is a student."
(assert (=> (or (drives james) (student james))
            (and (high-income james) (student james))))

; Check satisfiability to determine truth of the statement given premises
(check-sat)