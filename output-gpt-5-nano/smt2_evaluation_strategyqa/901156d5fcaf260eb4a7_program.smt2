; Sorts
(declare-sort Species 0)
(declare-datatypes () ((Temp (cold) (warm))))

; Functions and constants
(declare-const anchovy Species)
(declare-fun count_in_temp (Species Temp) Int)

; Knowledge base
(assert (= (count_in_temp anchovy cold) 1000000))
(assert (= (count_in_temp anchovy warm) 600000))

; Test: Are there more anchovy in colder waters than warmer?
(assert (> (count_in_temp anchovy cold) (count_in_temp anchovy warm)))

; Check satisfiability
(check-sat)
(get-model)