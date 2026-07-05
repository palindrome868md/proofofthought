(declare-sort Person 0)
(declare-fun quiet (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-const erin Person)
(declare-const fiona Person)

(assert (quiet erin))
(assert (young erin))
(assert (furry fiona))

; All furry people are young
(assert (forall ((p Person)) (=> (furry p) (young p))))
; If someone is young then they are big
(assert (forall ((p Person)) (=> (young p) (big p))))

; Test: Fiona is not furry
(assert (not (furry fiona)))

(check-sat)