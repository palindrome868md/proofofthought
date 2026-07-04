; Declare sorts
(declare-sort Person 0)
(declare-sort Institution 0)

; Declare functions
(declare-fun helped-establish (Person Institution) Bool)
(declare-fun birth-year (Person) Int)
(declare-fun founding-year (Institution) Int)

; Declare constants
(declare-const millard-fillmore Person)
(declare-const university-of-pittsburgh Institution)
(declare-const university-at-buffalo Institution)

; Knowledge base - Historical facts
; Fillmore was born in 1800
(assert (= (birth-year millard-fillmore) 1800))

; University of Pittsburgh was founded in 1787 (as Pittsburgh Academy)
(assert (= (founding-year university-of-pittsburgh) 1787))

; University at Buffalo was founded in 1846 (Fillmore helped establish this one)
(assert (= (founding-year university-at-buffalo) 1846))
(assert (helped-establish millard-fillmore university-at-buffalo))

; Rule: A person cannot help establish an institution before they were born
(assert (forall ((p Person) (i Institution))
  (=> (helped-establish p i)
      (<= (birth-year p) (founding-year i)))))

; Test: Did Fillmore help establish University of Pittsburgh?
(assert (helped-establish millard-fillmore university-of-pittsburgh))

; Check satisfiability
(check-sat)
; Expected: unsat (FALSE - Fillmore was born in 1800, but University of Pittsburgh 
; was founded in 1787, 13 years before his birth)
(get-model)