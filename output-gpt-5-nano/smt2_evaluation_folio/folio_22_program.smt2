(declare-sort Person 0)

(declare-datatypes () ((MusicStyle Renaissance Baroque)))

(declare-const miroslav-venhoda Person)

(declare-fun choral-conductor (Person) Bool)
(declare-fun is-musician (Person) Bool)
(declare-fun specializes (Person MusicStyle) Bool)

; Facts from premises
(assert (choral-conductor miroslav-venhoda))
(assert (specializes miroslav-venhoda Renaissance))
(assert (specializes miroslav-venhoda Baroque))

; Rule: Any choral conductor is a musician
(assert (forall ((p Person)) (=> (choral-conductor p) (is-musician p))))

; Test statement: No choral conductor specialized in Renaissance.
(assert (forall ((p Person)) (=> (choral-conductor p) (not (specializes p Renaissance)))))

(check-sat)
(get-model)