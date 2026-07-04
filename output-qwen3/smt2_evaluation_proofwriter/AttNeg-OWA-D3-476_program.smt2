(declare-sort Person 0)

; Declare predicates (functions returning Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-green (Person) Bool)

; Declare constants (individuals)
(declare-const anne Person)
(declare-const bob Person)
(declare-const gary Person)
(declare-const harry Person)

; --- Knowledge Base ---

; Anne is not nice.
(assert (not (is-nice anne)))
; Anne is rough.
(assert (is-rough anne))
; Anne is smart.
(assert (is-smart anne))
; Bob is rough.
(assert (is-rough bob))
; Gary is nice.
(assert (is-nice gary))
; Gary is quiet.
(assert (is-quiet gary))
; Harry is rough.
(assert (is-rough harry))

; If Gary is big then Gary is cold.
(assert (=> (is-big gary) (is-cold gary)))

; All nice people are big.
(assert (forall ((p Person)) (=> (is-nice p) (is-big p))))

; If Gary is big then Gary is quiet.
(assert (=> (is-big gary) (is-quiet gary)))

; If someone is green then they are smart.
(assert (forall ((p Person)) (=> (is-green p) (is-smart p))))

; If Anne is quiet and Anne is not green then Anne is big.
(assert (=> (and (is-quiet anne) (not (is-green anne))) (is-big anne)))

; If someone is nice and not quiet then they are not rough.
(assert (forall ((p Person)) (=> (and (is-nice p) (not (is-quiet p))) (not (is-rough p)))))

; If someone is quiet and not big then they are not rough.
(assert (forall ((p Person)) (=> (and (is-quiet p) (not (is-big p))) (not (is-rough p)))))

; Cold people are rough.
(assert (forall ((p Person)) (=> (is-cold p) (is-rough p))))

; --- Verification ---
; Question: Gary is not cold.
; We assert the statement to check if it is consistent with the KB.
(assert (not (is-cold gary)))

(check-sat)
(get-model)