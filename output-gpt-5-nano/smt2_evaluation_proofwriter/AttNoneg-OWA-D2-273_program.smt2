; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const Bob Person)
(declare-const Charlie Person)

; Declare predicates
(declare-fun red (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun young (Person) Bool)

; Knowledge base
(assert (red Bob))
(assert (rough Bob))
(assert (smart Charlie))

; Rules
(assert (forall ((x Person)) (=> (big x) (blue x))))
(assert (=> (big Charlie) (rough Charlie)))
(assert (=> (and (kind Bob) (big Bob)) (young Bob)))
(assert (=> (young Bob) (big Bob)))
(assert (forall ((x Person)) (=> (blue x) (young x))))
(assert (forall ((x Person)) (=> (red x) (blue x))))
(assert (forall ((x Person)) (=> (smart x) (kind x))))
(assert (=> (smart Charlie) (kind Charlie)))

; Test: Bob is rough
(assert (rough Bob))

; Check satisfiability
(check-sat)
(get-model)