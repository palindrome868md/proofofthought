; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-blue (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-quiet (Person) Bool)

; 3. Declare constants (people)
(declare-const Charlie Person)
(declare-const Dave Person)
(declare-const Erin Person)
(declare-const Harry Person)

; 4. Assert knowledge base (facts)
; Charlie facts
(assert (is-blue Charlie))
(assert (is-green Charlie))

; Dave facts
(assert (is-rough Dave))

; Erin facts
(assert (not (is-cold Erin)))
(assert (is-green Erin))
(assert (is-rough Erin))
(assert (is-young Erin))

; Harry facts
(assert (is-green Harry))
(assert (is-red Harry))
(assert (is-rough Harry))
(assert (not (is-young Harry)))

; 5. Assert knowledge base (rules)
; All rough people are red
(assert (forall ((p Person)) (=> (is-rough p) (is-red p))))

; If someone is blue then they are rough
(assert (forall ((p Person)) (=> (is-blue p) (is-rough p))))

; All green people are rough
(assert (forall ((p Person)) (=> (is-green p) (is-rough p))))

; If someone is quiet then they are cold
(assert (forall ((p Person)) (=> (is-quiet p) (is-cold p))))

; If Harry is blue then Harry is green
(assert (=> (is-blue Harry) (is-green Harry)))

; If Dave is blue and Dave is red then Dave is quiet
(assert (=> (and (is-blue Dave) (is-red Dave)) (is-quiet Dave)))

; Rough, red people are blue
(assert (forall ((p Person)) (=> (and (is-rough p) (is-red p)) (is-blue p))))

; Green, cold people are not quiet
(assert (forall ((p Person)) (=> (and (is-green p) (is-cold p)) (not (is-quiet p)))))

; Cold people are not young
(assert (forall ((p Person)) (=> (is-cold p) (not (is-young p)))))

; 6. Verification
; Question: Charlie is not red.
; To verify this, we assert the claim and check for satisfiability.
; Logic: Charlie is Blue -> Rough -> Red. Thus Charlie IS Red.
; Asserting "Charlie is not red" should lead to a contradiction (unsat).
(assert (not (is-red Charlie)))

; 7. Check satisfiability
(check-sat)
(get-model)