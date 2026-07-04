; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-big (Person) Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-furry (Person) Bool)
(declare-fun is-round (Person) Bool)

; 3. Declare constants
(declare-const anne Person)
(declare-const bob Person)
(declare-const fiona Person)
(declare-const gary Person)

; 4. Assert knowledge base (facts)
(assert (is-big anne))
(assert (is-nice anne))
(assert (is-big bob))
(assert (is-cold bob))
(assert (is-nice bob))
(assert (is-cold fiona))
(assert (not (is-cold gary)))

; Rules
; If someone is nice and cold then they are smart
(assert (forall ((p Person))
  (=> (and (is-nice p) (is-cold p))
      (is-smart p))))

; If someone is nice and big then they are cold
(assert (forall ((p Person))
  (=> (and (is-nice p) (is-big p))
      (is-cold p))))

; Furry people are round
(assert (forall ((p Person))
  (=> (is-furry p)
      (is-round p))))

; 5. Test: Anne is not cold
(assert (not (is-cold anne)))

; 6. Check satisfiability
(check-sat)
; Expected: unsat (Anne is nice and big, which implies she is cold. 
; Asserting she is NOT cold contradicts the knowledge base.)
(get-model)