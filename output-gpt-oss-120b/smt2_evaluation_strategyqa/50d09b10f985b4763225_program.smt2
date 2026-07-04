; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Car 0)

; -------------------------------------------------
; 2. Declare functions / predicates
; -------------------------------------------------
; child-of(child, parent)  – Bool
(declare-fun child-of (Person Person) Bool)

; rides-in(person, car)    – Bool
(declare-fun rides-in (Person Car) Bool)

; capacity(car)            – Int (number of seats)
(declare-fun capacity (Car) Int)

; -------------------------------------------------
; 3. Declare constants
; -------------------------------------------------
(declare-const lil-wayne Person)
(declare-const c1 Person)
(declare-const c2 Person)
(declare-const c3 Person)
(declare-const corvette Car)

; -------------------------------------------------
; 4. Knowledge base
; -------------------------------------------------
; The three persons are distinct children of Lil Wayne
(assert (distinct c1 c2 c3))
(assert (child-of c1 lil-wayne))
(assert (child-of c2 lil-wayne))
(assert (child-of c3 lil-wayne))

; The Corvette ZR1 seats exactly two people (driver + passenger)
(assert (= (capacity corvette) 2))

; -------------------------------------------------
; 5. Test scenario: All three children ride together in the Corvette
; -------------------------------------------------
(assert (rides-in c1 corvette))
(assert (rides-in c2 corvette))
(assert (rides-in c3 corvette))

; -------------------------------------------------
; 6. Implicit rule: the number of people riding a car
;    cannot exceed its seating capacity.
;    (We encode it as a constraint that must hold for any model.)
; -------------------------------------------------
(assert (<= (+ 
               (ite (rides-in c1 corvette) 1 0)
               (ite (rides-in c2 corvette) 1 0)
               (ite (rides-in c3 corvette) 1 0))
            (capacity corvette)))

; -------------------------------------------------
; 7. Check satisfiability – this directly answers the question.
;    sat  → the situation is possible.
;    unsat → the situation is impossible.
; -------------------------------------------------
(check-sat)
(get-model)