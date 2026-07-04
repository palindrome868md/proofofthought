; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-czech (Person) Bool)
(declare-fun is-choral-conductor (Person) Bool)
(declare-fun is-musician (Person) Bool)
(declare-fun loves-music (Person) Bool)
(declare-fun published-book-1946 (Person) Bool)

; 3. Declare constants
(declare-const miroslav-venhoda Person)
(declare-const some-musician Person)

; 4. Assert knowledge base (facts)
; Premise 1: Miroslav Venhoda was a Czech choral conductor
(assert (is-czech miroslav-venhoda))
(assert (is-choral-conductor miroslav-venhoda))

; Premise 2: Any choral conductor is a musician
(assert (forall ((p Person))
  (=> (is-choral-conductor p) (is-musician p))))

; Premise 3: Some musicians love music
(assert (is-musician some-musician))
(assert (loves-music some-musician))

; Premise 4: Miroslav Venhoda published a book in 1946
(assert (published-book-1946 miroslav-venhoda))

; 5. Test Scenario: "A Czech published a book in 1946."
; To verify this statement, we assert that there exists a person (Miroslav Venhoda) 
; who is Czech and published a book in 1946.
(assert (and (is-czech miroslav-venhoda) (published-book-1946 miroslav-venhoda)))

; 6. Check satisfiability
; sat = True (The statement is consistent with the premises)
; unsat = False (The statement contradicts the premises)
(check-sat)
(get-model)