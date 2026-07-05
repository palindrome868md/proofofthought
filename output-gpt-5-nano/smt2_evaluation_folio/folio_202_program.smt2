; Sorts
(declare-sort Person 0)
(declare-sort Film 0)
(declare-sort City 0)
(declare-sort Country 0)

; Constants
(declare-const lana-wilson Person)
(declare-const kirkland City)
(declare-const usa Country)

; Film constants
(declare-const after-tiller Film)
(declare-const the-departure Film)
(declare-const miss-americana Film)

; Predicates / functions
(declare-fun director (Film) Person)
(declare-fun is-filmmaker (Person) Bool)
(declare-fun is-documentary (Film) Bool)
(declare-fun is-film (Film) Bool)
(declare-fun from-city (Person) City)
(declare-fun from-country (Person) Country)
(declare-fun city-in-country (City Country) Bool)

; 1) Lana directed the three films
(assert (= (director after-tiller) lana-wilson))
(assert (= (director the-departure) lana-wilson))
(assert (= (director miss-americana) lana-wilson))

; 2) If a film is directed by a person, the person is a filmmaker
(assert (forall ((f Film) (p Person)) (=> (= (director f) p) (is-filmmaker p))))

; 3) After Tiller is a documentary
(assert (is-documentary after-tiller))

; 4) The documentary is a type of film
(assert (forall ((f Film)) (=> (is-documentary f) (is-film f))))

; 5) Lana from Kirkland
(assert (= (from-city lana-wilson) kirkland))

; 6) Kirkland is a US city
(assert (city-in-country kirkland usa))

; 7) If a person is from a city in a country, the person is from the country
(assert (forall ((p Person)) (=> (and (= (from-city p) kirkland) (city-in-country kirkland usa)) (= (from-country p) usa))))

; 8) Statement to verify: "Miss Americana is not directed by a filmmaker from Kirkland."
; Translate: there does not exist a person p such that p directs Miss Americana, p is a filmmaker, and p is from Kirkland
(assert (not (exists ((p Person)) (and (= (director miss-americana) p) (is-filmmaker p) (= (from-city p) kirkland)))))

; Check the assertion
(check-sat)
(get-model)