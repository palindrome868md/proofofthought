; Sorts
(declare-sort Person 0)
(declare-sort Film 0)
(declare-sort City 0)
(declare-sort Country 0)

; Predicates / Functions
(declare-fun directed (Person Film) Bool)
(declare-fun is-filmmaker (Person) Bool)
(declare-fun is-documentary (Film) Bool)
(declare-fun is-film (Film) Bool)

; Constants
(declare-const lana Person)

(declare-const after-tiller Film)
(declare-const the-departure Film)
(declare-const miss-americana Film)

(declare-const kirkland City)
(declare-const usa Country)

; Relationships
(declare-fun from (Person) City)
(declare-fun located-in (City) Country)
(declare-fun from-country (Person) Country)

; Facts from the premises
(assert (directed lana after-tiller))
(assert (directed lana the-departure))
(assert (directed lana miss-americana))

; After Tiller is a documentary
(assert (is-documentary after-tiller))
; The documentary is a type of film
(assert (forall ((f Film)) (=> (is-documentary f) (is-film f))))

; If a film is directed by a person, the person is a filmmaker
(assert (forall ((p Person) (f Film)) (=> (directed p f) (is-filmmaker p))))

; Lana is from Kirkland; Kirkland is a US city
(assert (= (from lana) kirkland))
(assert (= (located-in kirkland) usa))

; If a person is from a city in a country, the person is from the country
(assert (forall ((p Person) (c City) (co Country))
  (=> (and (= (from p) c)
           (= (located-in c) co))
      (= (from-country p) co))))

; Negation of the query to test entailment: Lana is NOT a US filmmaker
(assert (not (is-filmmaker lana)))

; Check satisfiability to determine truth of the statement
(check-sat)