; 1. Declare sorts
(declare-sort Circuit 0)
(declare-sort Bulb 0)

; 2. Declare functions
(declare-fun includes (Circuit Bulb) Bool)

; 3. Declare constants
(declare-const main Circuit)
(declare-const lightbulb Bulb)

; Knowledge base: the circuit includes the light bulb
(assert (includes main lightbulb))

; Test scenario: the negation of the query "The circuit includes the light bulb."
(assert (not (includes main lightbulb)))

; 4. Check satisfiability (one and only check-sat to answer the question)
(check-sat)