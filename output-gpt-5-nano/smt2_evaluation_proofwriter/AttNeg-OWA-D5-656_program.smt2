; Domain
(declare-sort Person 0)

; Constants
(declare-const anne  Person)
(declare-const charlie Person)
(declare-const erin    Person)
(declare-const harry   Person)

; Predicates
(declare-fun smart (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun nice  (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun young (Person) Bool)

; Knowledge base
(assert (smart anne))
(assert (not (blue charlie)))
(assert (quiet charlie))
(assert (not (nice erin)))
(assert (round erin))
(assert (green harry))
(assert (young harry))

; Rules
; Smart -> Green
(assert (forall ((p Person)) (=> (smart p) (green p))))
; If Anne round -> Anne young
(assert (=> (round anne) (young anne)))
; If blue and green -> not quiet
(assert (forall ((p Person)) (=> (and (blue p) (green p)) (not (quiet p)))))
; If green and smart -> round
(assert (forall ((p Person)) (=> (and (green p) (smart p)) (round p))))
; If young -> blue
(assert (forall ((p Person)) (=> (young p) (blue p))))
; Smart -> Nice
(assert (forall ((p Person)) (=> (smart p) (nice p))))
; If Harry quiet and not smart -> Harry young
(assert (=> (and (quiet harry) (not (smart harry))) (young harry)))

; Test: Harry is quiet
(assert (quiet harry))

; Verification
(check-sat)