; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Film 0)
(declare-sort City 0)

; 2. Declare constants
(declare-const lana-wilson Person)
(declare-const miss-americana Film)
(declare-const after-tiller Film)
(declare-const the-departure Film)
(declare-const kirkland City)

; 3. Declare functions
(declare-fun directed (Film Person) Bool)
(declare-fun is-filmmaker (Person) Bool)
(declare-fun from-city (Person) City)

; 4. Assert knowledge base (facts)
; Premise: Lana Wilson directed After Tiller, The Departure, and Miss Americana.
(assert (directed after-tiller lana-wilson))
(assert (directed the-departure lana-wilson))
(assert (directed miss-americana lana-wilson))

; Premise: If a film is directed by a person, the person is a filmmaker.
(assert (forall ((f Film) (p Person))
  (=> (directed f p) (is-filmmaker p))))

; Premise: Lana Wilson is from Kirkland.
(assert (= (from-city lana-wilson) kirkland))

; Premise: Kirkland is a US city. (Modeled as city property, though not strictly needed for the query)
; Premise: If a person is from a city in a country, the person is from the country. (Irrelevant for 'from Kirkland' query)
; Premise: After Tiller is a documentary / nominated for award. (Irrelevant for Miss Americana query)

; 5. Assert the statement to be verified
; Statement: Miss Americana is not directed by a filmmaker from Kirkland.
; Logical Form: NOT (EXISTS p. directed(miss-americana, p) AND is-filmmaker(p) AND from-city(p) == kirkland)
; We assert this statement to check if it is consistent with the Knowledge Base.
; If (check-sat) returns 'unsat', the statement contradicts the KB (Statement is False).
; If (check-sat) returns 'sat', the statement is consistent (Statement is True).
(assert (not (exists ((p Person))
  (and (directed miss-americana p)
       (is-filmmaker p)
       (= (from-city p) kirkland)))))

; 6. Check satisfiability
(check-sat)
(get-model)