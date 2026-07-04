; Declare sorts
(declare-sort Person 0)
(declare-sort Place 0)

; Declare constants
(declare-const sarah Person)
(declare-const vermont Place)

; Predicates / relations
(declare-fun goes_to (Person Place) Bool)
(declare-fun drives_to (Person Place) Bool)
(declare-fun goes_camping (Person Place) Bool)
(declare-fun owns_car (Person) Bool)
(declare-fun borrows_car (Person Place) Bool)
(declare-fun rents_car (Person) Bool)
(declare-fun spends_money (Person) Bool)

; Knowledge base

; Sarah doesn't own a car
(assert (not (owns_car sarah)))

; Sarah goes camping in Vermont
(assert (goes_camping sarah vermont))

; To go camping somewhere, you must go to that place
(assert (forall ((p Person) (l Place))
  (=> (goes_camping p l)
      (goes_to p l))))

; Whenever someone goes to Vermont, they drive there
(assert (forall ((p Person))
  (=> (goes_to p vermont)
      (drives_to p vermont))))

; Everyone who rents a car spends money
(assert (forall ((p Person))
  (=> (rents_car p)
      (spends_money p))))

; If a person does not own a car and drives somewhere, they must borrow or rent
(assert (forall ((p Person) (l Place))
  (=> (and (not (owns_car p)) (drives_to p l))
      (or (borrows_car p l) (rents_car p)))))

; Sarah never borrows a car to go camping
(assert (not (borrows_car sarah vermont)))

; Test proposition: Does Sarah spend money?
(assert (spends_money sarah))

; Check satisfiability and get a model
(check-sat)
(get-model)