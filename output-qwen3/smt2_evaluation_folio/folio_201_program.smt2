; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Film 0)
(declare-sort City 0)
(declare-sort Country 0)

; 2. Declare constants
(declare-const lana-wilson Person)
(declare-const after-tiller Film)
(declare-const the-departure Film)
(declare-const miss-americana Film)
(declare-const kirkland City)
(declare-const usa Country)

; 3. Declare functions (predicates)
(declare-fun directed (Person Film) Bool)
(declare-fun is-filmmaker (Person) Bool)
(declare-fun from-city (Person City) Bool)
(declare-fun city-in-country (City Country) Bool)
(declare-fun from-country (Person Country) Bool)
(declare-fun is-us-filmmaker (Person) Bool)

; 4. Assert knowledge base (premises)

; Lana Wilson directed After Tiller, The Departure, and Miss Americana
(assert (directed lana-wilson after-tiller))
(assert (directed lana-wilson the-departure))
(assert (directed lana-wilson miss-americana))

; If a film is directed by a person, the person is a filmmaker
(assert (forall ((p Person) (f Film))
  (=> (directed p f) (is-filmmaker p))))

; After Tiller is a documentary (Implicitly a Film by sort declaration)
; The documentary is a type of film (Handled by sort Film)

; Lana Wilson is from Kirkland
(assert (from-city lana-wilson kirkland))

; Kirkland is a US city
(assert (city-in-country kirkland usa))

; If a person is from a city in a country, the person is from the country
(assert (forall ((p Person) (c City) (co Country))
  (=> (and (from-city p c) (city-in-country c co))
      (from-country p co))))

; Definition: A US filmmaker is a filmmaker from the USA
(assert (forall ((p Person))
  (=> (and (is-filmmaker p) (from-country p usa))
      (is-us-filmmaker p))))

; 5. Verify Statement: "Lana Wilson is a US filmmaker"
; We assert the statement and check for satisfiability.
; sat = True (Statement is consistent/entailed)
; unsat = False (Statement contradicts KB)
(assert (is-us-filmmaker lana-wilson))

; 6. Check satisfiability
(check-sat)
(get-model)