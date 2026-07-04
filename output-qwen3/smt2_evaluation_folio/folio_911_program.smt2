; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-kid (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-toddler (Person) Bool)
(declare-fun is-elderly (Person) Bool)
(declare-fun is-pirate (Person) Bool)
(declare-fun is-seafarer (Person) Bool)

; 3. Declare constants
(declare-const nancy Person)

; 4. Assert knowledge base (premises)
; Premise 1: All kids are young.
(assert (forall ((x Person))
  (=> (is-kid x) (is-young x))))

; Premise 2: All toddlers are kids.
(assert (forall ((x Person))
  (=> (is-toddler x) (is-kid x))))

; Premise 3: If someone is young, then they are not elderly.
(assert (forall ((x Person))
  (=> (is-young x) (not (is-elderly x)))))

; Premise 4: All pirates are seafarers.
(assert (forall ((x Person))
  (=> (is-pirate x) (is-seafarer x))))

; Premise 5: If Nancy is not a pirate, then Nancy is young.
(assert (=> (not (is-pirate nancy)) (is-young nancy)))

; Premise 6: If Nancy is not a toddler, then Nancy is a seafarer.
(assert (=> (not (is-toddler nancy)) (is-seafarer nancy)))

; 5. Assert the statement to verify
; Statement: Nancy is either both a pirate and a toddler, or neither a pirate nor a toddler.
(assert (or 
  (and (is-pirate nancy) (is-toddler nancy))
  (and (not (is-pirate nancy)) (not (is-toddler nancy)))
))

; 6. Check satisfiability
(check-sat)
(get-model)