; Declare sort
(declare-sort Person 0)

; Declare predicates
(declare-fun quiet (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)

; Declare individuals
(declare-const anne Person)
(declare-const bob Person)
(declare-const erin Person)
(declare-const fiona Person)

; Facts about individuals
(assert (quiet anne))
(assert (smart anne))
(assert (white anne))
(assert (not (young anne)))

(assert (young bob))

(assert (not (young erin)))

(assert (big fiona))
(assert (quiet fiona))
(assert (red fiona))
(assert (smart fiona))

; Knowledge base rules
; White -> Quiet
(assert (forall ((p Person)) (=> (white p) (quiet p))))
; Young -> Big
(assert (forall ((p Person)) (=> (young p) (big p))))
; Young & Smart -> Round
(assert (forall ((p Person)) (=> (and (young p) (smart p)) (round p))))
; Smart & Quiet -> Round
(assert (forall ((p Person)) (=> (and (smart p) (quiet p)) (round p))))
; Quiet & Big -> Red
(assert (forall ((p Person)) (=> (and (quiet p) (big p)) (red p))))
; Anne-specific rule
(assert (=> (and (big anne) (young anne)) (round anne)))
; Big -> Smart
(assert (forall ((p Person)) (=> (big p) (smart p))))
; Smart -> White
(assert (forall ((p Person)) (=> (smart p) (white p))))

; Test question: Bob is not quiet
(assert (not (quiet bob)))

; Check satisfiability and model
(check-sat)
(get-model)