; Sorts
(declare-sort Person 0)

; Constants
(declare-const tiffany-alston Person)

; Predicates
(declare-fun is-legislator (Person) Bool)
(declare-fun found-guilty (Person) Bool)
(declare-fun suspended (Person) Bool)

; Knowledge base
(assert (is-legislator tiffany-alston))
(assert (found-guilty tiffany-alston))
; Rule: If a legislator is guilty of stealing government funds, they are suspended
(assert (forall ((p Person))
  (=> (and (is-legislator p) (found-guilty p))
      (suspended p))))

; Test: Evaluate the given statement
; Statement: Tiffany T. Alston was suspended from the Maryland House of Delegates.
(assert (suspended tiffany-alston))

; Check satisfiability to determine truth of the statement
(check-sat)
(get-model)