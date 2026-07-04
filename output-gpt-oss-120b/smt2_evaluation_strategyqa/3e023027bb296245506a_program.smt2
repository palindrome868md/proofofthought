; -------------------------------------------------
; Sort declarations
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Place 0)

; -------------------------------------------------
; Predicate (function) declarations
; -------------------------------------------------
(declare-fun on-diet (Person) Bool)
(declare-fun skip-lunch-at (Person Place) Bool)

; -------------------------------------------------
; Constant declarations (the individuals involved)
; -------------------------------------------------
(declare-const me Person)
(declare-const mcdonalds Place)

; -------------------------------------------------
; Knowledge base
; -------------------------------------------------
; Premise: "me" is on a diet
(assert (on-diet me))

; Rule: If someone is on a diet, they must skip lunch at McDonald's
(assert (forall ((p Person))
        (=> (on-diet p)
            (skip-lunch-at p mcdonalds))))

; -------------------------------------------------
; Query: "Would you have to skip lunch at McDonald's?"
; -------------------------------------------------
(assert (skip-lunch-at me mcdonalds))

; -------------------------------------------------
; Solve
; -------------------------------------------------
(check-sat)
(get-model)