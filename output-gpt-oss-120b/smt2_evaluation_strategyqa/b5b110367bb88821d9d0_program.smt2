;-------------------------------------------------
; Declare sorts (types)
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Institution 0)

;-------------------------------------------------
; Declare functions and predicates
;-------------------------------------------------
; Birth year of a person
(declare-fun birth-year (Person) Int)

; Founding year of an institution
(declare-fun founding-year (Institution) Int)

; Predicate: a person helped establish an institution
(declare-fun helped-establish (Person Institution) Bool)

;-------------------------------------------------
; Declare the relevant constants
;-------------------------------------------------
(declare-const millard-fillmore Person)
(declare-const university-of-pittsburgh Institution)

;-------------------------------------------------
; Knowledge base
;-------------------------------------------------
; Fact: Fillmore’s birth year
(assert (= (birth-year millard-fillmore) 1800))

; Fact: University of Pittsburgh founding year
(assert (= (founding-year university-of-pittsburgh) 1787))

; Rule: one can only help establish an institution if one was alive
;       on or before its founding year
(assert (forall ((p Person) (i Institution))
  (=> (helped-establish p i)
      (<= (birth-year p) (founding-year i)))))  ; birth ≤ founding

;-------------------------------------------------
; Test the statement: "Millard Fillmore helped to establish the University of Pittsburgh"
;-------------------------------------------------
(assert (helped-establish millard-fillmore university-of-pittsburgh))

;-------------------------------------------------
; Query the solver
;-------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)