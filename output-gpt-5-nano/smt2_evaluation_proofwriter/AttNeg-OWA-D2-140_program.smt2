; Sorts
(declare-sort Person 0)

; Constants
(declare-const dave Person)
(declare-const fiona Person)

; Predicates
(declare-fun nice (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun green (Person) Bool)

; Knowledge base
; Facts
(assert (nice dave))
(assert (quiet fiona))

; Rules
; If something is red and cold then it is quiet
(assert (forall ((x Person)) (=> (and (red x) (cold x)) (quiet x))))
; If Fiona is quiet and Fiona is blue then Fiona is round
(assert (=> (and (quiet fiona) (blue fiona)) (round fiona)))
; Nice and green things are red
(assert (forall ((x Person)) (=> (and (nice x) (green x)) (red x))))
; If something is nice then it is not blue
(assert (forall ((x Person)) (=> (nice x) (not (blue x)))))

; If Dave is not blue then Dave is round
(assert (=> (not (blue dave)) (round dave)))
; If Dave is red and Dave is not round then Dave is not quiet
(assert (=> (and (red dave) (not (round dave))) (not (quiet dave))))

; Query: Dave is not round
(assert (not (round dave)))

; Check satisfiability
(check-sat)
(get-model)