; Question: Would a Deacon be likely to be a fan of the podcast 'God Awful Movies'?

; Sorts
(declare-sort Person 0)
(declare-sort Podcast 0)

; Constants
(declare-const god_awful_movies Podcast)

; Predicates
(declare-fun is-deacon (Person) Bool)
(declare-fun is-fan-of (Person Podcast) Bool)

; Test subject (a concrete deacon)
(declare-const test-deacon Person)

; Knowledge base (no constraints preventing a deacon from being a fan)
(assert (is-deacon test-deacon))

; Test scenario: there exists a deacon who is a fan of God Awful Movies
(assert (is-fan-of test-deacon god_awful_movies))

; Check satisfiability to determine if such a scenario is possible
(check-sat)