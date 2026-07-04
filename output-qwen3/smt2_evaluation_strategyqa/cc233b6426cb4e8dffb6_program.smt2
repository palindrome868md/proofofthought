; Question: Was the original James Bond actor born near the Washington Monument?
; Original James Bond actor: Sean Connery
; Sean Connery birthplace: Edinburgh, Scotland
; Washington Monument location: Washington D.C., USA
; Expected answer: NO (Edinburgh is NOT near Washington D.C.)

; Declare sorts
(declare-sort Person 0)
(declare-sort City 0)
(declare-sort Country 0)

; Declare functions
(declare-fun is-original-bond-actor (Person) Bool)
(declare-fun birthplace (Person) City)
(declare-fun city-in-country (City Country) Bool)
(declare-fun is-near (City City) Bool)
(declare-fun distance-miles (City City) Int)

; Declare constants
(declare-const sean-connery Person)
(declare-const edinburgh City)
(declare-const washington-dc City)
(declare-const scotland Country)
(declare-const usa Country)

; Knowledge Base: Sean Connery is the original Bond actor
(assert (is-original-bond-actor sean-connery))

; Knowledge Base: Sean Connery was born in Edinburgh, Scotland
(assert (= (birthplace sean-connery) edinburgh))
(assert (city-in-country edinburgh scotland))

; Knowledge Base: Washington Monument is in Washington D.C., USA
(assert (city-in-country washington-dc usa))

; Knowledge Base: Scotland and USA are different countries
(assert (distinct scotland usa))

; Knowledge Base: Cities in different countries are not "near" each other
; (near means within 100 miles for this context)
(assert (forall ((c1 City) (c2 City) (country1 Country) (country2 Country))
  (=> (and (city-in-country c1 country1)
           (city-in-country c2 country2)
           (distinct country1 country2))
      (not (is-near c1 c2)))))

; Knowledge Base: Edinburgh to Washington D.C. distance is approximately 3300 miles
(assert (= (distance-miles edinburgh washington-dc) 3300))

; Knowledge Base: "Near" means less than 100 miles
(assert (forall ((c1 City) (c2 City))
  (=> (is-near c1 c2)
      (< (distance-miles c1 c2) 100))))

; TEST: Was the original Bond actor born near Washington Monument?
; We test by asserting the claim is TRUE and checking satisfiability
; If unsat, the claim is FALSE (he was NOT born near Washington Monument)
(assert (is-near (birthplace sean-connery) washington-dc))

; Check satisfiability
(check-sat)
; Expected: unsat (meaning NO, he was not born near the Washington Monument)

(get-model)