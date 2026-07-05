(declare-sort Person 0)

; Individuals
(declare-const bob Person)
(declare-const fiona Person)
(declare-const gary Person)
(declare-const harry Person)

; Predicates (unary properties)
(declare-fun Big (Person) Bool)
(declare-fun Kind (Person) Bool)
(declare-fun Red (Person) Bool)
(declare-fun Blue (Person) Bool)
(declare-fun Cold (Person) Bool)
(declare-fun Young (Person) Bool)
(declare-fun Rough (Person) Bool)

; Facts about individuals
(assert (Big bob))
(assert (Kind bob))
(assert (Red bob))

(assert (Big fiona))
(assert (Cold fiona))
(assert (Kind fiona))
(assert (Red fiona))
(assert (Young fiona))

(assert (Blue gary))
(assert (Cold gary))
(assert (Kind gary))
(assert (Red gary))
(assert (Rough gary))
(assert (Young gary))

(assert (Blue harry))

; Rules
; All red -> blue
(assert (forall ((p Person)) (=> (Red p) (Blue p))))
; Blue -> Young
(assert (forall ((p Person)) (=> (Blue p) (Young p))))
; Red and Young -> Cold
(assert (forall ((p Person)) (=> (and (Red p) (Young p)) (Cold p))))

; Test: "Harry is not young."
(assert (not (Young harry)))

(check-sat)