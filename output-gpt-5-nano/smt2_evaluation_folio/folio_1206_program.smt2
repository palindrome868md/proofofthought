(declare-sort Person 0)

(declare-fun works_at_meta (Person) Bool)
(declare-fun high_income (Person) Bool)
(declare-fun take_bus (Person) Bool)
(declare-fun drive (Person) Bool)
(declare-fun has_car (Person) Bool)
(declare-fun is_student (Person) Bool)

(declare-const james Person)

; Premises
(assert (forall ((p Person)) (=> (works_at_meta p) (high_income p))))
(assert (forall ((p Person)) (=> (high_income p) (not (take_bus p)))))
(assert (forall ((p Person)) (or (take_bus p) (drive p))))
(assert (forall ((p Person)) (=> (has_car p) (drive p))))
(assert (forall ((p Person)) (=> (is_student p) (not (drive p)))))
(assert (or (has_car james) (works_at_meta james)))

; Test: James either drives to their destination or is a student
(assert (not (or (drive james) (is_student james))))

(check-sat)
(get-model)