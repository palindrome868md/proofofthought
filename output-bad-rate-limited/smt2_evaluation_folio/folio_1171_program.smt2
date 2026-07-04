(declare-sort Person 0)

; Predicates
(declare-fun Math (Person) Bool)
(declare-fun Chem (Person) Bool)
(declare-fun Enjoy (Person) Bool)
(declare-fun Planning (Person) Bool)
(declare-fun Failed (Person) Bool)
(declare-fun Passed (Person) Bool)

; James
(declare-const James Person)

; Existence: some student is Math and Chem
(assert (exists ((p Person)) (and (Math p) (Chem p))))

; Premises
(assert (forall ((p Person)) (=> (Chem p) (Enjoy p))))
(assert (forall ((p Person)) (=> (Enjoy p) (Planning p))))
(assert (forall ((p Person)) (=> (Planning p) (not (Failed p)))))

; James' status: either (Chem James & Failed James) or (not Chem James & Passed James)
(assert (or (and (Chem James) (Failed James))
            (and (not (Chem James)) (Passed James))))

; Test: James failed and James is Math
(assert (and (Failed James) (Math James)))

; Check satisfiability
(check-sat)