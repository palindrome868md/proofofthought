; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const grandma Person)

; Declare predicates
(declare-fun has-dementia (Person) Bool)
(declare-fun understands-will (Person) Bool)
(declare-fun can-get-statutory-will (Person) Bool)

; Knowledge base
; Grandma has dementia
(assert (has-dementia grandma))

; Grandma may not understand making a will
(assert (not (understands-will grandma)))

; Rule: If someone does not understand making a will, they can obtain a statutory/will made on their behalf
(assert (forall ((p Person))
  (=> (not (understands-will p))
      (can-get-statutory-will p))))

; Test scenario: Can I make a will on her behalf? (i.e., is it possible to obtain a statutory will for grandma)
(assert (can-get-statutory-will grandma))

; Check satisfiability and provide a model
(check-sat)
(get-model)