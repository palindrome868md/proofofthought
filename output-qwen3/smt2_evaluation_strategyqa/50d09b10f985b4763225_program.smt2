; Question: Could Lil Wayne's children ride in a Chevrolet Corvette ZR1 together?
; This requires checking if the number of children <= seating capacity of the vehicle

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Vehicle 0)

; 2. Declare functions
(declare-fun num-children (Person) Int)
(declare-fun seating-capacity (Vehicle) Int)

; 3. Declare constants
(declare-const lil-wayne Person)
(declare-const corvette-zr1 Vehicle)

; 4. Assert knowledge base (facts)
; Lil Wayne has 4 children (Neal, Kameron, Reginae, and Dwayne III)
(assert (= (num-children lil-wayne) 4))

; Chevrolet Corvette ZR1 is a 2-seater sports car
(assert (= (seating-capacity corvette-zr1) 2))

; 5. Test scenario: Could all children ride together?
; This is possible if number of children <= seating capacity
(assert (<= (num-children lil-wayne) (seating-capacity corvette-zr1)))

; 6. Check satisfiability
; sat = Yes, they could ride together
; unsat = No, they could NOT ride together
(check-sat)
(get-model)