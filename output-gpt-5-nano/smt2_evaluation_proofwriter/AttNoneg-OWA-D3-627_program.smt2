; Anne/Dave problem translated to SMT-LIB 2.0

; Sorts
(declare-sort Person 0)

; Predicates (uninterpreted)
(declare-fun furry (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun rough (Person) Bool)

; Constants / individuals
(declare-const anne Person)
(declare-const dave Person)
(declare-const fiona Person)
(declare-const gary Person)

; Facts
(assert (furry anne))
(assert (cold dave))
(assert (furry dave))
(assert (green dave))
(assert (nice dave))
(assert (red dave))
(assert (round dave))
(assert (cold fiona))
(assert (red fiona))
(assert (rough gary))

; Rules
; All round, furry people are red
(assert (forall ((p Person)) (=> (and (round p) (furry p)) (red p))))
; All nice, red people are furry
(assert (forall ((p Person)) (=> (and (nice p) (red p)) (furry p))))
; All red people are round
(assert (forall ((p Person)) (=> (red p) (round p))))
; If someone is furry and cold then they are rough
(assert (forall ((p Person)) (=> (and (furry p) (cold p)) (rough p))))
; Round people are furry
(assert (forall ((p Person)) (=> (round p) (furry p))))
; All furry people are red
(assert (forall ((p Person)) (=> (furry p) (red p))))
; If Dave is nice and Dave is furry then Dave is green
(assert (=> (and (nice dave) (furry dave)) (green dave)))
; If Anne is red then Anne is nice
(assert (=> (red anne) (nice anne)))

; Test question: Is Anne furry?
(assert (furry anne))

; Verification
(check-sat)
(get-model)