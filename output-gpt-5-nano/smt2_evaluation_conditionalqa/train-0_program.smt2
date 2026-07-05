; Declare sorts
(declare-sort Person 0)

; Predicates
(declare-fun child-of (Person Person) Bool)
(declare-fun greater-right (Person Person) Bool)

; Constants
(declare-const father Person)
(declare-const me Person)
(declare-const uncle Person)

; Knowledge base (scenario)
; Me is a child of father
(assert (child-of me father))
; Uncle is not a child of father
(assert (not (child-of uncle father)))

; Rule: if q is a child of father and r is not a child of father, then q has greater-right over r
(assert (forall ((q Person) (r Person))
  (=> (child-of q father)
      (=> (not (child-of r father))
           (greater-right q r)))))

; Test: Do I have a greater right to probate over my uncle?
; Negate the claim to verify if it's entailed by the knowledge base
(assert (not (greater-right me uncle)))

; Check satisfiability to answer the question
(check-sat)