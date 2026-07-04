; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-white (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-nice (Person) Bool)

; 3. Declare constants
(declare-const bob Person)
(declare-const charlie Person)
(declare-const fiona Person)
(declare-const harry Person)

; 4. Assert knowledge base (facts)
; Bob is white
(assert (is-white bob))
; Charlie is smart
(assert (is-smart charlie))
; Fiona is cold
(assert (is-cold fiona))
; Harry is smart
(assert (is-smart harry))

; Rules
; If someone is smart then they are young
(assert (forall ((p Person)) (=> (is-smart p) (is-young p))))
; All white, rough people are quiet
(assert (forall ((p Person)) (=> (and (is-white p) (is-rough p)) (is-quiet p))))
; All smart people are quiet
(assert (forall ((p Person)) (=> (is-smart p) (is-quiet p))))
; If someone is smart and white then they are young
(assert (forall ((p Person)) (=> (and (is-smart p) (is-white p)) (is-young p))))
; All young people are quiet
(assert (forall ((p Person)) (=> (is-young p) (is-quiet p))))
; All cold, quiet people are nice
(assert (forall ((p Person)) (=> (and (is-cold p) (is-quiet p)) (is-nice p))))
; Cold people are smart
(assert (forall ((p Person)) (=> (is-cold p) (is-smart p))))
; All white people are young
(assert (forall ((p Person)) (=> (is-white p) (is-young p))))

; 5. Verification
; Question: Fiona is quiet.
; We assert the statement to check if it is consistent (sat) or contradictory (unsat) with the KB.
; Based on logic: Fiona is Cold -> Cold is Smart -> Smart is Quiet. So this should be sat (True).
(assert (is-quiet fiona))

; Check satisfiability
(check-sat)
(get-model)