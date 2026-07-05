; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun is-legislator (Person) Bool)
(declare-fun found-guilty (Person) Bool)
(declare-fun suspended (Person) Bool)

; Constants
(declare-const tiffany-alston Person)

; Knowledge base (premises)
(assert (is-legislator tiffany-alston))
(assert (found-guilty tiffany-alston))

; Rule: If a legislator is found guilty of stealing government funds, they will be suspended from office
(assert (forall ((p Person))
  (=> (and (is-legislator p) (found-guilty p))
      (suspended p))))

; Test: "Tiffany T. Alston was not suspended from the Maryland House of Delegates."
(assert (not (suspended tiffany-alston)))

; Check satisfiability
(check-sat)