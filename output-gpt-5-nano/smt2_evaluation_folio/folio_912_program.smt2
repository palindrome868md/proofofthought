; Sorts
(declare-sort Person 0)

; Constants
(declare-const nancy Person)

; Predicates (Boolean functions)
(declare-fun kid (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun elderly (Person) Bool)
(declare-fun pirate (Person) Bool)
(declare-fun toddler (Person) Bool)
(declare-fun seafarer (Person) Bool)

; Knowledge base (premises)
; 1. All kids are young.
(assert (forall ((p Person)) (=> (kid p) (young p))))
; 2. All toddlers are kids.
(assert (forall ((p Person)) (=> (toddler p) (kid p))))
; 3. If someone is young, then they are not elderly.
(assert (forall ((p Person)) (=> (young p) (not (elderly p)))))
; 4. All pirates are seafarers.
(assert (forall ((p Person)) (=> (pirate p) (seafarer p))))
; 5. If Nancy is not a pirate, then Nancy is young.
(assert (=> (not (pirate nancy)) (young nancy)))
; 6. If Nancy is not a toddler, then Nancy is a seafarer.
(assert (=> (not (toddler nancy)) (seafarer nancy)))

; Test: "If Nancy is not either a pirate or a toddler, then she is young and is a kid."
; This is the formula A: (=> (and (not pirate Nancy) (not toddler Nancy)) (and (young Nancy) (kid Nancy)))
(assert (=> (and (not (pirate nancy)) (not (toddler nancy)))
            (and (young nancy) (kid nancy))))

; Check satisfiability to determine if the statement can be true given the premises
(check-sat)