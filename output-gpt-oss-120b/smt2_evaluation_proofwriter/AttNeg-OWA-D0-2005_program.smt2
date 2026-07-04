; Declare an uninterpreted sort for entities
(declare-sort Entity 0)

; Declare predicates
(declare-fun furry (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun young (Entity) Bool)

; Declare the constant Harry
(declare-const harry Entity)

; Knowledge base facts
(assert (furry harry))
(assert (green harry))
(assert (kind harry))
(assert (red harry))
(assert (rough harry))
(assert (round harry))
(assert (not (young harry)))

; Rules
(assert (=> (and (young harry) (green harry)) (kind harry)))          ; If Harry is young and green then kind
(assert (=> (not (young harry)) (rough harry)))                       ; If Harry is not young then rough
(assert (forall ((x Entity)) (=> (and (rough x) (young x)) (furry x)))) ; Rough & young -> furry

; Test the query: "Harry is furry."
(assert (furry harry))

; Check satisfiability (sat means the statement is entailed/consistent)
(check-sat)
(get-model)