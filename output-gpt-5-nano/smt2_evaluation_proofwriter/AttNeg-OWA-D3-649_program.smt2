; Declare sorts
(declare-sort Person 0)

; Declare predicates (functions)
(declare-fun big (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun kind (Person) Bool)

; Declare constants
(declare-const anne Person)
(declare-const charlie Person)
(declare-const dave Person)
(declare-const erin Person)

; Knowledge base
(assert (big anne))
(assert (not (blue charlie)))
(assert (kind dave))
(assert (not (big erin)))

; Rules
(assert (forall ((p Person)) (=> (red p) (not (young p)))))
(assert (forall ((p Person)) (=> (nice p) (blue p))))
(assert (forall ((p Person)) (=> (and (kind p) (not (round p))) (blue p))))
(assert (forall ((p Person)) (=> (and (big p) (blue p)) (red p))))
(assert (forall ((p Person)) (=> (big p) (red p))))
(assert (forall ((p Person)) (=> (kind p) (big p))))

; Test scenario: "Anne is not big."
(assert (not (big anne)))

; Check satisfiability
(check-sat)