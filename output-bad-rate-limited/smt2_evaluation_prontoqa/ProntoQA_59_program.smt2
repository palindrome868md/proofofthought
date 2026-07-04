; Declare sorts
(declare-sort Person 0)

; Declare predicates (classes and properties)
(declare-fun is-rompus (Person) Bool)
(declare-fun is-wumpus (Person) Bool)
(declare-fun is-tumpus (Person) Bool)
(declare-fun is-yumpus (Person) Bool)
(declare-fun is-vumpus (Person) Bool)
(declare-fun is-zumpus (Person) Bool)
(declare-fun is-numpus (Person) Bool)
(declare-fun is-impus (Person) Bool)
(declare-fun is-dumpus (Person) Bool)
(declare-fun is-jompus (Person) Bool)

; Additional predicates used in the reasoning
(declare-fun nervous (Person) Bool)
(declare-fun mean (Person) Bool)
(declare-fun brown (Person) Bool)
(declare-fun large (Person) Bool)
(declare-fun earthy (Person) Bool)
(declare-fun sour (Person) Bool)
(declare-fun transparent (Person) Bool)

; Declare the test subject
(declare-const max Person)

; Knowledge base (facts and rules)

; Given: Max is a vumpus
(assert (is-vumpus max))

; Rules (chains implied by the problem statement)

; Vumpus -> Zumpus
(assert (forall ((p Person)) (=> (is-vumpus p) (is-zumpus p))))
; Zumpus -> Numpus
(assert (forall ((p Person)) (=> (is-zumpus p) (is-numpus p))))
; Numpus -> Impus
(assert (forall ((p Person)) (=> (is-numpus p) (is-impus p))))
; Impus -> Dumpus
(assert (forall ((p Person)) (=> (is-impus p) (is-dumpus p))))
; Dumpus -> not nervous
(assert (forall ((p Person)) (=> (is-dumpus p) (not (nervous p)))))

; Additional related rules (not essential for the direct question but align with the narrative)
; Numpus not sour
(assert (forall ((p Person)) (=> (is-numpus p) (not (sour p)))))
; Impus -> Transparent
(assert (forall ((p Person)) (=> (is-impus p) (transparent p))))
; Dumpus -> Jompus
(assert (forall ((p Person)) (=> (is-dumpus p) (is-jompus p))))
; Wumpus -> Yumpus and Wumpus -> Brown
(assert (forall ((p Person)) (=> (is-wumpus p) (is-yumpus p))))
(assert (forall ((p Person)) (=> (is-wumpus p) (brown p))))
; Yumpus -> Large and Yumpus -> Vumpus
(assert (forall ((p Person)) (=> (is-yumpus p) (large p))))
(assert (forall ((p Person)) (=> (is-yumpus p) (is-vumpus p))))
; Rompus -> Wumpus and Rompus -> Mean
(assert (forall ((p Person)) (=> (is-rompus p) (is-wumpus p))))
(assert (forall ((p Person)) (=> (is-rompus p) (mean p))))

; Test scenario: Is Max not nervous?
(assert (not (nervous max)))

; Check satisfiability and produce a model
(check-sat)
(get-model)