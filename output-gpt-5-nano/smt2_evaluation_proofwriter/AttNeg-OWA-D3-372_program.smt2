; Sorts
(declare-sort Person 0)

; Constants
(declare-const anne Person)
(declare-const fiona Person)
(declare-const gary  Person)

; Predicates
(declare-fun big    (Person) Bool)
(declare-fun red    (Person) Bool)
(declare-fun round  (Person) Bool)
(declare-fun blue   (Person) Bool)
(declare-fun white  (Person) Bool)
(declare-fun furry  (Person) Bool)
(declare-fun smart  (Person) Bool)

; Facts
(assert (big anne))
(assert (red anne))

(assert (big fiona))
(assert (not (round fiona)))
(assert (smart fiona))

(assert (furry gary))
(assert (smart gary))

; Rules
; If Anne is big and Anne is furry then Anne is blue
(assert (=> (and (big anne) (furry anne)) (blue anne)))
; If someone is white then they are round
(assert (forall ((p Person)) (=> (white p) (round p))))
; If Anne is blue then Anne is white
(assert (=> (blue anne) (white anne)))
; All red, big people are white
(assert (forall ((p Person)) (=> (and (red p) (big p)) (white p))))
; All white people are furry
(assert (forall ((p Person)) (=> (white p) (furry p))))
; If someone is furry then they are smart
(assert (forall ((p Person)) (=> (furry p) (smart p))))
; If Gary is blue and Gary is not big then Gary is smart
(assert (=> (and (blue gary) (not (big gary))) (smart gary)))
; If Fiona is red and Fiona is not furry then Fiona is smart
(assert (=> (and (red fiona) (not (furry fiona))) (smart fiona)))

; Test: Is "Gary is not smart" satisfiable?
(assert (not (smart gary)))
(check-sat)
(get-model)