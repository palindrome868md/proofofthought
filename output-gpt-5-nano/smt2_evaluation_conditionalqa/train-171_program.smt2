; Question: Can we go to court and get them to decide?

; Declare sorts
(declare-sort Person 0)

; Predicates
(declare-fun cannot-agree-finances (Person) Bool)
(declare-fun court-will-decide-finances (Person) Bool)
(declare-fun we-can-go-to-court (Person) Bool)

; Constants
(declare-const us Person)

; Knowledge base
; We could not agree on finances
(assert (cannot-agree-finances us))

; If you cannot agree on finances, the court will decide, and you can go to court
(assert (forall ((p Person)) (=> (cannot-agree-finances p) (court-will-decide-finances p))))
(assert (forall ((p Person)) (=> (cannot-agree-finances p) (we-can-go-to-court p))))

; Test scenario: Can the court decide for us?
(assert (court-will-decide-finances us))

; Check satisfiability and get a model
(check-sat)
(get-model)