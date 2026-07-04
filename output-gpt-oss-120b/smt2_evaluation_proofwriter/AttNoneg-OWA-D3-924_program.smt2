; Declare the Person sort
(declare-sort Person 0)

; Declare predicates (uninterpreted Boolean functions)
(declare-fun big   (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun kind  (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun blue  (Person) Bool)

; Declare the individuals
(declare-const anne Person)
(declare-const bob  Person)

; ----- Knowledge base (facts) -----
(assert (big anne))
(assert (red anne))

(assert (big bob))
(assert (kind bob))
(assert (round bob))
(assert (smart bob))
(assert (white bob))

; ----- Rules -----
; If Anne is kind then Anne is red.
(assert (=> (kind anne) (red anne)))

; Red, smart people are white.
(assert (forall ((x Person))
        (=> (and (red x) (smart x)) (white x))))

; If Bob is white then Bob is kind.
(assert (=> (white bob) (kind bob)))

; If someone is big and red then they are kind.
(assert (forall ((x Person))
        (=> (and (big x) (red x)) (kind x))))

; All white, round people are smart.
(assert (forall ((x Person))
        (=> (and (white x) (round x)) (smart x))))

; All kind people are round.
(assert (forall ((x Person))
        (=> (kind x) (round x))))

; All round, blue people are white.
(assert (forall ((x Person))
        (=> (and (round x) (blue x)) (white x))))

; Big people are blue.
(assert (forall ((x Person))
        (=> (big x) (blue x))))

; ----- Test the statement: "Anne is not kind" -----
(assert (not (kind anne)))

; Check whether the knowledge base can accommodate the statement
(check-sat)
(get-model)