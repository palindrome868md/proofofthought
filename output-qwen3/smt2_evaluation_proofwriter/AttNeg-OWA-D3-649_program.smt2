; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun big (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun round (Person) Bool)

; 3. Declare constants (Individuals)
(declare-const anne Person)
(declare-const charlie Person)
(declare-const dave Person)
(declare-const erin Person)

; 4. Assert knowledge base (Facts)
(assert (big anne))
(assert (not (blue charlie)))
(assert (kind dave))
(assert (not (big erin)))

; 5. Assert knowledge base (Rules)
; If someone is red then they are not young
(assert (forall ((x Person)) (=> (red x) (not (young x)))))

; If someone is nice then they are blue
(assert (forall ((x Person)) (=> (nice x) (blue x))))

; If someone is kind and not round then they are blue
(assert (forall ((x Person)) (=> (and (kind x) (not (round x))) (blue x))))

; Big, blue people are red
(assert (forall ((x Person)) (=> (and (big x) (blue x)) (red x))))

; All big people are red
(assert (forall ((x Person)) (=> (big x) (red x))))

; Kind people are big
(assert (forall ((x Person)) (=> (kind x) (big x))))

; 6. Verification: "Anne is not big."
; To test this statement, we assert it. 
; If the result is 'unsat', the statement contradicts the knowledge base (is False).
; If the result is 'sat', the statement is consistent (is True/Possible).
(assert (not (big anne)))

; 7. Check satisfiability
(check-sat)
(get-model)