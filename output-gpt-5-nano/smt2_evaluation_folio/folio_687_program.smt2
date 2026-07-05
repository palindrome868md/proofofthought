; Sorts
(declare-sort Person 0)
(declare-sort Place 0)

; Functions (predicates)
(declare-fun owns_car (Person) Bool)
(declare-fun rents_car (Person) Bool)
(declare-fun spends_money (Person) Bool)
(declare-fun goes_to (Person Place) Bool)
(declare-fun drives (Person Place) Bool)
(declare-fun borrows_car (Person) Bool)
(declare-fun goes_camping_to (Person Place) Bool)

; Constants
(declare-const sarah Person)
(declare-const vermont Place)

; Knowledge base / Premises

; 1) Sarah doesn't own a car
(assert (not (owns_car sarah)))

; 2) Sarah is going to go camping in Vermont
(assert (goes_camping_to sarah vermont))

; Rules / Invariants

; If someone goes camping to a place l, then they go to that place l
(assert (forall ((p Person) (l Place))
  (=> (goes_camping_to p l) (goes_to p l))))

; If someone goes to Vermont, they drive there
(assert (forall ((p Person))
  (=> (goes_to p vermont) (drives p vermont))))

; If not owns a car and drives somewhere, they must borrow or rent a car
(assert (forall ((p Person) (l Place))
  (=> (and (not (owns_car p)) (drives p l))
      (or (borrows_car p) (rents_car p)))))

; Renting a car implies spending money
(assert (forall ((p Person))
  (=> (rents_car p) (spends_money p))))

; Sarah never borrows a car to go camping
(assert (not (borrows_car sarah)))

; 3) From camping to Vermont, we know she goes camping to vermont implies she goes to vermont (via the camping-to-place rule)

; Test: "Sarah spends money this weekend" (negation to check entailment)
(assert (not (spends_money sarah)))

; 4) Check satisfiability (single check-sat as required)
(check-sat)
(get-model)