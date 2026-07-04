; Encoding of the premises and query

(declare-sort Person 0)

; Predicates
(declare-fun is-czech (Person) Bool)
(declare-fun choral-conductor (Person) Bool)
(declare-fun published_in_year (Person Int) Bool)
(declare-fun musician (Person) Bool)

; Constant representing Miroslav Venhoda
(declare-const miroslav-venhoda Person)

; Knowledge base
(assert (is-czech miroslav-venhoda))
(assert (choral-conductor miroslav-venhoda))

; Rule: Any choral conductor is a musician
(assert (forall ((p Person)) (=> (choral-conductor p) (musician p))))

; Fact: Miroslav Venhoda published a book in 1946
(assert (published_in_year miroslav-venhoda 1946))

; Test: There exists a Czech who published a book in 1946
(assert (not (exists ((p Person)) (and (is-czech p) (published_in_year p 1946)))))

(check-sat)