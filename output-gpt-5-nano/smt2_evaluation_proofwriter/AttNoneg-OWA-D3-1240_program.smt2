; Sorts
(declare-sort Person 0)

; Constants
(declare-const dave Person)
(declare-const gary Person)

; Predicates
(declare-fun furry (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun young (Person) Bool)

; Facts
(assert (furry dave))
(assert (cold gary))
(assert (furry gary))
(assert (rough gary))
(assert (smart gary))
(assert (white gary))
(assert (young gary))

; Rules
; If Gary is furry and Gary is round then Gary is young
(assert (=> (and (furry gary) (round gary)) (young gary)))

; Furry things are white
(assert (forall ((p Person)) (=> (furry p) (white p))))
; All smart things are cold
(assert (forall ((p Person)) (=> (smart p) (cold p))))
; If something is smart and white then it is cold
(assert (forall ((p Person)) (=> (and (smart p) (white p)) (cold p))))
; If something is white then it is smart
(assert (forall ((p Person)) (=> (white p) (smart p))))
; If something is white and smart then it is cold (redundant with previous)
(assert (forall ((p Person)) (=> (and (white p) (smart p)) (cold p))))
; Round, rough things are white
(assert (forall ((p Person)) (=> (and (round p) (rough p)) (white p))))
; Young, cold things are furry
(assert (forall ((p Person)) (=> (and (young p) (cold p)) (furry p))))

; Query: Dave is white? Test by negating the conclusion to check entailment
(assert (not (white dave)))

; Check satisfiability
(check-sat)