; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Properties)
(declare-fun is-red (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-white (Person) Bool)
(declare-fun is-big (Person) Bool)

; 3. Declare constants
(declare-const dave Person)

; 4. Assert knowledge base (facts)
; Premise 1: Dave is red.
(assert (is-red dave))
; Premise 2: Dave is rough.
(assert (is-rough dave))
; Premise 3: Dave is round.
(assert (is-round dave))
; Premise 4: All kind people are round.
(assert (forall ((p Person))
  (=> (is-kind p) (is-round p))))
; Premise 5: If Dave is white and Dave is big then Dave is rough.
(assert (=> (and (is-white dave) (is-big dave)) (is-rough dave)))

; 5. Verify Question: "Dave is rough."
; Assert the statement to test consistency with KB
(assert (is-rough dave))

; Check satisfiability
; Expected: sat (True, because it is explicitly in the KB)
(check-sat)
(get-model)