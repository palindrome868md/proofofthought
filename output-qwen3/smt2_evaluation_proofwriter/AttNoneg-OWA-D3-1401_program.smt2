; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (properties)
(declare-fun is-cold (Person) Bool)
(declare-fun is-furry (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-white (Person) Bool)

; 3. Declare constants (individuals)
(declare-const charlie Person)
(declare-const dave Person)
(declare-const erin Person)

; 4. Assert knowledge base (facts)
; Charlie's properties
(assert (is-cold charlie))
(assert (is-furry charlie))
(assert (is-green charlie))
(assert (is-red charlie))
(assert (is-round charlie))
(assert (is-smart charlie))
(assert (is-white charlie))

; Dave's properties
(assert (is-cold dave))
(assert (is-green dave))

; Erin's properties
(assert (is-furry erin))

; Rules
; Green people are round
(assert (forall ((p Person)) (=> (is-green p) (is-round p))))

; Smart, green people are white
(assert (forall ((p Person)) (=> (and (is-smart p) (is-green p)) (is-white p))))

; Round people are smart
(assert (forall ((p Person)) (=> (is-round p) (is-smart p))))

; 5. Verify Question: Dave is round.
; Assert the statement to check
(assert (is-round dave))

; Check satisfiability
(check-sat)
(get-model)