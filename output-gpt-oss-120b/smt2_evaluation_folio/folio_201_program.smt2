;-----------------------------------------------------------------
; Sort declarations
(declare-sort Person 0)
(declare-sort Film 0)
(declare-sort City 0)
(declare-sort Country 0)

;-----------------------------------------------------------------
; Predicate/function declarations
(declare-fun Directed (Person Film) Bool)          ; person directed a film
(declare-fun Filmmaker (Person) Bool)              ; person is a filmmaker
(declare-fun Documentary (Film) Bool)              ; film is a documentary
(declare-fun FilmPred (Film) Bool)                 ; film is a film (used for hierarchy)
(declare-fun From (Person City) Bool)              ; person is from a city
(declare-fun CityInCountry (City Country) Bool)    ; city lies in a country
(declare-fun FromCountry (Person Country) Bool)    ; person is from a country

;-----------------------------------------------------------------
; Constants (the individuals mentioned)
(declare-const lana-wilson Person)
(declare-const after-tiller Film)
(declare-const the-departure Film)
(declare-const miss-americana Film)
(declare-const kirkland City)
(declare-const US Country)

;-----------------------------------------------------------------
; Knowledge base (premises)

; Lana Wilson directed three films
(assert (Directed lana-wilson after-tiller))
(assert (Directed lana-wilson the-departure))
(assert (Directed lana-wilson miss-americana))

; Rule: directing a film makes the person a filmmaker
(assert (forall ((p Person) (f Film))
  (=> (Directed p f) (Filmmaker p))))

; After Tiller is a documentary
(assert (Documentary after-tiller))

; Rule: every documentary is a film
(assert (forall ((f Film))
  (=> (Documentary f) (FilmPred f))))

; Lana Wilson is from Kirkland
(assert (From lana-wilson kirkland))

; Kirkland is a US city
(assert (CityInCountry kirkland US))

; Rule: being from a city that is in a country makes the person from that country
(assert (forall ((p Person) (c City) (co Country))
  (=> (and (From p c) (CityInCountry c co))
      (FromCountry p co))))

;-----------------------------------------------------------------
; Statement to verify: "Lana Wilson is a US filmmaker."
(assert (and (Filmmaker lana-wilson)
             (FromCountry lana-wilson US)))

;-----------------------------------------------------------------
; Check the statement
(check-sat)
(get-model)