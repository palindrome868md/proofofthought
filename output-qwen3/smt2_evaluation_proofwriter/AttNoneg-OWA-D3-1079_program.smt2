; SMT-LIB 2.0 Program for Theorem Proving
; Question: Erin is not cold.

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-furry (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-cold (Person) Bool)

; 3. Declare Constants (Individuals)
(declare-const Charlie Person)
(declare-const Erin Person)
(declare-const Fiona Person)

; 4. Assert Knowledge Base (Facts)
; Charlie is furry. Charlie is round. Charlie is young.
(assert (is-furry Charlie))
(assert (is-round Charlie))
(assert (is-young Charlie))

; Erin is furry. Erin is rough.
(assert (is-furry Erin))
(assert (is-rough Erin))

; Fiona is rough. Fiona is round.
(assert (is-rough Fiona))
(assert (is-round Fiona))

; 5. Assert Knowledge Base (Rules)
; Kind people are cold.
(assert (forall ((p Person)) (=> (is-kind p) (is-cold p))))

; If someone is big then they are round.
(assert (forall ((p Person)) (=> (is-big p) (is-round p))))

; All rough, furry people are big.
(assert (forall ((p Person)) (=> (and (is-rough p) (is-furry p)) (is-big p))))

; All kind, young people are cold.
(assert (forall ((p Person)) (=> (and (is-kind p) (is-young p)) (is-cold p))))

; If Erin is round and Erin is furry then Erin is cold.
(assert (=> (and (is-round Erin) (is-furry Erin)) (is-cold Erin)))

; If someone is big then they are kind.
(assert (forall ((p Person)) (=> (is-big p) (is-kind p))))

; If Fiona is cold then Fiona is rough.
(assert (=> (is-cold Fiona) (is-rough Fiona)))

; If Fiona is furry and Fiona is rough then Fiona is round.
(assert (=> (and (is-furry Fiona) (is-rough Fiona)) (is-round Fiona)))

; 6. Verification
; Question: Erin is not cold.
; We assert the statement to test its consistency with the KB.
; If unsat, the statement is False (Erin IS cold).
; If sat, the statement is Consistent (Erin is NOT cold).
(assert (not (is-cold Erin)))

; 7. Check Satisfiability
(check-sat)
(get-model)