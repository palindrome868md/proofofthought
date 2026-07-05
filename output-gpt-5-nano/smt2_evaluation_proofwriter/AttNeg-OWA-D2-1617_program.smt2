; Declare sorts
(declare-sort Person 0)

; Declare predicates (uninterpreted functions)
(declare-fun Big (Person) Bool)
(declare-fun Green (Person) Bool)
(declare-fun Round (Person) Bool)
(declare-fun Quiet (Person) Bool)
(declare-fun Blue (Person) Bool)
(declare-fun Rough (Person) Bool)
(declare-fun Red (Person) Bool)

; Declare constants
(declare-const gary Person)

; Knowledge base (facts)
(assert (Big gary))
(assert (Green gary))
(assert (Round gary))

; Rules (universal)
(assert (forall ((p Person)) (=> (and (Big p) (Green p)) (Quiet p))))
(assert (forall ((p Person)) (=> (and (Blue p) (Big p)) (not (Rough p)))))
(assert (forall ((p Person)) (=> (and (Round p) (Green p)) (Rough p))))
(assert (forall ((p Person)) (=> (and (Big p) (Round p)) (Rough p))))
(assert (forall ((p Person)) (=> (and (Green p) (Blue p)) (Red p))))
(assert (forall ((p Person)) (=> (Rough p) (Round p))))
(assert (forall ((p Person)) (=> (and (Round p) (Quiet p)) (not (Red p)))))
(assert (forall ((p Person)) (=> (and (Round p) (Blue p)) (Green p))))

; Test scenario: Gary is not round
(assert (not (Round gary)))

; Check satisfiability -> answers the question
(check-sat)