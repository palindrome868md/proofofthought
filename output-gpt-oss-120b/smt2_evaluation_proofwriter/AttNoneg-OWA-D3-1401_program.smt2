; Declare the sort for all individuals
(declare-sort Person 0)

; Declare unary predicates (properties) as Boolean‑valued functions
(declare-fun cold (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)

; Declare the individuals mentioned in the story
(declare-const Charlie Person)
(declare-const Dave Person)
(declare-const Erin Person)

; ---------- Knowledge base (facts) ----------
(assert (cold Charlie))
(assert (furry Charlie))
(assert (green Charlie))
(assert (red Charlie))
(assert (round Charlie))
(assert (smart Charlie))
(assert (white Charlie))

(assert (cold Dave))
(assert (green Dave))

(assert (furry Erin))

; ---------- General rules ----------
; 1. Green people are round.
(assert (forall ((p Person))
  (=> (green p) (round p))))

; 2. Smart and green people are white.
(assert (forall ((p Person))
  (=> (and (smart p) (green p)) (white p))))

; 3. Round people are smart.
(assert (forall ((p Person))
  (=> (round p) (smart p))))

; ---------- Query ----------
; Is Dave round?
(assert (round Dave))

; Check the query
(check-sat)
(get-model)