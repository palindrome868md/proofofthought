; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Place 0)

; 2. Declare constants
(declare-const Sarah Person)
(declare-const Vermont Place)

; 3. Declare functions
(declare-fun OwnsCar (Person) Bool)
(declare-fun GoesTo (Person Place) Bool)
(declare-fun Drives (Person Place) Bool)
(declare-fun BorrowsCarFor (Person Place) Bool)
(declare-fun RentsCarFor (Person Place) Bool)
(declare-fun SpendsMoney (Person) Bool)
(declare-fun GoesCamping (Person Place) Bool)

; 4. Assert knowledge base (premises)

; Premise 1: Everyone who rents a car spends money.
(assert (forall ((p Person) (pl Place))
  (=> (RentsCarFor p pl) (SpendsMoney p))))

; Premise 2: Whenever Sarah goes to Vermont, Sarah drives there.
(assert (=> (GoesTo Sarah Vermont) (Drives Sarah Vermont)))

; Premise 3: Someone who does not own a car to drive somewhere must either borrow a car or rent a car.
(assert (forall ((p Person) (pl Place))
  (=> (and (Drives p pl) (not (OwnsCar p)))
      (or (BorrowsCarFor p pl) (RentsCarFor p pl)))))

; Premise 4: Sarah doesn't own a car.
(assert (not (OwnsCar Sarah)))

; Premise 5: Sarah never borrows a car to go camping.
(assert (forall ((pl Place))
  (=> (GoesCamping Sarah pl)
      (not (BorrowsCarFor Sarah pl)))))

; Premise 6: Sarah is going to go camping in Vermont.
(assert (GoesCamping Sarah Vermont))

; Premise 7: To go camping somewhere, you must go to that place.
(assert (forall ((p Person) (pl Place))
  (=> (GoesCamping p pl) (GoesTo p pl))))

; 5. Verify Statement: Sarah will spend money this weekend.
; We assert the statement to check if it is satisfiable given the premises.
; Based on logical deduction:
; 1. Sarah goes camping in Vermont (Premise 6).
; 2. Therefore, Sarah goes to Vermont (Premise 7).
; 3. Therefore, Sarah drives to Vermont (Premise 2).
; 4. Sarah does not own a car (Premise 4).
; 5. Therefore, Sarah must borrow or rent a car for Vermont (Premise 3).
; 6. Sarah does not borrow a car for camping (Premise 5 + 6).
; 7. Therefore, Sarah rents a car for Vermont.
; 8. Therefore, Sarah spends money (Premise 1).
; Expected result: sat (True)
(assert (SpendsMoney Sarah))

; 6. Check satisfiability
(check-sat)
(get-model)