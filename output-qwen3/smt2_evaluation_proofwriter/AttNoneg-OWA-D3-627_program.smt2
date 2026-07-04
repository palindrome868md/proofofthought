; Declare sorts
(declare-sort Person 0)

; Declare functions (predicates)
(declare-fun furry (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun rough (Person) Bool)

; Declare constants (people)
(declare-const Anne Person)
(declare-const Dave Person)
(declare-const Fiona Person)
(declare-const Gary Person)

; Assert knowledge base (facts)
(assert (furry Anne))
(assert (cold Dave))
(assert (furry Dave))
(assert (green Dave))
(assert (nice Dave))
(assert (red Dave))
(assert (round Dave))
(assert (cold Fiona))
(assert (red Fiona))
(assert (rough Gary))

; Assert knowledge base (rules)
; All round, furry people are red.
(assert (forall ((p Person)) (=> (and (round p) (furry p)) (red p))))
; All nice, red people are furry.
(assert (forall ((p Person)) (=> (and (nice p) (red p)) (furry p))))
; All red people are round.
(assert (forall ((p Person)) (=> (red p) (round p))))
; If someone is furry and cold then they are rough.
(assert (forall ((p Person)) (=> (and (furry p) (cold p)) (rough p))))
; Round people are furry.
(assert (forall ((p Person)) (=> (round p) (furry p))))
; All furry people are red.
(assert (forall ((p Person)) (=> (furry p) (red p))))
; If Dave is nice and Dave is furry then Dave is green.
(assert (=> (and (nice Dave) (furry Dave)) (green Dave)))
; If Anne is red then Anne is nice.
(assert (=> (red Anne) (nice Anne)))

; Verification: Anne is furry
(assert (furry Anne))

; Check satisfiability
(check-sat)
(get-model)