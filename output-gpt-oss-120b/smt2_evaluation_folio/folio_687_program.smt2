; -------------------------------------------------
; Sort declarations
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Place 0)

; -------------------------------------------------
; Function (predicate) declarations
; -------------------------------------------------
(declare-fun ownsCar (Person) Bool)
(declare-fun borrows (Person) Bool)
(declare-fun rents   (Person) Bool)
(declare-fun spends  (Person) Bool)

(declare-fun goesTo  (Person Place) Bool)
(declare-fun drives  (Person Place) Bool)
(declare-fun camps   (Person Place) Bool)

; -------------------------------------------------
; Constant declarations
; -------------------------------------------------
(declare-const Sarah Person)
(declare-const Vermont Place)

; -------------------------------------------------
; Knowledge base (premises)
; -------------------------------------------------

; 1. Everyone who rents a car spends money.
(assert (forall ((p Person))
        (=> (rents p) (spends p))))

; 2. Whenever Sarah goes to Vermont, Sarah drives there.
(assert (=> (goesTo Sarah Vermont)
            (drives Sarah Vermont)))

; 3. If a person who does not own a car drives somewhere,
;    they must either borrow a car or rent a car.
(assert (forall ((p Person) (pl Place))
        (=> (and (not (ownsCar p)) (drives p pl))
            (or (borrows p) (rents p)))))

; 4. Sarah doesn’t own a car.
(assert (not (ownsCar Sarah)))

; 5. Sarah never borrows a car to go camping.
(assert (not (borrows Sarah)))

; 6. Sarah is going to go camping in Vermont.
(assert (camps Sarah Vermont))

; 7. To go camping somewhere, you must go to that place.
(assert (forall ((p Person) (pl Place))
        (=> (camps p pl) (goesTo p pl))))

; -------------------------------------------------
; Statement to verify: "Sarah will spend money this weekend."
; -------------------------------------------------
(assert (spends Sarah))

; -------------------------------------------------
; Check satisfiability
; -------------------------------------------------
(check-sat)   ; Expected result: sat (statement is true)
(get-model)