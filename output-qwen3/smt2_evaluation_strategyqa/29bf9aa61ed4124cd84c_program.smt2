; Question: Will the Albany in Georgia reach a hundred thousand occupants before the one in New York?

; Declare sorts
(declare-sort City 0)

; Declare functions
(declare-fun current-population (City) Int)
(declare-fun annual-growth (City) Int)
(declare-fun years-to-100k (City) Int)

; Declare constants for the two Albanys
(declare-const albany-ga City)
(declare-const albany-ny City)

; Knowledge Base: Current population facts (based on census data)
; Albany, New York has a larger current population than Albany, Georgia
(assert (= (current-population albany-ny) 97000))
(assert (= (current-population albany-ga) 72000))

; Knowledge Base: Growth rate facts
; Albany, New York (state capital) has higher growth rate
(assert (= (annual-growth albany-ny) 1000))
(assert (= (annual-growth albany-ga) 500))

; Calculate years needed to reach 100,000 population
; Formula: years = (100000 - current_population) / annual_growth
(assert (= (years-to-100k albany-ny) 
           (div (- 100000 (current-population albany-ny)) (annual-growth albany-ny))))
(assert (= (years-to-100k albany-ga) 
           (div (- 100000 (current-population albany-ga)) (annual-growth albany-ga))))

; Test the question: Will Albany GA reach 100k BEFORE Albany NY?
; This asserts that Albany GA needs fewer years than Albany NY
(assert (< (years-to-100k albany-ga) (years-to-100k albany-ny)))

; Check satisfiability
; If UNSAT: Albany GA will NOT reach 100k before Albany NY (Answer: NO)
; If SAT: Albany GA WILL reach 100k before Albany NY (Answer: YES)
(check-sat)
(get-model)