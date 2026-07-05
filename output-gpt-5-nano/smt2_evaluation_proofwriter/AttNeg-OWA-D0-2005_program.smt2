; Declare sorts
(declare-sort Person 0)

; Declare predicates (properties)
(declare-fun furry   (Person) Bool)
(declare-fun green   (Person) Bool)
(declare-fun kind    (Person) Bool)
(declare-fun red     (Person) Bool)
(declare-fun rough   (Person) Bool)
(declare-fun round   (Person) Bool)
(declare-fun young   (Person) Bool)

; Declare constants
(declare-const harry Person)

; Knowledge base (facts)
(assert (furry harry))
(assert (green harry))
(assert (kind harry))
(assert (red harry))
(assert (rough harry))
(assert (round harry))
(assert (not (young harry)))

; Rule: If Harry is young and green then Harry is kind
(assert (=> (and (young harry) (green harry)) (kind harry)))

; Rule: If Harry is not young then Harry is rough
(assert (=> (not (young harry)) (rough harry)))

; Rule: If something is rough and young then it is furry
(assert (forall ((p Person)) (=> (and (rough p) (young p)) (furry p))))

; Test scenario: Would Harry be furry?
(assert (furry harry))  ; test query

; Check satisfiability and provide a model
(check-sat)
(get-model)