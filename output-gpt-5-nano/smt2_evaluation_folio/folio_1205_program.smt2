; Sorts
(declare-sort Person 0)

; Constants
(declare-const James Person)

; Predicates
(declare-fun works_at_Meta (Person) Bool)
(declare-fun high_income (Person) Bool)
(declare-fun takes_bus (Person) Bool)
(declare-fun drives (Person) Bool)
(declare-fun has_car (Person) Bool)
(declare-fun is_student (Person) Bool)

; Knowledge base (premises)
; 1. Everyone working at Meta has a high income.
(assert (forall ((p Person)) (=> (works_at_Meta p) (high_income p))))
; 2. A person with a high income will not take a bus to their destination.
(assert (forall ((p Person)) (=> (high_income p) (not (takes_bus p)))))
; 3. People will either take a bus or drive to their destination.
(assert (forall ((p Person)) (or (takes_bus p) (drives p))))
; 4. Everyone who has a car will choose to drive to their destination.
(assert (forall ((p Person)) (=> (has_car p) (drives p))))
; 5. No students drive to their destination.
(assert (forall ((p Person)) (=> (is_student p) (not (drives p)))))
; 6. James has a car or works at Meta.
(assert (or (has_car James) (works_at_Meta James)))

; Test: Does James drive to his destination or is he a student?
; We test the negation to see if the statement is entailed.
(assert (not (or (drives James) (is_student James))))

; Check satisfiability to determine entailment
(check-sat)
(get-model)