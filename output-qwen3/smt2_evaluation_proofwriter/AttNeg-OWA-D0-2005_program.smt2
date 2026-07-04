; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun furry (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun young (Entity) Bool)

; 3. Declare constants
(declare-const harry Entity)

; 4. Assert knowledge base (Facts)
(assert (furry harry))
(assert (green harry))
(assert (kind harry))
(assert (red harry))
(assert (rough harry))
(assert (round harry))
(assert (not (young harry)))

; 5. Assert knowledge base (Rules)
; Rule: If Harry is young and Harry is green then Harry is kind.
(assert (=> (and (young harry) (green harry)) (kind harry)))

; Rule: If Harry is not young then Harry is rough.
(assert (=> (not (young harry)) (rough harry)))

; Rule: If something is rough and young then it is furry.
(assert (forall ((x Entity)) 
  (=> (and (rough x) (young x)) (furry x))))

; 6. Verification: Test the question "Harry is furry."
(assert (furry harry))

; 7. Check satisfiability
(check-sat)
(get-model)