; Sorts
(declare-sort Person 0)

; Predicates (uninterpreted functions)
(declare-fun smart (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun kind  (Person) Bool)

; Constants
(declare-const bob   Person)
(declare-const erin  Person)

; Knowledge base (facts)
(assert (smart bob))      ; Bob is smart
(assert (cold erin))       ; Erin is cold
(assert (young erin))      ; Erin is young

; Rules
; 1) Furry things are cold
(assert (forall ((p Person)) (=> (furry p) (cold p))))
; 2) All furry things are white
(assert (forall ((p Person)) (=> (furry p) (white p))))
; 3) All cold, smart things are rough
(assert (forall ((p Person)) (=> (and (cold p) (smart p)) (rough p))))
; 4) Young things are smart
(assert (forall ((p Person)) (=> (young p) (smart p))))
; 5) If Bob is white then Bob is young
(assert (=> (white bob) (young bob)))
; 6) If Bob is white and Bob is cold then Bob is kind
(assert (=> (and (white bob) (cold bob)) (kind bob)))

; Query: Erin is not rough
(assert (not (rough erin)))

; Check satisfiability (one and only one check-sat as required)
(check-sat)
(get-model)