; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const Fiona Person)
(declare-const Gary Person)

; Declare predicates
(declare-fun green (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun furry (Person) Bool
)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)

; Knowledge base facts
(assert (green Fiona))
(assert (rough Fiona))
(assert (smart Fiona))

(assert (blue Gary))
(assert (furry Gary))
(assert (nice Gary))
(assert (red Gary))

; Universal rules / properties
(assert (forall ((p Person)) (=> (and (rough p) (green p)) (nice p))))
(assert (forall ((p Person)) (=> (nice p) (rough p))))
(assert (forall ((p Person)) (=> (blue p) (red p))))
(assert (forall ((p Person)) (=> (and (green p) (blue p)) (nice p))))
(assert (forall ((p Person)) (=> (and (blue p) (red p)) (furry p))))
(assert (forall ((p Person)) (=> (and (red p) (rough p)) (blue p))))
(assert (forall ((p Person)) (=> (and (green p) (furry p)) (blue p))))
(assert (=> (green Fiona) (red Fiona)))

; Test: Fiona is not blue
(assert (not (blue Fiona)))

; Check satisfiability
(check-sat)