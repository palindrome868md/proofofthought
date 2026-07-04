; 1. Declare the uninterpreted sort for persons
(declare-sort Person 0)

; 2. Declare predicates (functions returning Bool)
(declare-fun is-czech (Person) Bool)
(declare-fun choral-conductor (Person) Bool)
(declare-fun musician (Person) Bool)
(declare-fun loves-music (Person) Bool)
(declare-fun published-in-year (Person Int) Bool)

; 3. Declare the constant representing Miroslav Venhoda
(declare-const miroslav Person)

; 4. Knowledge base (premises)

; 4.1 Miroslav is Czech and a choral conductor
(assert (is-czech miroslav))
(assert (choral-conductor miroslav))

; 4.2 Every choral conductor is a musician
(assert (forall ((p Person))
          (=> (choral-conductor p) (musician p))))

; 4.3 Some musician loves music (existential fact, expressed via a witness)
(declare-const music_lover Person)
(assert (and (musician music_lover) (loves-music music_lover)))

; 4.4 Miroslav published a book in 1946
(assert (published-in-year miroslav 1946))

; 5. Statement to be verified:
;    “A Czech published a book in 1946.”
;    → there exists a Person who is Czech and has a book published in 1946.
(assert (exists ((p Person))
          (and (is-czech p) (published-in-year p 1946))))

; 6. Ask Z3 whether the constraints are consistent
(check-sat)
(get-model)