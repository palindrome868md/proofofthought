(declare-sort Person 0)

; Predicates
(declare-fun furry (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun cold (Person) Bool)

; Constants
(declare-const erin Person)
(declare-const charlie Person)
(declare-const fiona Person)

; Facts about Charlie
(assert (furry charlie))
(assert (round charlie))
(assert (young charlie))

; Facts about Erin
(assert (furry erin))
(assert (rough erin))

; Facts about Fiona
(assert (rough fiona))
(assert (round fiona))

; Rules / Knowledge base
; Kind -> Cold
(assert (forall ((p Person)) (=> (kind p) (cold p))))
; Big -> Round
(assert (forall ((p Person)) (=> (big p) (round p))))
; Rough and Furry -> Big
(assert (forall ((p Person)) (=> (and (rough p) (furry p)) (big p))))
; Kind and Young -> Cold
(assert (forall ((p Person)) (=> (and (kind p) (young p)) (cold p))))
; If Erin is round and Erin is furry then Erin is cold
(assert (=> (and (round erin) (furry erin)) (cold erin)))
; Big -> Kind
(assert (forall ((p Person)) (=> (big p) (kind p))))
; If Fiona is Cold then Fiona is Rough
(assert (=> (cold fiona) (rough fiona)))
; If Fiona is Furry and Rough then Fiona is Round
(assert (=> (and (furry fiona) (rough fiona)) (round fiona)))

; Test: Erin is not cold
(assert (not (cold erin)))

; Check satisfiability
(check-sat)
(get-model)