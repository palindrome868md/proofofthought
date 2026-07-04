; Declare sorts
(declare-sort Person 0)
(declare-sort Item 0)
(declare-sort Reference 0)

; Declare functions
(declare-fun is-actor (Person) Bool)
(declare-fun has-reference (Person Reference) Bool)
(declare-fun reference-involves (Reference Person) Bool)
(declare-fun reference-involves-item (Reference Item) Bool)
(declare-fun received (Person Item) Bool)

; Declare constants
(declare-const adam-sandler Person)
(declare-const cole-sprouse Person)
(declare-const scuba-man-doll Item)
(declare-const ref1 Reference)

; Knowledge base - Adam Sandler is an actor
(assert (is-actor adam-sandler))

; Knowledge base - Cole Sprouse is a person/actor
(assert (is-actor cole-sprouse))

; Knowledge base - Define what it means to get a reference
; A reference involves a person and potentially an item
(assert (forall ((p Person) (r Reference))
  (=> (has-reference p r)
      (reference-involves r p))))

; Test scenario: Adam Sandler gets a reference to Cole Sprouse AND a scuba man doll
; We assert this claim and check if it's satisfiable with the knowledge base
(assert (has-reference adam-sandler ref1))
(assert (reference-involves ref1 cole-sprouse))
(assert (reference-involves-item ref1 scuba-man-doll))
(assert (received adam-sandler scuba-man-doll))

; Check satisfiability - sat means the scenario is possible/true
(check-sat)
(get-model)