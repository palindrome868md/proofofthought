; Declare sorts
(declare-sort Person 0)

; Declare predicates (uninterpreted relations)
(declare-fun Blue (Person) Bool)
(declare-fun Green (Person) Bool)
(declare-fun Red (Person) Bool)
(declare-fun Rough (Person) Bool)
(declare-fun Cold (Person) Bool)
(declare-fun Young (Person) Bool)
(declare-fun Quiet (Person) Bool)

; Declare constants
(declare-const Charlie Person)
(declare-const Dave Person)
(declare-const Erin Person)
(declare-const Harry Person)

; Knowledge base (facts)
(assert (Blue Charlie))
(assert (Green Charlie))

(assert (Rough Dave))

(assert (not (Cold Erin)))
(assert (Green Erin))
(assert (Rough Erin))
(assert (Young Erin))

(assert (Green Harry))
(assert (Red Harry))
(assert (Rough Harry))
(assert (not (Young Harry)))

; Rules
; All rough people are red
(assert (forall ((p Person)) (=> (Rough p) (Red p))))
; If someone is blue then they are rough
(assert (forall ((p Person)) (=> (Blue p) (Rough p))))
; All green people are rough
(assert (forall ((p Person)) (=> (Green p) (Rough p))))
; If someone is quiet then they are cold
(assert (forall ((p Person)) (=> (Quiet p) (Cold p))))
; If Harry is blue then Harry is green
(assert (=> (Blue Harry) (Green Harry)))
; If Dave is blue and Dave is red then Dave is quiet
(assert (=> (and (Blue Dave) (Red Dave)) (Quiet Dave)))
; Rough, red people are blue
(assert (forall ((p Person)) (=> (and (Rough p) (Red p)) (Blue p))))
; Green, cold people are not quiet
(assert (forall ((p Person)) (=> (and (Green p) (Cold p)) (not (Quiet p)))))
; Cold people are not young
(assert (forall ((p Person)) (=> (Cold p) (not (Young p)))))

; Test: Charlie is not red
(assert (not (Red Charlie)))

; Check satisfiability to answer the question
(check-sat)