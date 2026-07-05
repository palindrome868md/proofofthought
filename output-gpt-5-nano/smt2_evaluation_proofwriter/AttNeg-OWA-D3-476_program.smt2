; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun nice (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun green (Person) Bool)

; Declare constants (individuals)
(declare-const anne Person)
(declare-const bob  Person)
(declare-const gary  Person)
(declare-const harry Person)

; Knowledge base: facts
(assert (not (nice anne)))   ; Anne is not nice
(assert (rough anne))         ; Anne is rough
(assert (smart anne))         ; Anne is smart

(assert (rough bob))           ; Bob is rough

(assert (nice gary))            ; Gary is nice
(assert (quiet gary))           ; Gary is quiet

(assert (rough harry))          ; Harry is rough

; Knowledge base: general rules
; All nice people are big
(assert (forall ((p Person)) (=> (nice p) (big p))))

; Cold -> rough
(assert (forall ((p Person)) (=> (cold p) (rough p))))

; If someone is quiet and not big then not rough
(assert (forall ((p Person)) (=> (and (quiet p) (not (big p))) (not (rough p)))))

; If someone is nice and not quiet then not rough
(assert (forall ((p Person)) (=> (and (nice p) (not (quiet p))) (not (rough p)))))

; If Gary is big then Gary is cold
(assert (=> (big gary) (cold gary)))

; If Gary is big then Gary is quiet
(assert (=> (big gary) (quiet gary)))

; If someone is green then they are smart
(assert (forall ((p Person)) (=> (green p) (smart p))))

; If Anne is quiet and Anne is not green then Anne is big
(assert (=> (and (quiet anne) (not (green anne))) (big anne)))

; Query test: "Gary is not cold."
(assert (not (cold gary)))

; Check satisfiability
(check-sat)