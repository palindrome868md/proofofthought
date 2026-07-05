; Question: Would an ethics professor teach a class on Cezanne?

; Sorts
(declare-sort Person 0)
(declare-sort Topic 0)

; Constants
(declare-const cezanne Topic)

; Predicates
(declare-fun is-ethics-professor (Person) Bool)
(declare-fun teaches (Person Topic) Bool)

; Existential witness to test possibility
(declare-const witness Person)

; Knowledge base (minimal): check if there exists a person who is an ethics professor and teaches Cezanne
(assert (and (is-ethics-professor witness) (teaches witness cezanne)))

; Test: Would such a person exist? (Yes -> sat)
(check-sat)