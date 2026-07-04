;--------------------------------------------------------------
;  Sort declarations
;--------------------------------------------------------------
(declare-sort Person 0)
(declare-sort Film 0)
(declare-sort City 0)
(declare-sort Country 0)

;--------------------------------------------------------------
;  Function (predicate) declarations
;--------------------------------------------------------------
(declare-fun directed (Person Film) Bool)          ; person directed a film
(declare-fun filmmaker (Person) Bool)              ; person is a filmmaker
(declare-fun documentary (Film) Bool)              ; film is a documentary
(declare-fun film (Film) Bool)                     ; film is a (generic) film
(declare-fun from (Person City) Bool)              ; person is from a city
(declare-fun city (City) Bool)                     ; term denotes a city
(declare-fun inCountry (City Country) Bool)        ; city lies in a country
(declare-fun fromCountry (Person Country) Bool)    ; person is from a country

;--------------------------------------------------------------
;  Constant declarations (individuals)
;--------------------------------------------------------------
(declare-const lana-wilson Person)
(declare-const after-tiller Film)
(declare-const the-departure Film)
(declare-const miss-americana Film)
(declare-const kirkland City)
(declare-const us Country)

;--------------------------------------------------------------
;  Knowledge base (premises)
;--------------------------------------------------------------

; 1. Lana Wilson directed the three films
(assert (directed lana-wilson after-tiller))
(assert (directed lana-wilson the-departure))
(assert (directed lana-wilson miss-americana))

; 2. If a film is directed by a person, the person is a filmmaker
(assert (forall ((p Person) (f Film))
          (=> (directed p f) (filmmaker p))))

; 3. After Tiller is a documentary
(assert (documentary after-tiller))

; 4. Every documentary is a film
(assert (forall ((f Film)) (=> (documentary f) (film f))))

; 5. Lana Wilson is from Kirkland
(assert (from lana-wilson kirkland))

; 6. Kirkland is a US city
(assert (city kirkland))
(assert (inCountry kirkland us))

; 7. If a person is from a city in a country, the person is from the country
(assert (forall ((p Person) (c City) (cn Country))
          (=> (and (from p c) (city c) (inCountry c cn))
              (fromCountry p cn))))

; 8. After Tiller is nominated for the Independent Spirit Award for Best Documentary
; (the award information is irrelevant for the target statement, so we omit it)

;--------------------------------------------------------------
;  Statement to be verified:
; "Miss Americana is not directed by a filmmaker from Kirkland."
; This is encoded as the negation of the existence of a person
; who (a) is a filmmaker, (b) is from Kirkland, and (c) directed Miss Americana.
;--------------------------------------------------------------
(assert (not (exists ((p Person))
               (and (filmmaker p)
                    (from p kirkland)
                    (directed p miss-americana)))))

;--------------------------------------------------------------
;  Check the consistency of the knowledge base together with the statement.
;  If the result is UNSAT, the statement is false (i.e., the opposite
;  situation is forced by the premises).  If the result is SAT, the
;  statement is true.
;--------------------------------------------------------------
(check-sat)
(get-model)