; Declarations
(declare-sort Person 0)
(declare-datatypes () ((Style Renaissance Baroque)))
(declare-fun is-choral-conductor (Person) Bool)
(declare-fun is-musician (Person) Bool)
(declare-fun specialized (Person Style) Bool)
(declare-fun loves-music (Person) Bool)
(declare-const miroslav-venhoda Person)
(declare-fun published-book (Person Int) Bool)

; Knowledge base
(assert (is-choral-conductor miroslav-venhoda))
(assert (specialized miroslav-venhoda Renaissance))
(assert (specialized miroslav-venhoda Baroque))

; Rule: Any choral conductor is a musician
(assert (forall ((p Person)) (=> (is-choral-conductor p) (is-musician p))))

; Some musicians love music
(assert (exists ((p Person)) (and (is-musician p) (loves-music p))))

; Book published in 1946
(assert (published-book miroslav-venhoda 1946))

; Test: No choral conductor specialized in Renaissance
(assert (forall ((p Person)) (=> (is-choral-conductor p) (not (specialized p Renaissance)))))

; Check satisfiability to answer the question
(check-sat)