; Sorts
(declare-sort Person 0)

; Functions
(declare-fun admits-hot-reading (Person) Bool)
(declare-fun trustworthy (Person) Bool)

; Constants
(declare-const psychic1 Person)

; Knowledge base
; If a person admits hot reading, they are not trustworthy
(assert (forall ((p Person))
  (=> (admits-hot-reading p)
      (not (trustworthy p)))))

; Fact: the psychic admits to hot reading
(assert (admits-hot-reading psychic1))

; Test: Would this psychic be trustworthy?
(assert (trustworthy psychic1))

; Check satisfiability to answer the question
(check-sat)