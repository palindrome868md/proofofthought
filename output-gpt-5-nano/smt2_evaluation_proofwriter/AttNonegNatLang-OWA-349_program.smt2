(declare-sort Person 0)

; Constants
(declare-const bob Person)
(declare-const charlie Person)
(declare-const dave  Person)
(declare-const gary   Person)

; Predicates
(declare-fun Round (Person) Bool)
(declare-fun Kind  (Person) Bool)
(declare-fun Cold  (Person) Bool)
(declare-fun Big   (Person) Bool)
(declare-fun Rough (Person) Bool)
(declare-fun Nice  (Person) Bool)
(declare-fun Red   (Person) Bool)
(declare-fun Green (Person) Bool)
(declare-fun Blue  (Person) Bool)
(declare-fun Young (Person) Bool)
(declare-fun Down  (Person) Bool)

; Facts
(assert (Round bob))
(assert (Kind bob))

(assert (Young charlie))
(assert (Cold charlie))

(assert (Round dave))
(assert (Rough dave))
(assert (Big dave))

(assert (Nice gary))
(assert (Kind gary))
(assert (Red gary))
(assert (Green gary))
(assert (Cold gary))

; Rules
(assert (forall ((p Person)) (=> (and (Kind p) (Down p) (Blue p)) (Rough p))))
(assert (forall ((p Person)) (=> (and (Kind p) (Nice p)) (Green p))))
(assert (forall ((p Person)) (=> (and (Red p) (Rough p)) (Young p))))
(assert (forall ((p Person)) (=> (and (Red p) (Green p)) (Cold p))))
(assert (forall ((p Person)) (=> (and (Young p) (Kind p)) (Rough p))))
(assert (forall ((p Person)) (=> (and (Nice p) (Green p)) (Big p))))
(assert (forall ((p Person)) (=> (and (Big p) (Green p)) (Blue p))))

; Test: Is Gary young?
(assert (Young gary))

(check-sat)
(get-model)