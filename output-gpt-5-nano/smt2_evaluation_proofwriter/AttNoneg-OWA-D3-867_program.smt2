; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun white (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun nice (Person) Bool)

; Declare constants
(declare-const Bob Person)
(declare-const Charlie Person)
(declare-const Fiona Person)
(declare-const Harry Person)

; Knowledge base
(assert (white Bob))
(assert (smart Charlie))
(assert (cold Fiona))
(assert (smart Harry))

; Rules
; 1. If someone is smart then they are young.
(assert (forall ((p Person)) (=> (smart p) (young p))))
; 2. All white, rough people are quiet.
(assert (forall ((p Person)) (=> (and (white p) (rough p)) (quiet p))))
; 3. All smart people are quiet.
(assert (forall ((p Person)) (=> (smart p) (quiet p))))
; 4. If someone is smart and white then they are young.
(assert (forall ((p Person)) (=> (and (smart p) (white p)) (young p))))
; 5. All young people are quiet.
(assert (forall ((p Person)) (=> (young p) (quiet p))))
; 6. All cold, quiet people are nice.
(assert (forall ((p Person)) (=> (and (cold p) (quiet p)) (nice p))))
; 7. Cold people are smart.
(assert (forall ((p Person)) (=> (cold p) (smart p))))
; 8. All white people are young.
(assert (forall ((p Person)) (=> (white p) (young p))))

; Test: Is Fiona quiet?
(assert (quiet Fiona))

; Check satisfiability and get a model
(check-sat)
(get-model)