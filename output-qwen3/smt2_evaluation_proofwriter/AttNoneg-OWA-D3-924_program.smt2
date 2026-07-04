; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Constants (Individuals)
(declare-const anne Person)
(declare-const bob Person)

; 3. Declare Functions (Properties)
(declare-fun is-big (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-white (Person) Bool)
(declare-fun is-blue (Person) Bool)

; 4. Assert Knowledge Base (Facts)
; Anne's facts
(assert (is-big anne))
(assert (is-red anne))

; Bob's facts
(assert (is-big bob))
(assert (is-kind bob))
(assert (is-round bob))
(assert (is-smart bob))
(assert (is-white bob))

; 5. Assert Knowledge Base (Rules)
; If Anne is kind then Anne is red.
(assert (=> (is-kind anne) (is-red anne)))

; Red, smart people are white.
(assert (forall ((x Person))
  (=> (and (is-red x) (is-smart x))
      (is-white x))))

; If Bob is white then Bob is kind.
(assert (=> (is-white bob) (is-kind bob)))

; If someone is big and red then they are kind.
(assert (forall ((x Person))
  (=> (and (is-big x) (is-red x))
      (is-kind x))))

; All white, round people are smart.
(assert (forall ((x Person))
  (=> (and (is-white x) (is-round x))
      (is-smart x))))

; All kind people are round.
(assert (forall ((x Person))
  (=> (is-kind x)
      (is-round x))))

; All round, blue people are white.
(assert (forall ((x Person))
  (=> (and (is-round x) (is-blue x))
      (is-white x))))

; Big people are blue.
(assert (forall ((x Person))
  (=> (is-big x)
      (is-blue x))))

; 6. Verification
; Question: "Anne is not kind."
; We assert the statement to test if it is consistent with the KB.
(assert (not (is-kind anne)))

; 7. Check Satisfiability
(check-sat)
(get-model)