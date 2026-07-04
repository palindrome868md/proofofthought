; Declare Sorts
(declare-sort Person 0)

; Declare Functions (Predicates)
(declare-fun is-kid (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-elderly (Person) Bool)
(declare-fun is-pirate (Person) Bool)
(declare-fun is-seafarer (Person) Bool)
(declare-fun is-toddler (Person) Bool)

; Declare Constants
(declare-const nancy Person)

; Premises (Instantiated for Nancy)
; 1. All kids are young.
(assert (=> (is-kid nancy) (is-young nancy)))

; 2. All toddlers are kids.
(assert (=> (is-toddler nancy) (is-kid nancy)))

; 3. If someone is young, then they are not elderly.
(assert (=> (is-young nancy) (not (is-elderly nancy))))

; 4. All pirates are seafarers.
(assert (=> (is-pirate nancy) (is-seafarer nancy)))

; 5. If Nancy is not a pirate, then Nancy is young.
(assert (=> (not (is-pirate nancy)) (is-young nancy)))

; 6. If Nancy is not a toddler, then Nancy is a seafarer.
(assert (=> (not (is-toddler nancy)) (is-seafarer nancy)))

; Statement to Verify:
; "If Nancy is not either a pirate or a toddler, then she is young and is a kid."
; Logical Form: (not (or (is-pirate nancy) (is-toddler nancy))) => (and (is-young nancy) (is-kid nancy))
; Equivalent to: (and (not (is-pirate nancy)) (not (is-toddler nancy))) => (and (is-young nancy) (is-kid nancy))

; Assert the Statement
(assert (=> (and (not (is-pirate nancy)) (not (is-toddler nancy))) 
            (and (is-young nancy) (is-kid nancy))))

; Check Satisfiability
; sat = True (Statement is consistent with premises)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)