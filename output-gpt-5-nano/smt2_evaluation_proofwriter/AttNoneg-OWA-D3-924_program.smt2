; Declared sorts
(declare-sort Person 0)

; Constants
(declare-const anne Person)
(declare-const bob Person)

; Predicates
(declare-fun big (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun blue (Person) Bool)

; Facts about Anne
(assert (big anne))
(assert (red anne))

; Facts about Bob (from the given information)
(assert (big bob))
(assert (kind bob))
(assert (round bob))
(assert (smart bob))
(assert (white bob))

; Conditional: If Anne is kind then Anne is red
(assert (=> (kind anne) (red anne)))

; Rules / knowledge base
; 1) If someone is big and red then they are kind
(assert (forall ((p Person))
  (=> (and (big p) (red p)) (kind p))))

; 2) Red and smart -> white
(assert (forall ((p Person))
  (=> (and (red p) (smart p)) (white p))))

; 3) White and round -> smart
(assert (forall ((p Person))
  (=> (and (white p) (round p)) (smart p))))

; 4) All kind -> round
(assert (forall ((p Person))
  (=> (kind p) (round p))))

; 5) Round and blue -> white
(assert (forall ((p Person))
  (=> (and (round p) (blue p)) (white p))))

; 6) Big -> blue
(assert (forall ((p Person))
  (=> (big p) (blue p))))

; 7) Bob-specific: If Bob white then Bob kind
(assert (=> (white bob) (kind bob)))

; Test scenario: Anne is not kind
(assert (not (kind anne)))

; Check satisfiability and provide a model if any
(check-sat)
(get-model)