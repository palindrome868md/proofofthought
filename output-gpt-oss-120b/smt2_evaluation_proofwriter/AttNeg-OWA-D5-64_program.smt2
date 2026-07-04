;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates (functions returning Bool) -----------------
(declare-fun quiet (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun big   (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun round (Person) Bool)

;--- Individuals -------------------------------------------
(declare-const anne Person)
(declare-const bob  Person)
(declare-const erin Person)
(declare-const fiona Person)

;--- Facts -------------------------------------------------
(assert (quiet anne))
(assert (smart anne))
(assert (white anne))
(assert (not (young anne)))

(assert (young bob))

(assert (not (young erin)))

(assert (big fiona))
(assert (quiet fiona))
(assert (red fiona))
(assert (smart fiona))

;--- General Rules -----------------------------------------
; White people are quiet
(assert (forall ((p Person))
  (=> (white p) (quiet p))))

; If someone is young then they are big
(assert (forall ((p Person))
  (=> (young p) (big p))))

; Young, smart people are round
(assert (forall ((p Person))
  (=> (and (young p) (smart p)) (round p))))

; Smart, quiet people are round
(assert (forall ((p Person))
  (=> (and (smart p) (quiet p)) (round p))))

; All quiet, big people are red
(assert (forall ((p Person))
  (=> (and (quiet p) (big p)) (red p))))

; If Anne is big and Anne is young then Anne is round
(assert (=> (and (big anne) (young anne)) (round anne)))

; Big people are smart
(assert (forall ((p Person))
  (=> (big p) (smart p))))

; All smart people are white
(assert (forall ((p Person))
  (=> (smart p) (white p))))

;--- Claim to verify ---------------------------------------
; Claim: Bob is not quiet
(assert (not (quiet bob)))

;--- Check consistency ------------------------------------
(check-sat)
(get-model)