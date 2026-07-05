; Sorts
(declare-sort Person 0)
(declare-sort Institution 0)

; Relationship: Did a person help establish an institution?
(declare-fun helped-establish (Person Institution) Bool)

; Constants
(declare-const millard-fillmore Person)
(declare-const university-of-pittsburgh Institution)

; Knowledge base: historical fact setup
; We assert that Millard Fillmore did NOT help establish the University of Pittsburgh
(assert (not (helped-establish millard-fillmore university-of-pittsburgh)))

; Test: Did Millard Fillmore help establish the University of Pittsburgh?
(assert (helped-establish millard-fillmore university-of-pittsburgh))

; Check satisfiability to answer the question
(check-sat)
(get-model)