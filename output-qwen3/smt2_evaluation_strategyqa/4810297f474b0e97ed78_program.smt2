; Question: Could ten gallons of seawater crush a six year old?
; This is a possibility question - we test if the scenario is satisfiable

; Declare sorts
(declare-sort Substance 0)
(declare-sort Person 0)

; Declare functions
(declare-fun weight-per-gallon (Substance) Real)
(declare-fun crushing-weight-threshold (Person) Real)
(declare-fun can-crush (Real Person) Bool)

; Declare constants
(declare-const seawater Substance)
(declare-const six-year-old Person)
(declare-const ten-gallons Real)

; Knowledge Base: Physical facts

; Seawater weighs approximately 8.6 pounds per gallon
(assert (= (weight-per-gallon seawater) 8.6))

; Ten gallons constant
(assert (= ten-gallons 10.0))

; Calculate total weight of 10 gallons seawater: 86 pounds
; A human body requires significantly more pressure/weight to be "crushed"
; Crushing threshold for a child is much higher than 86 pounds
; (Typically hundreds or thousands of pounds of concentrated pressure)
(assert (= (crushing-weight-threshold six-year-old) 500.0))

; Rule: Something can crush a person if its weight exceeds the crushing threshold
(assert (forall ((w Real) (p Person))
  (=> (> w (crushing-weight-threshold p))
      (can-crush w p))))

; Test scenario: Could 10 gallons of seawater (86 lbs) crush a six year old?
; We assert that it CAN crush and check satisfiability
; If unsat, then it CANNOT crush (the answer is No)

; Calculate weight of 10 gallons seawater
(declare-const seawater-weight Real)
(assert (= seawater-weight (* ten-gallons (weight-per-gallon seawater))))

; Assert the claim we're testing: 10 gallons seawater CAN crush the child
(assert (can-crush seawater-weight six-year-old))

; Check satisfiability
(check-sat)
; Expected: unsat (86 lbs < 500 lbs threshold, so cannot crush)

(get-model)