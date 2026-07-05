; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun furry (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)

; Declare constants (individuals)
(declare-const Charlie Person)
(declare-const Fiona   Person)
(declare-const Harry   Person)

; Facts about Charlie
(assert (furry Charlie))
(assert (rough Charlie))
(assert (white Charlie))
(assert (young Charlie))

; Facts about Fiona
(assert (nice Fiona))
(assert (red Fiona))
(assert (round Fiona))
(assert (white Fiona))
(assert (young Fiona))

; Facts about Harry
(assert (nice Harry))
(assert (red Harry))
(assert (round Harry))

; Rules
; All young and white things are rough
(assert (forall ((p Person))
  (=> (and (young p) (white p)) (rough p))))
; All round things are white
(assert (forall ((p Person))
  (=> (round p) (white p))))
; All white things are young
(assert (forall ((p Person))
  (=> (white p) (young p))))

; Test: Is Harry young?
(assert (young Harry))

; Verification
(check-sat)
(get-model)