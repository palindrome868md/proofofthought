; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const tiffany Person)

; Predicates
(declare-fun is-legislator (Person) Bool)
(declare-fun found-guilty (Person) Bool)
(declare-fun suspended (Person) Bool)

; Knowledge base
(assert (is-legislator tiffany))
(assert (found-guilty tiffany))

; Rule: If a legislator is found guilty, they will be suspended
(assert (=> (and (is-legislator tiffany) (found-guilty tiffany))
            (suspended tiffany)))

; Test: "Tiffany T. Alston was not suspended from the Maryland House of Delegates."
; This asserts the negation of the statement to verify its truth value
(assert (not (suspended tiffany)))

; Check satisfiability
(check-sat)
(get-model)