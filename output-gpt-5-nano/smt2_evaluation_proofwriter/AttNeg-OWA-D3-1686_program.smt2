; Problem: Erin not blue

(declare-sort Person 0)

(declare-const bob Person)
(declare-const erin Person)
(declare-const fiona Person)

(declare-fun cold (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun nice (Person) Bool)

; Facts
(assert (cold bob))
(assert (rough erin))
(assert (kind fiona))

; Rules
; If blue -> round
(assert (forall ((p Person)) (=> (blue p) (round p))))
; If nice -> blue
(assert (forall ((p Person)) (=> (nice p) (blue p))))
; All rough -> nice
(assert (forall ((p Person)) (=> (rough p) (nice p))))
; All rough and blue -> cold
(assert (forall ((p Person)) (=> (and (rough p) (blue p)) (cold p))))
; If Fiona not round -> Fiona cold
(assert (=> (not (round fiona)) (cold fiona)))
; If cold and rough -> kind
(assert (forall ((p Person)) (=> (and (cold p) (rough p)) (kind p))))

; Test: Erin not blue
(assert (not (blue erin)))

(check-sat)