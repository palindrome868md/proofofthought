; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Properties)
(declare-fun is-young (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-nice (Person) Bool)

; 3. Declare constants
(declare-const Alan Person)
(declare-const Bob Person)
(declare-const Charlie Person)
(declare-const Eric Person)

; 4. Assert Knowledge Base (Facts about individuals)
; Alan is a young, rough person who is rather round but is also kind
(assert (is-young Alan))
(assert (is-rough Alan))
(assert (is-round Alan))
(assert (is-kind Alan))

; Bob is cold but nice with red hair and dresses green
(assert (is-cold Bob))
(assert (is-nice Bob))
(assert (is-red Bob))
(assert (is-green Bob))

; Charlie might be rough and red but he's actually very kind
; "might be" implies uncertainty, so we only assert definite facts
(assert (is-kind Charlie))

; Eric seems to be round
(assert (is-round Eric))

; 5. Assert Knowledge Base (Rules)
; Rule: rough AND red AND green -> blue
(assert (forall ((p Person))
  (=> (and (is-rough p) (is-red p) (is-green p))
      (is-blue p))))

; Rule: big AND round AND kind -> rough
(assert (forall ((p Person))
  (=> (and (is-big p) (is-round p) (is-kind p))
      (is-rough p))))

; Rule: kind AND red -> green
(assert (forall ((p Person))
  (=> (and (is-kind p) (is-red p))
      (is-green p))))

; Rule: kind AND rough -> red
(assert (forall ((p Person))
  (=> (and (is-kind p) (is-rough p))
      (is-red p))))

; Rule: blue AND red AND big -> cold
(assert (forall ((p Person))
  (=> (and (is-blue p) (is-red p) (is-big p))
      (is-cold p))))

; 6. Verification
; Question: Alan is not red.
; We assert the statement to test its consistency with the Knowledge Base.
; If unsat, the statement is False (Alan IS red).
; If sat, the statement is True/Possible (Alan is NOT red).
(assert (not (is-red Alan)))

; 7. Check satisfiability
(check-sat)
(get-model)