; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Book 0)

; 2. Declare predicates (functions)
(declare-fun is-czech (Person) Bool)
(declare-fun is-choral-conductor (Person) Bool)
(declare-fun is-musician (Person) Bool)
(declare-fun loves-music (Person) Bool)
(declare-fun published (Person Book Int) Bool)

; 3. Declare constants (names, books)
(declare-const miroslav-venhoda Person)
(declare-const gregorian-chant Book)
(declare-const test-czech Person)
(declare-const test-book Book)
(declare-const some-musician Person)

; 4. Knowledge base (premises)
; Premise: Miroslav Venhoda is a Czech
(assert (is-czech miroslav-venhoda))
; Premise: Miroslav Venhoda is a choral conductor
(assert (is-choral-conductor miroslav-venhoda))

; Rule: Any choral conductor is a musician
(assert (forall ((p Person)) (=> (is-choral-conductor p) (is-musician p))))

; Premise: Some musicians love music
(assert (is-musician some-musician))
(assert (loves-music some-musician))

; Premise: Miroslav Venhoda published a book in 1946
(assert (published miroslav-venhoda gregorian-chant 1946))

; Premise: The statement to test is "A Czech published a book in 1946."
; Create a witness that is Czech and published a book in 1946
(assert (is-czech test-czech))
(assert (published test-czech test-book 1946))

; 5. Check satisfiability to verify the statement
(check-sat)
(get-model)