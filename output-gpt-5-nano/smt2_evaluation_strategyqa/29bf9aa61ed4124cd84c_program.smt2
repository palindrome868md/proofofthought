(set-logic AUFLIA)
; Sort for cities
(declare-sort City 0)

; Function: year when a city reaches 100k inhabitants
(declare-fun year_reach_100k (City) Int)

; City constants
(declare-const Albany_GA City)
(declare-const Albany_NY City)

; Knowledge base (facts)
(assert (> (year_reach_100k Albany_GA) 0))
(assert (> (year_reach_100k Albany_NY) 0))

; Test scenario: Albany GA reaches 100k before Albany NY
(assert (< (year_reach_100k Albany_GA) (year_reach_100k Albany_NY)))

; Check satisfiability to answer the question
(check-sat)
(get-model)